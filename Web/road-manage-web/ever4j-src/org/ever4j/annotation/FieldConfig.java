package org.ever4j.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)   	
@Target(ElementType.FIELD)
public @interface FieldConfig {
	
	/**
	 * 该实体字段的中文名称（必填项）
	 * @return
	 */
	String title();
	
	/**
	 * 该实体字段是否可以在list列表中展示，true：展示，false:不展示（默认展示）
	 * @return
	 */
	boolean isShowList() default true;
	
	/**
	 * 该实体字段是否可以再查询列表中展示，true：展示，false:不展示（默认展示）
	 * @return
	 */
	boolean isShowSearch() default true;
	
	/**
	 * 改实体字段是否可以在新增、修改菜单中显示，true：展示，false:不展示
	 */
	boolean isShowInput() default true;
	
	/**
	 * 若实体字段是外键，则应配置为所关联的对象的字段名（只有存在外键才填写）
	 * @return
	 */
	String valueField() default "";
	
	/**
	 * 若实体字段是字典表中的数据，则需要填写该字段
	 * @return
	 */
	String enumType() default "";
	
	/**
	 * 添加字段输入验证配置,两个验证条件之间用空格分隔，例如：
	 * 若非空验证，则填写：validate="required"
	 * 若非空且为邮件地址验证，则填写：validate="required email"
	 */
	String validate() default "";
	
	/**
	 * 若输入数字时，可以配置最小值验证
	 */
	int min() default 0;
	
	/**
	 * 若输入数字时，可以配置最大值验证
	 */
	int max() default Integer.MAX_VALUE;
	
	/**
	 * 若输入字符时，可以配置最小长度验证
	 */
	int minlength() default 0;
	
	/**
	 * 若输入字符时，可以配置最大值验证 ，当长度超过30后，自动使用<textarea/>
	 */
	int maxlength() default 30;
	
	/**
	 * 是否支持多选，true:支持，false:不支持；(默认不支持)。
	 * 注意：要配置该属性，则必须先配置enumType属性，否则将不能正常显示
	 */
	boolean multiEnum() default false;
	
	/**
	 * 当点击某个字段的时候，需要展示该字段关联的对象的集合时，可以用到该配置，应与fieldInChild属性联合使用
	 * @return
	 */
	Class childClass() default Object.class;
	/**
	 * 当点击某个字段的时候，需要展示该字段关联的对象的集合时，可以用到该配置 ,应该与childClass属性联合使用
	 * @return
	 */
	String fieldInChild() default "";
	
	/**
	 * 枚举的类型
	 */
	InputType inputType() default InputType.SELECT;
	
	enum InputType{
		SELECT,  //下拉列表框
		RADIO,   //单选框
		CHECKBOX //多选框
	}
	
	TagType tagType() default TagType.edit;
	
	enum TagType{
		edit,       //(是编辑标签)
		view,       //(是查看标签)
		editInList //(是list页面编辑标签) 默认值：edit
	}
}
