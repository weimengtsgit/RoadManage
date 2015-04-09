<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
		<input type="hidden" name="id" value="${customer.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>手机号：</dt>
				<dd>
					<input id="mobile" readonly="readonly" name="mobile" type="text" value="${customer.mobile}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>微信号：</dt>
				<dd>
					<input id="weixin" readonly="readonly" name="weixin" type="text" value="${customer.weixin}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>QQ号：</dt>
				<dd>
					<input id="qq" readonly="readonly" name="qq" type="text" value="${customer.qq}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>VIP号：</dt>
				<dd>
					<input id="vip" readonly="readonly" name="vip" type="text" value="${customer.vip}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>车牌号：</dt>
				<dd>
					<input id="carNum" readonly="readonly" name="carNum" type="text" value="${customer.carNum}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>年龄：</dt>
				<dd>
					<input id="age" readonly="readonly" name="age" type="text" value="${customer.age}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>性别：</dt>
				<dd>
					<tag:enum tagType="view"   enumName="sex" enumKey="${customer.sex}" />
				</dd>
				<span class="info"></span>
			</dl>
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" readonly="readonly" name="createTime" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${customer.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>兴趣爱好：</dt>
				<dd>
					<input id="interest" readonly="readonly" name="interest" type="text" value="${customer.interest}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>轨迹：</dt>
				<dd>
					<input id="trackId" readonly="readonly" name="trackId" type="text" value="${customer.trackId}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>最近一次使用终端：</dt>
				<dd>
					<c:if test="${not empty customer.lastUseTerm.mac}">
						<a class="ghbutton search right" href="${ctx}/customer/terminal/view?id=${customer.lastUseTerm.id}" target="dialog" mask="true" title="查看最近一次使用终端详情">${customer.lastUseTerm.mac}</a>
					</c:if>
					<span class="info"></span>
				</dd>
			</dl>
		
			<dl>
				<dt>账户余额：</dt>
				<dd>
					<input id="acctBalance" readonly="readonly" name="acctBalance" type="text" value="${customer.acctBalance}" size="30"  />
					<span class="info"></span>
				</dd>
			</dl>
		
			<div class="divider"></div>
		
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
</div>
