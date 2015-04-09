package org.ever4j.main.tags;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import net.sf.json.JSONObject;

import org.ever4j.main.constant.Constant;
import org.ever4j.utils.RandomUtil;

public class EnumTag extends TagSupport{

	private static final long serialVersionUID = 1L;
	private static final String SELECT = "select";
	private static final String RADIO = "radio";
	private static final String CHECKBOX = "checkbox";
	
	private static final String EDIT = "edit";
	private static final String VIEW = "view";
	private static final String EDIT_IN_LIST = "editInList";
	private static final String JSONVIEW = "json";
	private static final String All = "all";
	
	private static final String EDIT_IN_LIST_ACTIVE_CSS = "ghbutton star active";
	private static final String EDIT_IN_LIST_CSS = "ghbutton star";
	
	private String enumName;
	private String enumKey;
	private String name;
	private String id;
	private String cssClass;
	private String cssStyle;
	private String defaultValue;
	private Boolean isTag;
	private Boolean isNull;
	private Boolean multiEnum ;
	private String inputType;
	private String onChange;
	private String onClick;
	private String disabled;
	private String tagType;
	private String href;
	private String title;
	
	private String attrs="";
	
	@Override
	public int doStartTag() throws JspException {
//		if(enumName.equals("")){
//			throw new IllegalArgumentException("enum:select标签[enumName]属性值不能为空！");
//		}
		return super.doStartTag();
	}

	@Override
	@SuppressWarnings("unchecked")
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		StringBuilder htmlSb = new StringBuilder("");
		ServletContext application = pageContext.getServletContext();
		Object obj = application.getAttribute(Constant.ENUM);
		Map<String, List<EnumValuePojo>> enumMap = null;
		if(obj != null){
			enumMap = (Map<String, List<EnumValuePojo>>) obj;
		}else{
			enumMap = new HashMap<String, List<EnumValuePojo>>();
		}
		
		
		
		
		String idCode = (id != null && !"".equals(id)) ? " id=\"" + id + "\"" : "";
		String nameCode = (name != null && !"".equals(name)) ? " name=\"" + name + "\"" : "";
		String classCode = (cssClass != null && !"".equals(cssClass)) ? " class=\"" + cssClass + "\"" : "";
		String styleCode = (cssStyle != null && !"".equals(cssStyle)) ? " style=\"" + cssStyle + "\"" : "";
		String onChangeCode = (onChange != null && !"".equals(onChange)) ? " onChange=\"" + onChange + "\"" : "";
		String onClickCode = (onClick != null && !"".equals(onClick)) ? " onClick=\"" + onClick + "\"" : "";
		String disabledCode = (disabled != null && !"".equals(disabled)) ? " disabled=\"" + disabled + "\"" : "";
		String hrefCode = (href != null && !"".equals(href)) ? " href=\"" + href : " href=\"#";
		String titleCode = (title != null && !"".equals(title)) ? " title=\"" + title + "\"" : "";
		attrs = " "+attrs+" ";
		List<EnumValuePojo> targetEnumList = enumMap.get(enumName);
		int targetEnumListSize = targetEnumList == null ? 0 : targetEnumList.size();
		boolean defFlag = ((defaultValue != null && !defaultValue.equals("")) && (enumKey == null || enumKey.equals("")));
		boolean keyFlag = ((enumKey != null && !enumKey.equals("")) && (defaultValue == null || defaultValue.equals("")));
		boolean defKeyFlag = ((defaultValue != null && !defaultValue.equals("")) && (enumKey != null && !enumKey.equals("")));
		boolean nullFlag = ((defaultValue == null || defaultValue.equals("")) && (enumKey == null || enumKey.equals("")));
		
		boolean tagTypeFlag = tagType != null && !tagType.equals("");
		boolean isTagFlag = isTag != null && !isTag.equals("");
		
		//先判断tagType标签再判断isTag标签
		if(tagTypeFlag && tagType.equalsIgnoreCase(EDIT)){//EDIT页面
			
			createEditPage(targetEnumListSize, nameCode, idCode, classCode, styleCode, onChangeCode,onClickCode, disabledCode, targetEnumList, nullFlag, defFlag, keyFlag, defKeyFlag, htmlSb);
		}else if(tagTypeFlag && tagType.equalsIgnoreCase(EDIT_IN_LIST)){//EDIT_IN_LIST页面
			
			createEditInListPage(hrefCode, targetEnumListSize, targetEnumList, defFlag, keyFlag, htmlSb);
		}else if((tagTypeFlag && tagType.equalsIgnoreCase(VIEW)) || (isTagFlag && !isTag)){//查看、列表页面
			
			createViewPage(targetEnumListSize, targetEnumList, defFlag, keyFlag, href, titleCode, classCode, htmlSb);
		}else if((tagTypeFlag && tagType.equalsIgnoreCase(JSONVIEW)) ){// 生成 json 字符串
			
			createJSONPage(targetEnumList, htmlSb);
		}else if((isTagFlag && isTag) || (!tagTypeFlag && !isTagFlag)){//EDIT页面
			
			createEditPage(targetEnumListSize, nameCode, idCode, classCode, styleCode, onChangeCode,onClickCode, disabledCode, targetEnumList, nullFlag, defFlag, keyFlag, defKeyFlag,htmlSb);
		} 
		
		try {
			out.write(htmlSb.toString());
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return super.doEndTag();
	}

	/**
	 * 创建select标签
	 * @param nameCode
	 * @param idCode
	 * @param classCode
	 * @param styleCode
	 * @param onChangeCode
	 * @param disabledCode
	 * @param targetEnumList
	 * @param defFlag
	 * @param keyFlag
	 * @param htmlSb
	 */
	public void createSelectTag(String nameCode, String idCode, String classCode, String styleCode, String onChangeCode,String onClickCode, String disabledCode, List<EnumValuePojo> targetEnumList,boolean defFlag, boolean keyFlag, StringBuilder htmlSb){
		htmlSb.append("<select" + nameCode +idCode + classCode + styleCode + onChangeCode + onClickCode + disabledCode +attrs+ ">");
		if(isNull == null || isNull){
			htmlSb.append("<option value =\"\"></option>");
		}
		
		if(targetEnumList != null && targetEnumList.size() != 0){
			for (EnumValuePojo enumObj : targetEnumList) {
				String key = enumObj.getEnumKey();
				String val = enumObj.getEnumVal();
				if(val == null){
					val = "";
				}
				
				if(defFlag && defaultValue.equals(key)){
					htmlSb.append("<option value =\""+key+"\" selected=\"selected\">"+val+"</option>");
				} else if(keyFlag && enumKey.equals(key)){
					htmlSb.append("<option value =\""+key+"\" selected=\"selected\">"+val+"</option>");
				}else{
					htmlSb.append("<option value =\""+key+"\">"+val+"</option>");
				}
			}
		}
		htmlSb.append("</select>");
	}
	
	/**
	 * 创建单选标签
	 * @param nameCode
	 * @param classCode
	 * @param styleCode
	 * @param onChangeCode
	 * @param disabledCode
	 * @param targetEnumList
	 * @param nullFlag
	 * @param defFlag
	 * @param keyFlag
	 * @param htmlSb
	 */
	public void createrRadioTag(String nameCode, String classCode, String styleCode, String onChangeCode,String onClickCode, String disabledCode, List<EnumValuePojo> targetEnumList,boolean nullFlag, boolean defFlag, boolean keyFlag, boolean defKeyFlag, StringBuilder htmlSb){
		String publicHtml = "<input type='radio'" + nameCode + classCode + styleCode + onChangeCode +onClickCode + disabledCode;
//		
//		for(int i = 0; i < targetEnumList.size(); i ++){
//			EnumValuePojo enumObj = targetEnumList.get(i);
//			String key = enumObj.getEnumKey();
//			String val = enumObj.getEnumVal();
//			if(val == null){
//				val = "";
//			}
//			String idVal = RandomUtil.getRandomString(3);
//			if(nullFlag && i == 0){
//				htmlSb.append(publicHtml + " value=\""+key+"\" checked=\"checked\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
//			}else if(defFlag && defaultValue.equals(key)){
//				htmlSb.append(publicHtml + " value=\""+key+"\" checked=\"checked\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
//			}else if((keyFlag || defKeyFlag) && enumKey.equals(key)){
//				htmlSb.append(publicHtml + " value=\""+key+"\" checked=\"checked\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
//			}else{
//				htmlSb.append(publicHtml + " value=\""+key+"\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
//			}
//		}
		
		htmlSb.append("<div class='radio-list'>");
		for(int i = 0; i < targetEnumList.size(); i ++){
			EnumValuePojo enumObj = targetEnumList.get(i);
			String key = enumObj.getEnumKey();
			String val = enumObj.getEnumVal();
			if(val == null){
				val = "";
			}
			htmlSb.append("<label class='radio-inline'>");
			if((nullFlag && i == 0) || (defFlag && defaultValue.equals(key)) || ((keyFlag || defKeyFlag) && enumKey.equals(key))){
				htmlSb.append(publicHtml+" value='"+key+"' checked='checked' />"+val);
			}else{
				htmlSb.append( publicHtml+" value='"+key+"' />"+val);
			}
			htmlSb.append("</label>");
		}
		htmlSb.append("</div>");
		
		
		
	}
	
	/**
	 * 创建多选标签
	 * @param nameCode
	 * @param classCode
	 * @param styleCode
	 * @param onChangeCode
	 * @param disabledCode
	 * @param targetEnumList
	 * @param defFlag
	 * @param keyFlag
	 * @param htmlSb
	 */
	public void createCheckboxTag(String nameCode, String classCode, String styleCode, String onChangeCode, String onClickCode, String disabledCode, List<EnumValuePojo> targetEnumList,boolean defFlag, boolean keyFlag, StringBuilder htmlSb){
		String publicHtml = "<input type=\"checkbox\"" + nameCode + classCode + styleCode + onChangeCode + onClickCode + disabledCode;
		for(int i = 0; i < targetEnumList.size(); i ++){
			EnumValuePojo enumObj = targetEnumList.get(i);
			String key = enumObj.getEnumKey();
			String val = enumObj.getEnumVal();
			if(val == null){
				val = "";
			}
			
			String idVal = RandomUtil.getRandomString(3);
			if(defFlag){//修改-defaultValue
				List<String> keys = Arrays.asList(defaultValue.split(","));
				if(keys.contains(key)){
					htmlSb.append(publicHtml + " value=\""+key+"\" checked=\"checked\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
				}else{
					htmlSb.append(publicHtml + " value=\""+key+"\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
				}
			}else if(keyFlag){//修改-enumKey
				List<String> keys = Arrays.asList(enumKey.split(","));
				if(keys.contains(key)){
					htmlSb.append(publicHtml + " value=\""+key+"\" checked=\"checked\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
				}else{
					htmlSb.append(publicHtml + " value=\""+key+"\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
				}
			}else{//新增
				htmlSb.append(publicHtml + " value=\""+key+"\" id=\""+idVal+"\"><label for=\""+idVal+"\" style=\"float: none;\">"+val+"</label></input>");
			}
		}
	}
	
	/**
	 * 创建Edit页面
	 * @param targetEnumListSize
	 * @param nameCode
	 * @param idCode
	 * @param classCode
	 * @param styleCode
	 * @param onChangeCode
	 * @param disabledCode
	 * @param targetEnumList
	 * @param nullFlag
	 * @param defFlag
	 * @param keyFlag
	 * @param htmlSb
	 */
	public void createEditPage(int targetEnumListSize, String nameCode, String idCode, String classCode, String styleCode, String onChangeCode,String onClickCode,String disabledCode, List<EnumValuePojo> targetEnumList,boolean nullFlag, boolean defFlag, boolean keyFlag, boolean defKeyFlag, StringBuilder htmlSb){
		if(targetEnumListSize != 0){
			
			if(multiEnum != null && multiEnum){//多选框-->默认false
				
				createCheckboxTag(nameCode, classCode, styleCode, onChangeCode, onClickCode,disabledCode, targetEnumList, defFlag, keyFlag, htmlSb);
			}else{
				
				if(inputType == null || inputType.equals("") || inputType.equalsIgnoreCase(SELECT)){//下拉框
					
					createSelectTag(nameCode, idCode, classCode, styleCode, onChangeCode,onClickCode, disabledCode, targetEnumList, defFlag, keyFlag, htmlSb);
				}else if(inputType.equalsIgnoreCase(RADIO)){//单选
					
					createrRadioTag(nameCode, classCode, styleCode, onChangeCode,onClickCode, disabledCode, targetEnumList, nullFlag, defFlag, keyFlag, defKeyFlag, htmlSb);
				}else if(inputType.equalsIgnoreCase(CHECKBOX)){//多选
					
					createCheckboxTag(nameCode, classCode, styleCode, onChangeCode,onClickCode, disabledCode, targetEnumList, defFlag, keyFlag, htmlSb);
				}
			}
		}
	}
	
	/**
	 * 创建View页面
	 * @param targetEnumListSize
	 * @param targetEnumList
	 * @param defFlag
	 * @param keyFlag
	 * @param htmlSb
	 */
	public void createViewPage(int targetEnumListSize, List<EnumValuePojo> targetEnumList, boolean defFlag, boolean keyFlag, String href, String titleCode, String classCode, StringBuilder htmlSb){
		String val = "";
		if(targetEnumListSize != 0){
			for (EnumValuePojo enumObj : targetEnumList) {
				
				String key = enumObj.getEnumKey();
				if(defFlag){
					List<String> keys = Arrays.asList(defaultValue.split(","));
					if(keys.contains(key) && enumObj.getEnumVal() != null){
						if(val.equals("")){
							val = enumObj.getEnumVal();
						}else{
							val += ", " + enumObj.getEnumVal();
						}
					}
				}else if(keyFlag){
					List<String> keys = Arrays.asList(enumKey.split(","));
					if(keys.contains(key) && enumObj.getEnumVal() != null){
						if(val.equals("")){
							val = enumObj.getEnumVal();
						}else{
							val += ", " + enumObj.getEnumVal();
						}
					}
				}
			}
		}
		
		if(val.equals("") && defFlag){//如果没有找到值显示键
			val = (defaultValue == null || defaultValue.equalsIgnoreCase("null")) ? "" : defaultValue;
		}
		
		if(val.equals("") && keyFlag){
			val = (enumKey == null || enumKey.equalsIgnoreCase("null")) ? "" : enumKey;
		}
		
		if(href != null && !href.equals("")){
			htmlSb.append("<a href=\""+href+"\""+titleCode+ classCode +" target=\"dialog\" mask=\"true\">"+val+"</a>");
		}else{
			htmlSb.append(val);
		}
		
		//htmlSb.append("<input readonly=\"readonly\" type=\"text\" value=\""+val+"\" size=\"30\" class=\"textInput readonly valid\"");
	}
	
	/**
	 * 创建EditInList页面
	 * @param hrefCode
	 * @param targetEnumListSize
	 * @param targetEnumList
	 * @param defFlag
	 * @param keyFlag
	 * @param htmlSb
	 */
	public void createJSONPage( List<EnumValuePojo> targetEnumList,StringBuilder htmlSb){
		
		htmlSb.append("{");
		if(targetEnumList!=null ){
			EnumValuePojo enumObj ;
			for (int i=0;i<targetEnumList.size();i++) {
				enumObj = targetEnumList.get(i);
				String key = enumObj.getEnumKey();
				String value = enumObj.getEnumVal();
				if(i!=0){
					htmlSb.append(",");
				}
				htmlSb.append("\"").append(key).append("\"").append(":\"").append(value).append("\"");
			}
		}
		
		htmlSb.append("}");
	}
	/**
	 * 创建EditInList页面
	 * @param hrefCode
	 * @param targetEnumListSize
	 * @param targetEnumList
	 * @param defFlag
	 * @param keyFlag
	 * @param htmlSb
	 */
	public void createEditInListPage(String hrefCode, int targetEnumListSize, List<EnumValuePojo> targetEnumList, boolean defFlag, boolean keyFlag, StringBuilder htmlSb){
		String aActiveStart = "<a class=\""+EDIT_IN_LIST_ACTIVE_CSS+"\" href=\"#";
		String aStart = "<a target=\"ajaxTodo\" class=\""+EDIT_IN_LIST_CSS+"\"" + hrefCode;
		String aEnd = "</a>";
		
		StringBuilder val = new StringBuilder();
		if(targetEnumListSize != 0){
			for (EnumValuePojo enumObj : targetEnumList) {
				
				String key = enumObj.getEnumKey();
				if(defFlag){
					List<String> keys = Arrays.asList(defaultValue.split(","));
					if(keys.contains(key) && enumObj.getEnumVal() != null){
						val.insert(0,aActiveStart+"\">"+enumObj.getEnumVal()+aEnd);
						continue;
					}
				}else if(keyFlag){
					List<String> keys = Arrays.asList(enumKey.split(","));
					if(keys.contains(key) && enumObj.getEnumVal() != null){
						val.insert(0,aActiveStart+"\">"+enumObj.getEnumVal()+aEnd);
						continue;
					}
				}
				
				val.append(aStart+key+"\" title=\"确实要设置为"+enumObj.getEnumVal()+"吗？\">"+enumObj.getEnumVal()+aEnd);
			}
		}
		
		htmlSb.append(val);
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnumName() {
		return enumName;
	}

	public void setEnumName(String enumName) {
		this.enumName = enumName;
	}

	public String getEnumKey() {
		return enumKey;
	}

	public void setEnumKey(String enumKey) {
		this.enumKey = enumKey;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public Boolean getIsTag() {
		return isTag;
	}

	public void setIsTag(Boolean isTag) {
		this.isTag = isTag;
	}

	public Boolean getIsNull() {
		return isNull;
	}

	public void setIsNull(Boolean isNull) {
		this.isNull = isNull;
	}

	public String getCssStyle() {
		return cssStyle;
	}

	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}

	public Boolean getMultiEnum() {
		return multiEnum;
	}

	public void setMultiEnum(Boolean multiEnum) {
		this.multiEnum = multiEnum;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}

	public String getInputType() {
		return inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public String getTagType() {
		return tagType;
	}

	public void setTagType(String tagType) {
		this.tagType = tagType;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOnClick() {
		return onClick;
	}

	public void setOnClick(String onClick) {
		this.onClick = onClick;
	}

	public String getAttrs() {
		return attrs;
	}

	public void setAttrs(String attrs) {
		this.attrs = attrs;
	}
	
	
}
