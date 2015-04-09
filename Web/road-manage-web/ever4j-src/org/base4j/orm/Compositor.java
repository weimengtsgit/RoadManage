package org.base4j.orm;

import java.io.Serializable;

/**
 * 排序
 * 
 *
 */
public class Compositor implements Serializable 
{
	public static final String SORT_FIELD = "sort";
	private static final long serialVersionUID = 1L;
	private String fieldName;
	private CompositorType compositorType;

	/**
	 * 构造方法
	 * @param fieldName 字段名称
	 * @param compositorType 排序类型
	 */
	public Compositor(String fieldName, CompositorType compositorType)
	{
		this.fieldName = fieldName;
		this.compositorType = compositorType;
	}

	/**
	 * 获取字段名称.
	 */
	public String getFieldName()
	{
		return fieldName;
	}

	/**
	 * 获取排序类型.
	 */
	public CompositorType getCompositorType()
	{
		return compositorType;
	}

	/**
	 * 排序类型.
	 */
	public enum CompositorType
	{
		asc, //顺序
		desc;//倒序
	}

}
