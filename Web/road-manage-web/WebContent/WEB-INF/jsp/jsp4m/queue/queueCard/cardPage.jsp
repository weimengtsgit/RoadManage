<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<!-- BEGIN PAGE CONTENT-->
<!-- BEGIN ROW CONTENT-->
<c:set scope="page" var="urlPrev" value="${ctx }/queue/queueCard/" ></c:set>
<c:set scope="page" var="rolePrev" value="ROLE_QUEUE_QUEUECARD_" ></c:set>
<c:set scope="page" var="dataTitle" value="排号卡" ></c:set>
<c:set scope="page" var="tableId" value="data-queue-queueCard-cardPage-1" ></c:set>
<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption"><i class="fa fa-table"></i>${dataTitle }</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="javascript:;" class="reload" onclick="_GLOBAL.lastMenu.click();"></a>
							</div>
							
							<div class="actions" >
									
								
							</div>
						</div>
						<div class="portlet-body" id="${tableId }">
						<c:if test="${curUser.userType!=3 }">
						<div class="row">
								<div class="col-md-12">
								<div class="form-group pull-right">
									<input placeholder='所属商铺'  class="form-control form-control-inline input-large  select2 " id="filter_EQI_shop.id" type="hidden" value="${shopId}" display-value="${shopName}" result-field="name"   lookup-url="${ctx }/mall/shop/listJSON" filter="filter_LIKES_name" />
									<a href="###" class="btn search default"  id="btn_queue_cardPage_search"><i class="fa fa-search"></i></a>								
								</div>
								</div>
						</div>
						</c:if>
						<div class="row">
								
						<c:forEach var="info" items="${infos}">
						
								<div class="col-md-12">
								
								</div>
								<div class="col-md-3">
									
									<div class="pricing-table2 selected">
										<h3>${info.cardType }</h3>
										<tag:enum enumKey="${info.configShop.status }" tagType="view" enumName="QueueConfigShop_status"/>
										
										<div class="desc" style="padding-top: 5px;">
											<div style="margin-top: 13px;">
											<a href="${urlPrev}listPage?s=${info.configShop.shop.id}&t=${info.configShop.type}" class="btn  no_padding" data-handler="INLINE" data-title="排队顾客列表">
											<i class="fa fa-group"></i> 当前排队总人数 <span class="badge badge-warning" style="margin-top: -2px;">${info.waitCount }</span> 
											</a>
											</div>
										
											<div style="margin-top: 13px;">
											<i class="fa fa-clock-o"></i>  目前排队预估时间 <span class="badge badge-warning" style="margin-top: -2px;">${info.waitTime } 分钟</span> 
											</div>
											
										</div>
										<div class="rate">
											<div class="price" style="height:135px;">
												<c:if test="${info.next==null}">
												
													<div class="amount ">
														暂无排队
													</div>
												</c:if>
												<c:if test="${info.next!=null}">
												
													<div class="amount ">
														${info.next.cardNo }   ${info.next.name }
													</div>
													<a href="${ctx }/customer/message/toSendMsg?customerId=${info.next.customer.id}&phone=${info.next.phone }" class="btn pull-right" data-handler="MODAL" data-title="发送信息">
														<i class="fa fa-mobile"> ${info.next.phone }</i>
														<i class="m-icon-swapright m-icon-white"></i>
													</a>  
													<div class="pull-right">
													<a href="${urlPrev }setStatus?id=${info.next.id}&value=1"  class="btn  blue" data-handler="CONFIRM" data-title="确定要使用该号吗？"><i class="glyphicon glyphicon-ok"></i> 使用</a>
													<a href="${urlPrev }setStatus?id=${info.next.id}&value=2"  class="btn  dark" data-handler="CONFIRM" data-title="确定要取消该号吗？"><i class="glyphicon glyphicon-minus"></i> 取消</a>
													<br/>
													<a href="tel://${info.next.phone }"  class="btn  green" ><i class="glyphicon glyphicon-earphone"></i> 电话</a>
													<a href="${ctx }/customer/message/toSendMsg?customerId=${info.next.customer.id}&phone=${info.next.phone }"  class="btn  purple" data-handler="MODAL" data-title="发送信息"><i class="glyphicon glyphicon-comment"></i> 短信</a>
													</div>
												</c:if>
											</div>
										</div>
										
										<%-- 状态： 0:正常 1:暂停排号 2:终止排号 --%>
										<c:if test="${info.configShop.status==0 }">
											<a href="${ctx }/queue/queueConfigShop/setStatus?id=${info.configShop.id}&value=1"  class="btn  " data-handler="CONFIRM" data-title="确定要暂停该类型的排号业务吗？"><i class="fa fa-pause" ></i> 暂停排号</a>
											<a href="${ctx }/queue/queueConfigShop/setStatus?id=${info.configShop.id}&value=2"  class="btn  " data-handler="CONFIRM" data-title="确定要停止今天该类型的排号业务吗？停止后今天将不可再次开启！"><i class="fa fa-stop" ></i> 终止排号</a>
										</c:if>
										<c:if test="${info.configShop.status==1 }">
											<a href="${ctx }/queue/queueConfigShop/setStatus?id=${info.configShop.id}&value=0"  class="btn  " data-handler="CONFIRM" data-title="确定要开启该类型的排号业务吗？"><i class="fa fa-play" ></i> 开启排号</a>
											<a href="${ctx }/queue/queueConfigShop/setStatus?id=${info.configShop.id}&value=2"  class="btn  " data-handler="CONFIRM" data-title="确定要停止今天该类型的排号业务吗？停止后今天将不可再次开启！"><i class="fa fa-stop" ></i> 终止排号</a>
										</c:if>
										<c:if test="${info.configShop.status==2 }">
											<a href=""  class="btn  " data-handler="MESSAGE" data-title="今天该类型排号业务已经停止，<br/>请明天再试。"><i class="fa fa-play" ></i> 开启排号</a>
											<a href=""  class="btn  " data-handler="MESSAGE" data-title="今天该类型排号业务已经停止。"><i class="fa fa-stop" ></i> 终止排号</a>
										</c:if>
									</div>
								</div>
						
						
						</c:forEach>
						</div>
						
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
</div>
	<!-- END ROW CONTENT-->
		

<!-- END PAGE CONTENT --> 
<script>
$(document).ready(function() {
	Select2Ex.handleForm4select2({target:"#${tableId}"});
	
	$('#btn_queue_cardPage_search').click(function(){
		_GLOBAL.lastMenu.attr("href",_GLOBAL.lastMenu.attr("url")+"?shopId="+$(this).prev().val())
		_GLOBAL.lastMenu.click();
	})
});
</script>
