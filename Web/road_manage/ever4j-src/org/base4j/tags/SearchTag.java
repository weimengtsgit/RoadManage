package org.base4j.tags;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.base4j.orm.Filtration;
import org.base4j.orm.Filtration.FiledType;
import org.base4j.orm.Filtration.MatchType;
import org.base4j.orm.PageData;
import org.ever4j.annotation.FieldConfig;
import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.utils.RandomUtil;
import org.ever4j.utils.StringUtil;

public class SearchTag extends TagSupport
{
	private static final long serialVersionUID = 1L;

	private String idName;
	private String className;
	private String styleName;
	private String matchType;
	private String fieldType;
	private String fieldList;
	private String fieldValue;
	private String clazz;
	private String field;
	private PageData pageData;
	@Override
	public int doStartTag() throws JspException{
		try{
			Enum.valueOf(MatchType.class, matchType);
		} catch (Exception e){
			throw new IllegalArgumentException("filter名称" + matchType + "没有按规则编写,无法得到属性比较类型.", e);
		}
		
		try{
			Enum.valueOf(FiledType.class, fieldType).getValue();
		} catch (RuntimeException e){
			throw new IllegalArgumentException("filter名称" + fieldType + "没有按规则编写,无法得到属性值类型.", e);
		}
		
		this.field=this.fieldList;
		if(pageData!=null){
			this.fieldValue = (String) pageData.getFiltraMap().get(matchType + fieldType + "_" + this.fieldList);
		}
//		if(pageData != null){
//			List filtraList = pageData.getFiltrations();
//			if(filtraList != null && filtraList.size() > 0){
//				for (int i = 0; i < filtraList.size(); i++) {
//					Filtration filtra = (Filtration)filtraList.get(i);
//					if(fieldList.equals(filtra.getFieldName())){
//						this.fieldValue=filtra.getFieldValue();
//					}
//				}
//			}
//		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {

		JspWriter out = pageContext.getOut();
		String enumType = null;
		String validate = null;
		StringBuilder html = new StringBuilder();
		try{
			//filter_LIKES_name_OR_email
			String name = "filter_" + matchType + fieldType + "_" + fieldList.replaceAll(",", Filtration.OR);
			String nameCode = " name=\"" + name + "\"";
			String idCode = (idName != null && !"".equals(idName)) ? " id=\"" + idName + "\"" : "";
			String classCode = (className != null && !"".equals(className)) ? " class=\"" + className + "\"" : "";
			String styleCode = (styleName != null && !"".equals(styleName)) ? " style=\"" + styleName + "\"" : "";
			String valueCode = (fieldValue != null && !"".equals(fieldValue)) ? " value=\"" + fieldValue + "\"" : "";
			
			if(clazz != null && !clazz.equals("") && field != null && !field.equals("") ){
				Class<?> curClazz = Class.forName(clazz);
				Field curField = curClazz.getDeclaredField(field);
				FieldConfig fieldConfig = curField.getAnnotation(FieldConfig.class);
				enumType = fieldConfig.enumType();
				validate = fieldConfig.valueField();
			}
			
			if(enumType != null && !enumType.equals("")){//枚举
				ServletContext application = pageContext.getServletContext();
				Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>) application.getAttribute(Constant.ENUM);
				List<EnumValuePojo> targetEnumList = enumMap.get(enumType);
				html.append("<select" + nameCode +idCode + classCode + styleCode+ "value='"+this.fieldValue+ "' >");
				html.append("<option value =\"\">-- 全部  --</option>");
				
				if(targetEnumList != null && targetEnumList.size() != 0){
					for (EnumValuePojo enumObj : targetEnumList) {
						String key = enumObj.getEnumKey();
						String val = enumObj.getEnumVal();
						if(val == null){
							val = "";
						}
						
						if(fieldValue != null && !fieldValue.equals("") && fieldValue.equals(key)){
							html.append("<option value =\""+key+"\" selected=\"selected\">"+val+"</option>");
						} else{
							html.append("<option value =\""+key+"\">"+val+"</option>");
						}
					}
				}
				html.append("</select>");
			}else if(validate != null && !validate.equals("")){//Lookup
				String id = RandomUtil.getRandomString(8);
//				String hiddenValue = getHiddenValue(field, fieldList);
//				String hiddenCode = "value=\"${"+hiddenValue+"}\"";
				html.append("<input id=\"" + id + "\" type=\"hidden\" name=\""+getHiddenName()+"\" value=\"\"/> ");
				html.append("<input type=\"text\"" + classCode + " name=\""+getInputName(validate)+"\" value=\"\" suggestFields=\""+validate+"\" ");
				html.append("suggestUrl=\""+getLookupUrl()+"\" lookupGroup=\""+field+"\" onchange=\"if(!this.value) document.getElementById('"+id+"').value=''\"/> ");
				html.append("<a class=\"btnLook\" href=\""+getLookupUrl()+"\" lookupGroup=\""+field+"\">查找带回</a>");
			}else{
				html.append("<input type=\"text\"" + idCode + nameCode + valueCode + classCode + styleCode + "/>");
			}
			out.write(html.toString());
		} catch (Exception e){
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public String getHiddenName(){
		return field+".id";
	}
	
	public String getHiddenValue(){
		String curClazz = "";
		if(clazz.indexOf(".") != -1){
			curClazz = clazz.substring(clazz.lastIndexOf(".")+1);
		}
		return StringUtil.convertInitial(curClazz)+"."+getHiddenName();
	}
	
	public String getInputName(String validate){
		return field + "." + validate;
	}
	
	public String getInputValue(String validate){
		String curClazz = clazz.substring(clazz.lastIndexOf(".")+1);
		return StringUtil.convertInitial(curClazz)+"."+getInputName(validate);
	}
	
	public String getLookupUrl(){
		
		try {
			Class<?> curClazz = Class.forName(clazz);
			Field curField = curClazz.getDeclaredField(field);
			Class<?> fieldClazz = curField.getType();
			String clazzName = fieldClazz.getName();
			String[] strArray = clazzName.split("[.]");
			return "${ctx}/"+strArray[2].trim()+"/"+StringUtil.convertInitial(strArray[4])+"/lookupList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "#";
	}
	
//	public String getHiddenValue(String field,String fieldList){
//		int flag = fieldList.indexOf(",");
//		String hiddenValue = StringUtil.convertInitial(field)+".";
//		if(flag != -1){
//			hiddenValue = hiddenValue + fieldList.substring(0, flag);
//		}else{
//			hiddenValue = hiddenValue + fieldList;
//		}
//		return hiddenValue;
//	}
	
	public String getMatchType(){
		return matchType;
	}

	public void setMatchType(String matchType){
		this.matchType = matchType.toUpperCase();
	}

	public String getFieldType(){
		return fieldType;
	}

	public void setFieldType(String fieldType){
		this.fieldType = fieldType.toUpperCase();
	}

	public String getFieldList(){
		return fieldList;
	}

	public void setFieldList(String fieldList){
		this.fieldList = fieldList;
	}

	public String getIdName(){
		return idName;
	}

	public void setIdName(String idName){
		this.idName = idName;
	}

	public String getClassName(){
		return className;
	}

	public void setClassName(String className){
		this.className = className;
	}

	public String getStyleName(){
		return styleName;
	}

	public void setStyleName(String styleName){
		this.styleName = styleName;
	}

	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public PageData getPageData() {
		return pageData;
	}

	public void setPageData(PageData pageData) {
		this.pageData = pageData;
	}
}
