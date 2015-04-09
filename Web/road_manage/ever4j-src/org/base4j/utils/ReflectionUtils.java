package org.base4j.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import org.ever4j.annotation.FieldConfig;
import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.utils.StringUtil;
import org.ever4j.utils.TimeUtil;

/**
 * 反射工具类
 * 
 *
 */
public class ReflectionUtils
{
	private static Logger logger = LoggerFactory.getLogger(ReflectionUtils.class);
	
	public static List<FieldObj> getShowFields(Object object){
		Assert.notNull(object, "object不能为空");
		
		List<FieldObj> showFields = new ArrayList<FieldObj>();
		Field[] fields = object.getClass().getDeclaredFields();
		
		if(fields != null && fields.length > 0){
			for (Field field : fields) {
				FieldConfig fieldConfig = field.getAnnotation(FieldConfig.class);
				if(fieldConfig != null){
					boolean showFlag = fieldConfig.isShowList();
					if(showFlag){
						FieldObj fieldObj = new FieldObj(fieldConfig.title(), field.getName(), field.getType().toString(), fieldConfig.enumType());
						showFields.add(fieldObj);
					}
				}
			}
		}
		
		return showFields;
	}
	
	/**
	 * 直接设置对象属性值, 无视private/protected修饰符, 不经过setter函数.
	 * @param object
	 * @param fieldName
	 * @param fieldValue
	 */
	@SuppressWarnings("unchecked")
	public static void setFieldValueByType(Object object, String fieldName, String fieldValue){
		Field field = getDeclaredField(object, fieldName);

		if (field == null){
			throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + object + "]");
		}

		makeAccessible(field);

		try{
			
			String type = field.getType().toString();//得到此属性的类型
			if(type.endsWith("String")){//判断枚举
				FieldConfig fieldConfig = field.getAnnotation(FieldConfig.class);
				if(fieldConfig != null){
					String enumTypeName = fieldConfig.enumType();
					if(StringUtils.isNotEmpty(enumTypeName)){
						HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
						ServletContext application = request.getSession().getServletContext();
						Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>) application.getAttribute(Constant.ENUM);
						
						
						List<EnumValuePojo> EnumValuePojos = enumMap.get(enumTypeName);
						if(EnumValuePojos != null && EnumValuePojos.size() > 0){
							for (EnumValuePojo enumValuePojo : EnumValuePojos) {
								if(enumValuePojo != null && fieldValue.equals(enumValuePojo.getEnumVal())){
									field.set(object, enumValuePojo.getEnumKey());
								}
							}
						}
					}else{
						field.set(object, fieldValue);
					}
				}
			}else if(type.equals("short") || type.endsWith("Short")){
				int pointIndex = fieldValue.indexOf(".");
				if(pointIndex != -1){
					fieldValue = fieldValue.substring(0,pointIndex);
				}
				field.set(object, Short.parseShort(fieldValue));
			}else if(type.equals("int") || type.endsWith("Integer")){
				int pointIndex = fieldValue.indexOf(".");
				if(pointIndex != -1){
					fieldValue = fieldValue.substring(0,pointIndex);
				}
				field.set(object, Integer.parseInt(fieldValue));
			}else if(type.equals("long") || type.endsWith("Long")){
				int pointIndex = fieldValue.indexOf(".");
				if(pointIndex != -1){
					fieldValue = fieldValue.substring(0,pointIndex);
				}
				field.set(object, Long.parseLong(fieldValue));
			}else if(type.equals("float") || type.endsWith("Float")){
				field.set(object, Float.parseFloat(fieldValue));
			}else if(type.equals("double") || type.endsWith("Double")){
				field.set(object, Double.parseDouble(fieldValue));
			}else if(type.equals("char") || type.endsWith("Character")){
				field.set(object, fieldValue.charAt(0));
			}else if(type.equals("boolean") || type.endsWith("Boolean")){
				field.set(object, Boolean.parseBoolean(fieldValue));
			}else if(type.endsWith("Date")){
				field.set(object, TimeUtil.parseDate(fieldValue));
			}
//			else{
//				field.set(object, fieldValue);
//			}
			
		} catch (IllegalAccessException e){
			logger.error("不可能抛出的异常:{}", e.getMessage());
		}
	}
	
	/**
	 * 拿到一个属性在实体类上的注解
	 */
	public static String getColumnName(Object object, String fieldName){
		Field field = getDeclaredField(object, fieldName);

		if (field == null){
			throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + object + "]");
		}
		
		Column columnConfig = field.getAnnotation(Column.class);
		
		if(columnConfig != null){
			String column_name = columnConfig.name();
			return column_name;
		}
		return StringUtil.convertStr(fieldName);
	}
	
	/**
	 * 循环向上转型, 获取对象的DeclaredField的字段名.
	 * @param object
	 * @param fieldDesc
	 * @return 如向上转型到Object仍无法找到, 返回null.
	 */
	public static String getDeclaredFieldName(Object object, String fieldDesc){
		
		Assert.notNull(object, "object不能为空");
		Assert.hasText(fieldDesc, "fieldDesc");
		
		for (Class<?> clazz = object.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()){
			try{
				Field[] fields = clazz.getDeclaredFields();
				for (Field field : fields) {
					FieldConfig fieldConfig = field.getAnnotation(FieldConfig.class);
					if(fieldConfig != null && fieldDesc.equals(fieldConfig.title())){
						return field.getName();
					}
					
				}
			} catch (Exception e){
				// Field不在当前类定义,继续向上转型
			}
		}
		return null;
	}
	
	/**
	 * 根据字段名，获得在该字段的类型
	 */
	public static String getFieldType(Object object, String fieldName){
		Field field = getDeclaredField(object, fieldName);

		if (field == null){
			throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + object + "]");
		}

		makeAccessible(field);
		
		//获得字段类型
		String type = field.getType().toString();
		if(type.equals("short") || type.endsWith("Short")){
			return "Short";
		}else if(type.equals("int") || type.endsWith("Integer")){
			return "Integer";
		}else if(type.equals("long") || type.endsWith("Long")){
			return "Long";
		}else if(type.equals("float") || type.endsWith("Float")){
			return "Float";
		}else if(type.equals("double") || type.endsWith("Double")){
			return "Double";
		}else if(type.equals("char") || type.endsWith("Character")){
			return "Character";
		}else if(type.equals("boolean") || type.endsWith("Boolean")){
			return "Boolean";
		}else if(type.endsWith("Date")){
			return "Date";
		}
		return null;
	}
	
	/**
	 * 循环向上转型, 获取对象的DeclaredField.
	 * @param object
	 * @param fieldName
	 * @return 如向上转型到Object仍无法找到, 返回null.
	 */
	public static Field getDeclaredField(Object object, String fieldName)
	{
		Assert.notNull(object, "object不能为空");
		Assert.hasText(fieldName, "fieldName");
		for (Class<?> clazz = object.getClass(); clazz != Object.class; clazz = clazz.getSuperclass())
		{
			try
			{
				return clazz.getDeclaredField(fieldName);
			} catch (NoSuchFieldException e)
			{
				// Field不在当前类定义,继续向上转型
			}
		}
		return null;
	}

	/**
	 * 循环向上转型, 获取对象的DeclaredMethod.
	 * @param object
	 * @param methodName
	 * @param parameterTypes
	 * @return 如向上转型到Object仍无法找到, 返回null.
	 */
	private static Method getDeclaredMethod(Object object, String methodName, Class<?>[] parameterTypes)
	{
		Assert.notNull(object, "object不能为空");
		Assert.hasText(methodName, "methodName");

		for (Class<?> clazz = object.getClass(); clazz != Object.class; clazz = clazz.getSuperclass())
		{
			try
			{
				return clazz.getDeclaredMethod(methodName, parameterTypes);
			} catch (NoSuchMethodException e)
			{
				// Method不在当前类定义,继续向上转型
			}
		}
		return null;
	}

	/**
	 * 直接读取对象属性值, 无视private/protected修饰符, 不经过getter函数.
	 * @param object
	 * @param fieldName
	 * @return
	 */
	public static Object getFieldValue(Object object, String fieldName)
	{
		Field field = getDeclaredField(object, fieldName);

		if (field == null)
		{
			throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + object + "]");
		}

		makeAccessible(field);

		Object result = null;
		try
		{
			result = field.get(object);
		} catch (IllegalAccessException e)
		{
			logger.error("不可能抛出的异常{}", e.getMessage());
		}
		return result;
	}

	/**
	 * 直接设置对象属性值, 无视private/protected修饰符, 不经过setter函数.
	 * @param object
	 * @param fieldName
	 * @param fieldValue
	 */
	public static void setFieldValue(Object object, String fieldName, Object fieldValue)
	{
		Field field = getDeclaredField(object, fieldName);

		if (field == null)
		{
			throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + object + "]");
		}

		makeAccessible(field);

		try
		{
			field.set(object, fieldValue);
		} catch (IllegalAccessException e)
		{
			logger.error("不可能抛出的异常:{}", e.getMessage());
		}
	}

	/**
	 * 直接调用对象方法, 无视private/protected修饰符.
	 * @param object
	 * @param methodName
	 * @param parameterTypes
	 * @param parameterValues
	 * @return
	 */
	public static Object invokeMethod(Object object, String methodName, Class<?>[] parameterTypes, Object[] parameterValues)
	{
		Method method = getDeclaredMethod(object, methodName, parameterTypes);

		if (method == null)
		{
			throw new IllegalArgumentException("Could not find method [" + methodName + "] on target [" + object + "]");
		}

		method.setAccessible(true);

		try
		{
			return method.invoke(object, parameterValues);
		} catch (Exception e)
		{
			throw convertReflectionExceptionToUnchecked(e);
		}
	}

	/**
	 * 调用Getter方法.
	 * @param object
	 * @param fieldName
	 * @return
	 */
	public static Object invokeGetterMethod(Object object, String fieldName)
	{
		String getterMethodName = "get" + StringUtils.capitalize(fieldName);
		return invokeMethod(object, getterMethodName, new Class[] {}, new Object[] {});
	}

	/**
	 * 调用Setter方法.
	 * @param target
	 * @param fieldName
	 * @param parameterValue
	 * @param parameterType 用于查找Setter方法,为空时使用value的Class替代.
	 */
	public static void invokeSetterMethod(Object target, String fieldName, Class<?> parameterType, Object parameterValue)
	{
		String setterMethodName = "set" + StringUtils.capitalize(fieldName);
		Class<?> type = (parameterType != null ? parameterType : parameterValue.getClass());
		invokeMethod(target, setterMethodName, new Class[] { type }, new Object[] { parameterValue });
	}

	/**
	 * 调用Setter方法.使用value的Class来查找Setter方法.
	 * @param target
	 * @param propertyName
	 * @param parameterValue
	 */
	public static void invokeSetterMethod(Object target, String propertyName, Object parameterValue)
	{
		invokeSetterMethod(target, propertyName, null, parameterValue);
	}

	/**
	 * 强行设置Field可访问.
	 */
	public static void makeAccessible(Field field)
	{
		if (!Modifier.isPublic(field.getModifiers()) || !Modifier.isPublic(field.getDeclaringClass().getModifiers()))
		{
			field.setAccessible(true);
		}
	}

	/**
	 *  通过反射, 获得Class定义中声明的父类的泛型参数的类型.
	 *  如无法找到, 返回Object.class.
	 * @param <T>
	 * @param clazz
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> Class<T> getSuperClassGenricType(Class clazz)
	{
		return getSuperClassGenricType(clazz, 0);
	}

	/**
	 * 通过反射, 获得定义Class时声明的父类的泛型参数的类型.
	 * 如无法找到, 返回Object.class.
	 * @param clazz
	 * @param index
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz, int index)
	{

		Type genType = clazz.getGenericSuperclass();

		if (!(genType instanceof ParameterizedType))
		{
			logger.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");
			return Object.class;
		} else
		{
			Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

			if (index >= params.length || index < 0)
			{
				logger.warn("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: " + params.length);
				return Object.class;
			}
			if (!(params[index] instanceof Class))
			{
				logger.warn(clazz.getSimpleName() + " not set the actual class on superclass generic parameter");
				return Object.class;
			}

			return (Class) params[index];
		}
	}

	/**
	 * 将反射时的checked exception转换为unchecked exception.
	 */
	public static RuntimeException convertReflectionExceptionToUnchecked(Exception e)
	{
		if (e instanceof IllegalAccessException || e instanceof IllegalArgumentException || e instanceof NoSuchMethodException)
		{
			return new IllegalArgumentException("Reflection Exception.", e);
		} else if (e instanceof InvocationTargetException)
		{
			return new RuntimeException("Reflection Exception.", ((InvocationTargetException) e).getTargetException());
		} else if (e instanceof RuntimeException)
		{
			return (RuntimeException) e;
		}
		return new RuntimeException("Unexpected Checked Exception.", e);
	}
}
