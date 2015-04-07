<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<div class="pageContent">
	<form method="post" action="${ctx}/customer/customer/save?navTabId=customer_customer_list&callbackType=closeCurrent&ajax=1" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" value="${customer.id}" />
		<div class="pageFormContent" layoutH="56">
		
			<dl>
				<dt>手机号：</dt>
				<dd>
					<input class="" id="mobile" name="mobile" type="text" value="${customer.mobile}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>微信号：</dt>
				<dd>
					<input class="" id="weixin" name="weixin" type="text" value="${customer.weixin}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>QQ号：</dt>
				<dd>
					<input class="" id="qq" name="qq" type="text" value="${customer.qq}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>VIP号：</dt>
				<dd>
					<input class="" id="vip" name="vip" type="text" value="${customer.vip}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>车牌号：</dt>
				<dd>
					<input class="" id="carNum" name="carNum" type="text" value="${customer.carNum}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>年龄：</dt>
				<dd>
					<input class="" id="age" name="age" type="text" value="${customer.age}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>性别：</dt>
				<dd>
					<tag:enum id="sex" inputType="select" defaultValue="" cssClass="" name="sex" enumName="sex" enumKey="${customer.sex}" />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>创建时间：</dt>
				
				<dd>
					<input id="createTime" name="createTime" type="text" class="date " dateFmt="yyyy-MM-dd HH:mm:ss" size="30" value="<fmt:formatDate value="${customer.createTime}" type="time" timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss"/>" d>
					<a class="inputDateButton" href="javascript:;">选择</a>
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>密码：</dt>
				<dd>
					<input class="" id="password" name="password" type="text" value="${customer.password}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>兴趣爱好：</dt>
				<dd>
					<input class="" id="interest" name="interest" type="text" value="${customer.interest}" size="30"  maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
			<dl>
				<dt>轨迹：</dt>
				<dd>
					<input class="" id="trackId" name="trackId" type="text" value="${customer.trackId}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<dl>
				<dt>最近一次使用终端：</dt>
				<dd>
					<input id="customer_lastUseTerm_mac_input" type="hidden" class="" name="lastUseTerm.id" value="${customer.lastUseTerm.id}"/>
					<input type="text" class="" size="24" name="lastUseTerm.mac" value="${customer.lastUseTerm.mac}" suggestFields="mac" suggestUrl="${ctx}/customer/terminal/lookupJson" lookupGroup="lastUseTerm"  onchange="if(!this.value) document.getElementById('customer_lastUseTerm_mac_input').value=''" />
					<a class="btnLook" href="${ctx}/customer/terminal/lookupList" lookupGroup="lastUseTerm">查找带回</a>
					<span class="info"></span>		
				</dd>
			</dl>
		
			<div class="divider"></div>
		
			<dl>
				<dt>账户余额：</dt>
				<dd>
					<input class="" id="acctBalance" name="acctBalance" type="text" value="${customer.acctBalance}" size="30"  max=2147483647 maxlength=30 />
					<span class="info"></span>	
				</dd>
			</dl>
			
		
			<div class="divider"></div>
		
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
