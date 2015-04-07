<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.ever4j.system.pojo.MainMenuPojo"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

<%
		
List navs = (List)session.getAttribute("navMenus");
List li = (List)session.getAttribute("menus");
List cmenus = new ArrayList();
for(int j=0;j<navs.size();j++){
	MainMenuPojo mii = (MainMenuPojo)navs.get(j);
	MainMenuPojo mi = (MainMenuPojo)mii.cloneMe();
	for(int i=0;i<li.size();i++){
		MainMenuPojo m = (MainMenuPojo)li.get(i);
		
		if(m.getPid() != null && m.getPid().intValue()==mi.getId().intValue()){
			MainMenuPojo mm = (MainMenuPojo)m.cloneMe();
			mm.setMenus(new ArrayList<MainMenuPojo>());
			mi.getMenus().add(mm);
		}
	}
	cmenus.add(mi);
}
request.setAttribute("cmenus", cmenus);

%>

<c:if test="${not empty cmenus}">

		<c:forEach var="m" items="${cmenus}">
			
	   		
	   		<li <c:if test="${ m.enabled=='0'}"> class="disabled-link" </c:if>>
					<a href="<c:if test="${ m.enabled=='1'}">javascript:;</c:if><c:if test="${ m.enabled=='0'}">###</c:if>" class="<c:if test="${ m.enabled=='0'}"> tooltips</c:if>" <c:if test="${ m.enabled=='0'}">data-handler="MESSAGE"   data-title="IGOOOO" data-content="敬请期待" </c:if>  data-container="body" data-placement="right" data-original-title="${m.summary }">
					 <i class="${m.icon }"></i>
					 <span class="title"> ${m.menuDesc}</span>
					 <span class="arrow "></span>
					 <span class="selected"></span>
					</a>
	   		<c:if test="${not empty m.menus}">
	   		 <ul class="sub-menu">
				<c:forEach var="m2" items="${m.menus}">
					<c:set var="menu" value="${m2}" scope="request"/>
					<jsp:include page="recursive.jsp"/>
				</c:forEach>
			</ul>
			</c:if>	
			</li>
		</c:forEach>
</c:if>	





