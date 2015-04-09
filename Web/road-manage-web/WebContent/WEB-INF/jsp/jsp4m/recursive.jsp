<%@page import="org.ever4j.system.entity.SysOperLog"%>
<%@page import="java.util.Map"%>
<%@page import="org.ever4j.system.service.SysMenuService"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.ever4j.system.pojo.MainMenuPojo"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<%
MainMenuPojo mi =(MainMenuPojo)request.getAttribute("menu");
		
if(mi.getMenuName()!=null && mi.getMenuName().length()>0){
	String[] mdls = mi.getMenuName().split("\\|");
	if(mdls.length==2){
		String hql = mdls[1];
		String url = mdls[0];
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		SysMenuService sms = ctx.getBean(SysMenuService.class);
		List menuList = sms.findHqlList(hql);
		if(menuList!=null && menuList.size()>0){
			for(int i=0;i<menuList.size();i++){
				Map<String,Object> map = (Map<String,Object>)menuList.get(i);
				MainMenuPojo mmp= new MainMenuPojo();
				mmp.setExternal(0);
				mmp.setMenuType("2");
				mmp.setEnabled("1");
				mmp.setIcon("fa fa-pencil-square");
// 				mmp.setTarget("navTab");
				mmp.setMenuName(url+map.get("key"));
				mmp.setMenuDesc(map.get("name").toString());
				mi.getMenus().add(mmp);
			}
		}
	}
	
}else{
	List li = (List)session.getAttribute("menus");
	for(int i=0;i<li.size();i++){
		MainMenuPojo m = (MainMenuPojo)li.get(i);
		
		if(m.getPid() != null && m.getPid().intValue()==mi.getId().intValue()){
			MainMenuPojo mm = (MainMenuPojo)m.cloneMe();
			mm.setMenus(new ArrayList<MainMenuPojo>());
			mi.getMenus().add(mm);
		}
	}
}
request.setAttribute("menu", mi);
%>

	  		<li <c:if test="${ menu.enabled=='0'}"> class="disabled-link" </c:if>>
							
			  			  <c:if test="${ menu.menuType eq '1'}">
			  			  	<a href="<c:if test="${ menu.enabled=='1'}">javascript:;</c:if><c:if test="${ menu.enabled=='0'}">###</c:if>" class="<c:if test="${ menu.enabled=='0'}"> tooltips</c:if>" data-container="body" data-placement="right" data-original-title="${menu.summary }" <c:if test="${ menu.enabled=='0'}">data-handler="MESSAGE"   data-title="IGOOOO" data-content="敬请期待" </c:if> >
							 <i class="${menu.icon }"></i>
							 <span class="text"> ${menu.menuDesc}</span>
							 <span class="arrow"></span>
							</a>
			  			  </c:if>
			  			  <c:if test="${ not empty menu.menuName && menu.menuType eq '2' && menu.external == 1}">
			  				<a class="iframefy <c:if test="${ menu.enabled=='0'}"> tooltips</c:if>" href="<c:if test="${ menu.enabled=='1'}">${ctx}${menu.menuName}</c:if><c:if test="${ menu.enabled=='0'}">###</c:if>"  url="<c:if test="${ menu.enabled=='1'}">${ctx}${menu.menuName}</c:if><c:if test="${ menu.enabled=='0'}">###</c:if>" <c:if test="${ menu.enabled=='0'}">data-handler="MESSAGE"   data-title="IGOOOO" data-content="敬请期待" </c:if>     rel="${menu.menuRel}" external="false" data-container="body" data-placement="right" data-original-title="${menu.summary }">
							 <i class="${menu.icon }"></i>
							 <span class="text"> ${menu.menuDesc}</span>
							</a>
			  			  </c:if>
			  			  <c:if test="${ not empty menu.menuName && menu.menuType eq '2' && menu.external != 1}">
			  			 	<a class="ajaxify <c:if test="${ menu.enabled=='0'}"> tooltips</c:if>" href="<c:if test="${ menu.enabled=='1'}">${ctx}${menu.menuName}</c:if><c:if test="${ menu.enabled=='0'}">###</c:if>"  url="<c:if test="${ menu.enabled=='1'}">${ctx}${menu.menuName}</c:if><c:if test="${ menu.enabled=='0'}">###</c:if>" <c:if test="${ menu.enabled=='0'}">data-handler="MESSAGE"   data-title="IGOOOO" data-content="敬请期待" </c:if>     rel="${menu.menuRel}" external="false" data-container="body" data-placement="right" data-original-title="${menu.summary }">
							  <i class="${menu.icon }"></i>
							  <span class="text"> ${menu.menuDesc}</span>
							</a>
			  			  </c:if>
							
			              <c:if test="${not empty menu.menus}">  
			                     <ul class="sub-menu">  
			                        <c:forEach var="menu" items="${menu.menus}">  
			                            <c:set var="menu" value="${menu}" scope="request"/>  
			                        <jsp:include page="recursive.jsp"/>  
			                        </c:forEach>              
			                     </ul>  
			              </c:if>  
   






