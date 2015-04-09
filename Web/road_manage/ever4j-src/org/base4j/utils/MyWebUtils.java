package org.base4j.utils;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.tools.ant.types.FileList.FileName;
import org.base4j.orm.Compositor;
import org.base4j.orm.Compositor.CompositorType;
import org.base4j.orm.Filtration;
import org.base4j.orm.Filtration.MatchType;
import org.base4j.orm.PageData;

/**
 * web工具类
 * 
 *
 */
public class MyWebUtils{
	@SuppressWarnings("unchecked")
	public static Map getParametersStartingWith(HttpServletRequest request, String prefix)
	{
		Enumeration paramNames = request.getParameterNames();
		Map params = new TreeMap();
		if (prefix == null)
		{
			prefix = "";
		}
		while (paramNames != null && paramNames.hasMoreElements())
		{
			String paramName = (String) paramNames.nextElement();
			if ("".equals(prefix) || paramName.startsWith(prefix))
			{
				String unprefixed = paramName.substring(prefix.length());
				String[] values = request.getParameterValues(paramName);
				if (values == null || values.length == 0)
				{
					// Do nothing, no values found at all.
				} else if (values.length > 1)
				{
					params.put(unprefixed, values);
				} else
				{
					params.put(unprefixed, values[0]);
				}
			}
		}
		return params;
	}

	@SuppressWarnings("unchecked")
	public static List<Filtration> creatFiltrationList(HttpServletRequest request, String filterPrefix, PageData<?> pageData)
	{
		List<Filtration> filtrationList = new ArrayList<Filtration>();

		//从request中获取含属性前缀名的参数,构造去除前缀名后的参数Map.
		Map<String, String> filterParamMap = getParametersStartingWith(request, filterPrefix);
		Map<String, String> allMap = getParametersStartingWith(request, null);

		//分析参数Map,构造PropertyFilter列表
		for (Map.Entry<String, String> entry : filterParamMap.entrySet())
		{
			String filterName = entry.getKey();
			String value = MyStringUtils.iso2utf(entry.getValue());
			//如果value值为空,则忽略此filter.
			if (StringUtils.isNotBlank(value))
			{
				Filtration filter = new Filtration(filterName, value);
				filtrationList.add(filter);
			}
		}
//		Filtration filtration = new Filtration(MatchType.EQ, true, "visible");
//		filtrationList.add(filtration);
		pageData.setFiltrations(filtrationList);
		pageData.setFiltraMap(filterParamMap);
		pageData.setAllMap(allMap);
		return filtrationList;
	}
	
	public static void setPageDataParameter(HttpServletRequest request, PageData<?> pageData)
	{
		//第一步：设置过滤条件
		creatFiltrationList(request,"filter_",pageData);
		//第二不：设置排序条件
		String fieldName = request.getParameter("fieldName");
		String compositorType = request.getParameter("compositorType");
		if (StringUtils.isNotBlank(fieldName) && StringUtils.isNotBlank(compositorType))
		{
			Compositor compositor = new Compositor(fieldName, Enum.valueOf(CompositorType.class, compositorType));
			pageData.setCompositor(compositor);
		}else{  //默认按ID倒叙排列
			if(pageData.getCompositor() == null){
				Compositor compositor = new Compositor("id", CompositorType.desc);
				pageData.setCompositor(compositor);
			}
		}
		//第三步：设置当前页
		String pageNoStr = request.getParameter("pageNo");
		if (StringUtils.isNotBlank(pageNoStr))
		{
			Integer pageNo = Integer.parseInt(pageNoStr);
			pageData.setPageNo(pageNo);
		}
	}
	
	public static void setSearchParameter(HttpServletRequest request, PageData<?> pageData){
		//第一步：设置过滤条件
		creatFiltrationList(request,"filter_",pageData);
		//第二不：设置排序条件
		String fieldName = request.getParameter("fieldName");
		String compositorType = request.getParameter("compositorType");
		if (StringUtils.isNotBlank(fieldName) && StringUtils.isNotBlank(compositorType)){
			Compositor compositor = new Compositor(fieldName, Enum.valueOf(CompositorType.class, compositorType));
			pageData.setCompositor(compositor);
		}else{  //默认id倒叙排列
			if(pageData.getCompositor() == null){
				Compositor compositor = new Compositor("id", CompositorType.desc);
				pageData.setCompositor(compositor);
			}
		}
		//第三步：设置当前页
		String pageNoStr = request.getParameter("pageNo");
		if (StringUtils.isNotBlank(pageNoStr)){
			Integer pageNo = Integer.parseInt(pageNoStr);
			pageData.setPageNo(pageNo);
		}
		
		//第四步：设置查询条数
		String exportPageSize = request.getParameter("exportPageSize");
		pageData.setPageSize(StringUtils.isBlank(exportPageSize) ? 0 : Integer.parseInt(exportPageSize));
	}
	
	/**
	 * 组装过滤条件
	 */
	public static String getFilterCause(Class entity, PageData<?> pageData, Object[] fieldVals){
		//组装过滤条件
		StringBuilder sb = new StringBuilder();
		if(pageData != null && pageData.getFiltrations() != null){
			List<Filtration> filtrations = pageData.getFiltrations();
			sb.append("where 1=1 ");
			for (int i=0; i<filtrations.size(); i++) {
				Filtration filtration = filtrations.get(i);
				String fieldName = filtration.getFieldName();
				//反射拿到该属性在实体类上的注解
				if(fieldName!=null){
					try {
						fieldName = ReflectionUtils.getColumnName(entity.newInstance(), fieldName);
					} catch (InstantiationException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					}
				}
				Object fieldValue = filtration.getFieldValue();
				MatchType matchType = filtration.getMatchType();
				switch (matchType) {
				case EQ: // =
					sb.append("and ");
					sb.append(fieldName + " = ? ");
					fieldVals[i] = fieldValue;
					break;
				case LIKE: // like
					sb.append("and ");
					sb.append(fieldName + " like ? ");
					fieldVals[i] = "%"+fieldValue+"%";
					break;
				case LT: // <
					sb.append("and ");
					sb.append(fieldName + " < ? ");
					fieldVals[i] = fieldValue;
					break;
				case LE: // <=
					sb.append("and ");
					sb.append(fieldName + " <= ? ");
					fieldVals[i] = fieldValue;
					break;
				case GT: // >
					sb.append("and ");
					sb.append(fieldName + " > ? ");
					fieldVals[i] = fieldValue;
					break;
				case GE: // >=
					sb.append("and ");
					sb.append(fieldName + " >= ? ");
					fieldVals[i] = fieldValue;
					break;
				}
			}
		}
		return sb.toString();
	}
	
	/**
	 * 组装排序条件
	 */
	public static String getOrderCause(Class entity, PageData<?> pageData){
		//组装过滤条件
		StringBuilder sb = new StringBuilder();
		if(pageData != null && pageData.getCompositor() != null){
			Compositor compositor = pageData.getCompositor();
			String fieldName = compositor.getFieldName();
			//反射拿到该属性在实体类上的注解
			if(fieldName != null){
				try {
					fieldName = ReflectionUtils.getColumnName(entity.newInstance(), fieldName);
					return "order by id desc";
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}else{
				try {
					fieldName = ReflectionUtils.getColumnName(entity.newInstance(), fieldName);
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
			
			CompositorType compositorType = compositor.getCompositorType();
			sb.append("order by ");
			sb.append(fieldName);
			switch (compositorType) {
			case asc:
				sb.append(" asc");
				break;
			case desc:
				sb.append(" desc");
				break;
			}
		}
		return sb.toString();
	}
}
