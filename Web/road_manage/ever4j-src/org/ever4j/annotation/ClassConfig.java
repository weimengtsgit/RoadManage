package org.ever4j.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)   	
@Target(ElementType.TYPE)
public @interface ClassConfig {
	/**
	 * 配置改实体类的名字，改名字作为菜单的展示内容进行展示（必填）
	 * @return
	 */
	String title();
	/**
	 * 配置改菜单是否需要在菜单中展示（默认展示）
	 * @return
	 */
	boolean isShowMenu() default true;
}
