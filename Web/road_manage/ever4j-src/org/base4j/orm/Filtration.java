package org.base4j.orm;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.StringUtils;
import org.ever4j.utils.TimeUtil;

/**
 * 过滤条件
 * 
 *
 */
public class Filtration implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String OR = "_OR_";
	public static final String AND = "_AND_";//因为or使用比较广泛，and功能暂时没有实现

	private String fieldName = null;
	private Object fieldValue = null;
	private Class<?> fieldType = null;
	private MatchType matchType = null;
	private String[] fieldNames = null;
	private Object[] fieldValues = null;
	private Class<?>[] fieldTypes = null;
	private MatchType[] matchTypes = null;
	
	private class Conent{
		public String fieldName = null;
		public Object fieldValue = null;
		public Class<?> fieldType = null;
		public MatchType matchType = null;
		public Conent(String fieldName, Object fieldValue, Class<?> fieldType,
				MatchType matchType) {
			super();
			this.fieldName = fieldName;
			this.fieldValue = fieldValue;
			this.fieldType = fieldType;
			this.matchType = matchType;
		}
		
	}
	
	private boolean multi = false;
	/**
	 * 构造方法(主要用于页面传值，并由WebUtils调用)
	 * @param filterName 比较属性字符串,含待比较的比较类型、属性值类型及属性列表. 如： LIKES_NAME_OR_EMAIL
	 * @param filterValue 待比较的值.
	 */
	public Filtration(String filterName, String filterValue)
	{
		Filtration.Conent c = generateContent(filterName,filterValue);
		this.fieldName = c.fieldName;
		this.fieldType = c.fieldType;
		this.matchType = c.matchType;
		this.fieldValue = c.fieldValue;
		multi=false;
	}
	private Conent generateContent(String filterName, String filterValue) {
		String condition = StringUtils.substringBefore(filterName, "_");//条件
		String matchTypeCode = condition.substring(0, condition.length() - 1);//获取比较类型
		String fieldTypeCode = condition.substring(condition.length() - 1, condition.length());//获取值的类型
		MatchType matchType = Enum.valueOf(MatchType.class, matchTypeCode);
		Class<?> fieldType = Enum.valueOf(FiledType.class, fieldTypeCode).getValue();

		String fieldName = StringUtils.substringAfter(filterName, "_");

		Object value = null;
		if("D".equals(fieldTypeCode)){
			value = TimeUtil.parseDate(filterValue);
		}else if("IN".equals(matchTypeCode) || "NOTIN".equals(matchTypeCode)){
			value = convertArray(filterValue,fieldType);
		}else{
			value = ConvertUtils.convert(filterValue, fieldType);//转换字符串到相应类型.
		}
		
		return  new Filtration.Conent(fieldName, value,  fieldType, matchType);
		
	}
	/**
	 * 构造方法(主要用于手动构造条件，条件间为 OR的关系)
	 * @param filterName 比较属性字符串,含待比较的比较类型、属性值类型及属性列表. 如： LIKES_NAME_OR_EQS_EMAIL
	 * @param filterValue 待比较的值 与条件名称一一对应.例如 zhangsan_OR_zs@163.com
	 */
	public Filtration(String filterNames[], String filterValues[])
	{
		int size = filterNames.length;
		
		if(size==1){
			Filtration.Conent c = generateContent(filterNames[0],filterValues[0]);
			this.fieldName = c.fieldName;
			this.fieldType = c.fieldType;
			this.matchType = c.matchType;
			this.fieldValue = c.fieldValue;
			multi=false;
		}else{
			this.fieldNames = new String[size];
			this.fieldValues = new Object[size];
			this.fieldTypes = new Class<?>[size];
			this.matchTypes = new MatchType[size];
			for (int i = 0; i < size; i++) {
				Filtration.Conent c = generateContent(filterNames[i],filterValues[i]);
				
				this.fieldNames[i] = c.fieldName;
				this.fieldTypes[i] = c.fieldType;
				this.matchTypes[i] = c.matchType;
				this.fieldValues[i] = c.fieldValue;
			}
			multi=true;
		}
	}

	
	private Object convertArray(String filterValue, Class<?> fieldType2) {
		String[] vv = filterValue.split(",");
		
		Object[] oo = new Object[vv.length];
		for (int i = 0; i < vv.length; i++) {
			oo[i] = ConvertUtils.convert(vv[i], fieldType2);
		}
		return oo;
	}


//	/**
//	 * 构造方法(主要用于自定义过滤条件)
//	 * @param matchType 比较类型
//	 * @param fieldValue 待比较的值.
//	 * @param fieldNames 字段名称
//	 */
//	public Filtration(MatchType matchType, Object[] fieldValue, String... fieldNames)
//	{
//		this.matchType = matchType;
//		this.fieldValue = fieldValue;
//		this.fieldNames = fieldNames;
//	}

	/**
	 * 是否比较多个属性.
	 */
	public boolean isMultiFilter()
	{
		return multi;
	}

	/**
	 * 获取多个字段名称.
	 * @return
	 */
	public String[] getFieldNames()
	{
		return fieldNames;
	}

	/**
	 * 获取唯一字段名称.
	 */
	public String getFieldName()
	{
		
		return fieldName;
	}

	/**
	 * 获取比较类型
	 * @return
	 */
	public MatchType getMatchType()
	{
		return matchType;
	}
	/**
	 * 获取比较类型
	 * @return
	 */
	public MatchType[] getMatchTypes()
	{
		return matchTypes;
	}

	/**
	 * 获取字段值
	 * @return
	 */
	public Object getFieldValue()
	{
		return fieldValue;
	}
	/**
	 * 获取字段值
	 * @return
	 */
	public Object[] getFieldValues()
	{
		return fieldValues;
	}

	/**
	 * 比较类型
	 */
	public enum MatchType
	{
		EQ, // =
		LIKE, // like
		LT, // <
		LE, // <=
		GT, // >
		GE, // >=
		IN, // in
		IS,
		ISNOT,
		NOTLIKE,
		NOTEQ,
		NOTIN;
		
	}

	/**
	 * 字段类型
	 */
	public enum FiledType
	{
		S(String.class), //字符串
		I(Integer.class), //整形
		L(Long.class), //长整形
		N(Double.class), //双精度
//		D(Timestamp.class), //时间
		D(Date.class), //时间
		B(Boolean.class),//布尔
		T(Byte.class);//byte

		private Class<?> clazz;

		FiledType(Class<?> clazz)
		{
			this.clazz = clazz;
		}

		public Class<?> getValue()
		{
			return clazz;
		}
	}

}
