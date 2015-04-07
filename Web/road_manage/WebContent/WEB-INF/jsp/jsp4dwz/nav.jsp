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
<div class="accordion" fillSpace="sideBar">

<c:if test="${not empty cmenus}">

		<c:forEach var="m" items="${cmenus}">
			<div class="accordionHeader">
				<h2><span>Folder</span>${m.menuDesc}</h2>
			</div>
			<div class="accordionContent">
	   		<ul class="tree treeFolder">
	   		<c:if test="${not empty m.menus}">
				<c:forEach var="m2" items="${m.menus}">
					<c:set var="menu" value="${m2}" scope="request"/>
					<jsp:include page="recursive.jsp"/>
				</c:forEach>
			</c:if>	
			</ul>
	   		</div>
		</c:forEach>
</c:if>	
</div>





