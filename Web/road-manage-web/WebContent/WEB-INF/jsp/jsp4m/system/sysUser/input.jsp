<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>

	<form id="system_sysUser_form_1" method="post" action="${ctx}/system/sysUser/save" class="form-horizontal" >
	  <div class="form-body">
		<input type="hidden" name="id" value="${sysUser.id}" />
		<form:field name="username" label="账号" value="${sysUser.username}" required="true" fwidth="5"></form:field>
		<form:field name="password" label="密码" value="${sysUser.password}" type="password" required="true" fwidth="5"></form:field>
		<form:field name="name" label="昵称" value="${sysUser.name}" fwidth="5"></form:field>
		<form:field name="userType" label="用户类型" value="" required="true" useBody="true" fwidth="5">
			<form:roletype name="userType" value="${sysUser.userType}"></form:roletype>
		</form:field>
		<!-- 超级管理员  -->
		<c:if test="${curUser.userType==1 }">
			<form:field name="" label="所属商场" value=""  useBody="true"  fwidth="5">
				<input class="form-control select2" name="mall.id" type="hidden" value="${sysUser.mall.id}" display-value="${sysUser.mall.name}" result-field="name" result-formatter="displayMall"  lookup-url="${ctx }/mall/mall/listJSON" filter="filter_LIKES_name" />
			</form:field>
			<form:field name="" label="所属商铺" value=""  useBody="true"  fwidth="5">
				<input class="form-control select2" name="shop.id" type="hidden" value="${sysUser.shop.id}" display-value="${sysUser.shop.name}" result-field="name" result-formatter="displayShop"  lookup-url="${ctx }/mall/shop/listJSON" filter="filter_LIKES_name" />
			</form:field>
		</c:if>
		
		
		<!-- 商场管理员  -->
		<c:if test="${curUser.userType==2 }">
			<form:field name="" label="所属商铺" value=""  useBody="true"  fwidth="5">
				<input class="form-control select2" name="shop.id" type="hidden" value="${sysUser.shop.id}" display-value="${sysUser.shop.name}" result-field="name" result-formatter="displayShop"  lookup-url="${ctx }/mall/shop/listJSON" filter="filter_LIKES_name" />
			</form:field>
		</c:if>
		
		
		
		<form:field name="" label="所属角色" value="" required="true" useBody="true"  fwidth="5">
			<input class="form-control select2" name="userRole.id" type="hidden" value="${sysUser.userRole.id}" display-value="${sysUser.userRole.roleName}" result-field="roleName" result-formatter="displayRole"  lookup-url="${ctx }/system/sysRole/listJSON" filter="filter_LIKES_roleName" />
		</form:field>
		<form:field name="userDesc" label="用户描述" type="textarea" value="${sysUser.userDesc}" attrs=' rows="4" ' fwidth="5"></form:field>
		
	  </div>
	<div class="form-actions right">
		<button type="button" class="btn default remove">取消</button>
		<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
	</div>
	</form>
		

<script type="text/javascript">
jQuery(document).ready(function() {
	FormSamples.init({
		formId:'system_sysUser_form_1',
		select2:{
			displaymac:function(m){
				var markup = [
				                "<table class='movie-result'>",
   			 					"<tr><td valign='top'>",
   			 				  	"<h5>" + m.mac + "</h5>",
             					"<div class='movie-synopsis'>" + m.description + "</div>",
   			 					"</td></tr>",
   			 					"<tr><td>",
   			 					"位置:"+m.location,
   			 					"</td></tr>",
   								"</table>"
   			 					].join('');
   			 
   			 return markup;
			},
			displaymall:function(m){
				var markup = [
				                "<table class='movie-result'>",
   			 					"<tr><td valign='top'>",
   			 				  	"<h5>" + m.name + "</h5>",
             					"<div class='movie-synopsis'>" + m.address + "</div>",
   			 					"</td></tr>",
   								"</table>"
   			 					].join('');
   			 
   			 return markup;
			}
		}
	});
});
</script>
