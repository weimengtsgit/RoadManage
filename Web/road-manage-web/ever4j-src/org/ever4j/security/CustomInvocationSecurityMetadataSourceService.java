package org.ever4j.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.AnyRequestMatcher;
import org.springframework.security.web.util.UrlUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

/**
 * 最核心的地方，就是提供某个资源对应的权限定义，即getAttributes方法返回的结果。
 * 此类在初始化时，应该取到所有资源及其对应角色的定义。
 * 
 */
@Service
public class CustomInvocationSecurityMetadataSourceService implements
		FilterInvocationSecurityMetadataSource {

	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	private AntPathMatcher urlMatcher = new AntPathMatcher(); 
	
	public CustomInvocationSecurityMetadataSourceService() {
		loadResourceDefine();
	}

	/**
	 * 加载所有资源与权限的关系
	 */
	@SuppressWarnings("unchecked")
	private void loadResourceDefine() {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:/applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");

		Session session = sessionFactory.openSession();

		/**
		 * 在Web服务器启动时，提取系统中的所有资源和权限的对应关系。
		 * 应当是资源为key， 权限为value。 资源通常为url， 权限就是那些以ROLE_为前缀的角色， 一个资源可以由多个权限来访问。
		 */
		String sql = "SELECT menu_name, authority_name FROM sys_menu where menu_type != 1";

		List<Object> queryList = session.createSQLQuery(sql).list();
		if(session != null){
			session.close();
		}
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();

		for (Object obj : queryList) {
			if(obj != null){
				Object[] curObj = (Object[])obj;
				if(curObj[0] == null || curObj[1] == null){
					continue;
				}
				
				String url = (String)curObj[0];
				String auth = (String)curObj[1];
				
				ConfigAttribute ca = new SecurityConfig(auth);
				
				/*
				 * 判断资源文件和权限的对应关系，如果已经存在相关的资源url，则要通过该url为key提取出权限集合，将权限增加到权限集合中。
				 */
				Collection<ConfigAttribute> value = resourceMap.get(url);
				if(value == null){
					value = new ArrayList<ConfigAttribute>();
				}
				value.add(ca);
				
				resourceMap.put(url, value);
			}
		}
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {

		return null;
	}

	/**
	 *  根据URL，找到相关的权限配置。
	 */
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {

		// object 是一个URL，被用户请求的url。
		String url = ((FilterInvocation) object).getRequestUrl();
		
        int firstQuestionMarkIndex = url.indexOf("?");

        if (firstQuestionMarkIndex != -1) {
            url = url.substring(0, firstQuestionMarkIndex);
        }
        
        if(resourceMap != null && resourceMap.keySet() != null && resourceMap.keySet().size() > 0){
        	Iterator<String> ite = resourceMap.keySet().iterator();
    		if(ite != null){
    			while (ite.hasNext()) {
    				String resURL = ite.next();
    				if (urlMatcher.match(url, resURL)) {

    					return resourceMap.get(resURL);
    				}
    			}
    		}
        }
		
		return null;
	}

	@Override
	public boolean supports(Class<?> arg0) {

		return true;
	}

}
