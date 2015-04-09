<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<form id="pagerForm" onsubmit="return dwzSearch(this, 'dialog');" method="post" action="${ctx}/customer/customer/viewRefList">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />

<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>手机号：</label>
					<input type="text" name="filter_LIKES_mobile" value="${pageData.filtraMap.LIKES_mobile}"/>
				</li>
			
				<li>
					<label>微信号：</label>
					<input type="text" name="filter_LIKES_weixin" value="${pageData.filtraMap.LIKES_weixin}"/>
				</li>
			
				<li>
					<label>QQ号：</label>
					<input type="text" name="filter_LIKES_qq" value="${pageData.filtraMap.LIKES_qq}"/>
				</li>
			
				<li>
					<label>VIP号：</label>
					<input type="text" name="filter_LIKES_vip" value="${pageData.filtraMap.LIKES_vip}"/>
				</li>
			
				<li>
					<label>车牌号：</label>
					<input type="text" name="filter_LIKES_carNum" value="${pageData.filtraMap.LIKES_carNum}"/>
				</li>
					
				<li>
					<label>年龄：</label>
					<input type="text" name="filter_EQI_age" value="${pageData.filtraMap.EQI_age}"/>
				</li>
			
				<li>
					<label>性别：</label>
					<tag:enum id="sex" inputType="SELECT" defaultValue="" name="filter_EQS_sex" enumName="sex" enumKey="${pageData.filtraMap.EQS_sex}" />
				</li>
			
				<li>
					<label>创建时间：</label>
					<input id="createTime" name="filter_GED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.GED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
				<li>
					<label>至：</label>
					<input id="createTime" name="filter_LED_createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" value="${pageData.filtraMap.LED_createTime}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</li>
			
				<li>
					<label>密码：</label>
					<input type="text" name="filter_LIKES_password" value="${pageData.filtraMap.LIKES_password}"/>
				</li>
			
				<li>
					<label>兴趣爱好：</label>
					<input type="text" name="filter_LIKES_interest" value="${pageData.filtraMap.LIKES_interest}"/>
				</li>
					
				<li>
					<label>轨迹：</label>
					<input type="text" name="filter_EQI_trackId" value="${pageData.filtraMap.EQI_trackId}"/>
				</li>
			
				
					<input class="hiddenItem"  type="hidden" name="filter_EQI_lastUseTerm.id" value='${pageData.filtraMap["EQI_lastUseTerm.id"]}' />
				
					
				<li>
					<label>账户余额：</label>
					<input type="text" name="filter_EQI_acctBalance" value="${pageData.filtraMap.EQI_acctBalance}"/>
				</li>
			
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<table class="table" width="100%" layoutH="150"  targetType="dialog">
		<thead>
			<tr>
				<th width="32">序号</th>
					
				<th  orderField="mobile" class=${pageData.compositor.fieldName eq 'mobile' ? pageData.compositor.compositorType : ''}>手机号</th>
					
				<th  orderField="weixin" class=${pageData.compositor.fieldName eq 'weixin' ? pageData.compositor.compositorType : ''}>微信号</th>
					
				<th  orderField="qq" class=${pageData.compositor.fieldName eq 'qq' ? pageData.compositor.compositorType : ''}>QQ号</th>
					
				<th  orderField="vip" class=${pageData.compositor.fieldName eq 'vip' ? pageData.compositor.compositorType : ''}>VIP号</th>
					
				<th  orderField="carNum" class=${pageData.compositor.fieldName eq 'carNum' ? pageData.compositor.compositorType : ''}>车牌号</th>
					
				<th  orderField="age" class=${pageData.compositor.fieldName eq 'age' ? pageData.compositor.compositorType : ''}>年龄</th>
			
				<th orderField="sex" class=${pageData.compositor.fieldName eq 'sex' ? pageData.compositor.compositorType : ''}>性别</th>
					
				<th  orderField="createTime" class=${pageData.compositor.fieldName eq 'createTime' ? pageData.compositor.compositorType : ''}>创建时间</th>
					
				<th  orderField="password" class=${pageData.compositor.fieldName eq 'password' ? pageData.compositor.compositorType : ''}>密码</th>
					
				<th  orderField="interest" class=${pageData.compositor.fieldName eq 'interest' ? pageData.compositor.compositorType : ''}>兴趣爱好</th>
					
				<th  orderField="trackId" class=${pageData.compositor.fieldName eq 'trackId' ? pageData.compositor.compositorType : ''}>轨迹</th>
			
				<th orderField="lastUseTerm.mac" class="${pageData.compositor.fieldName eq 'lastUseTerm.mac' ? pageData.compositor.compositorType : ''}">最近一次使用终端</th>
					
				<th  orderField="acctBalance" class=${pageData.compositor.fieldName eq 'acctBalance' ? pageData.compositor.compositorType : ''}>账户余额</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" >
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
						
					<td>${entity.mobile}</td>
						
					<td>${entity.weixin}</td>
						
					<td>${entity.qq}</td>
						
					<td>${entity.vip}</td>
						
					<td>${entity.carNum}</td>
						
					<td>${entity.age}</td>
				
					<td><tag:enum isTag="false" tagType="view" id="sex" name="sex" enumName="sex" enumKey="${entity.sex}" /></td>
				
					<td><fmt:formatDate value="${entity.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
						
					<td>${entity.password}</td>
						
					<td>${entity.interest}</td>
						
					<td>${entity.trackId}</td>
				
					<td>
					<c:if test="${not empty entity.lastUseTerm.mac}">
					<a class="ghbutton search right" href="${ctx}/customer/terminal/view?id=${entity.lastUseTerm.id}" target="dialog" mask="true" rel="customer_customer_lookupdialog" title="查看最近一次使用终端详情">${entity.lastUseTerm.mac}</a>
					</c:if>
					</td>
						
					<td>${entity.acctBalance}</td>
				
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>每页显示${pageData.pagination.pageSize}条，</span>
			<span>共${pageData.pagination.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="dialog" totalCount="${pageData.pagination.totalCount}" numPerPage="${pageData.pagination.pageSize}" pageNumShown="5" currentPage="${pageData.pagination.pageNo}"></div>

	</div>
	<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
</div>
