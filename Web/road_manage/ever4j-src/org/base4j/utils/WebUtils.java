package org.base4j.utils;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
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
public class WebUtils
{
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
	public static Map getAttributesStartingWith(HttpServletRequest request, String prefix)
	{
		Enumeration paramNames = request.getAttributeNames();
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
				String value= (String)request.getAttribute(paramName);
				
				params.put(unprefixed, value);
				
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
		Map<String, String> filterParamMap2 = getAttributesStartingWith(request, filterPrefix);
		filterParamMap.putAll(filterParamMap2);
		allMap.putAll(filterParamMap2);

		//分析参数Map,构造PropertyFilter列表
		for (Map.Entry<String, String> entry : filterParamMap.entrySet())
		{
			String filterName = entry.getKey();
			String value = MyStringUtils.iso2utf(entry.getValue());
			//如果value值为空,则忽略此filter.
			if (StringUtils.isNotBlank(value))
			{
				
				Filtration filter = new Filtration(filterName.split(Filtration.OR), value.split(Filtration.OR));
				filtrationList.add(filter);
			}
		}
		
		
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
		String fieldNameAttr = (String) request.getAttribute("fieldName");
		String compositorTypeAttr = (String) request.getAttribute("compositorType");
		if(StringUtils.isNotBlank(fieldNameAttr) && StringUtils.isNotBlank(compositorTypeAttr)){
			fieldName = fieldNameAttr;
			compositorType = compositorTypeAttr;
		}
		if (StringUtils.isNotBlank(fieldName) && StringUtils.isNotBlank(compositorType))
		{
			Compositor compositor = new Compositor(fieldName, Enum.valueOf(CompositorType.class, compositorType));
			pageData.setCompositor(compositor);
		}else{  //默认按插入时间的倒叙排列
			if(pageData.getCompositor() == null){
				Compositor compositor = new Compositor("id", CompositorType.desc);
				pageData.setCompositor(compositor);
			}
		}
		//第三步：设置当前页
		String pageNoStr = request.getParameter("pageNo");
		String pageLength = request.getParameter("pageLength");
		if (StringUtils.isNotBlank(pageNoStr))
		{
			Integer pageNo = Integer.parseInt(pageNoStr);
			pageData.setPageNo(pageNo);
		}
		if (StringUtils.isNotBlank(pageLength))
		{
			Integer pageLengthNo = Integer.parseInt(pageLength);
			pageData.setPageSize(pageLengthNo);
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
		}else{  //默认按插入时间的倒叙排列
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
	
	public static void main(String args[])
	  {
	   Map<String, Object>  map =new HashMap<String, Object>();
	   Map<String, Object>  map1 =new HashMap<String, Object>();
	   
	   map.put("1",new Integer(1));
	   map.put("2", new Integer(2));
	   map1.put("2", new Integer(3));
	   map1.put("3", new Integer(4));
	   map.putAll(map1);
	   System.out.println(map1);
	   
	   System.out.println(map);
	  }
}
