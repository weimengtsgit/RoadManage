<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<c:set scope="page" var="formId" value="form_sysconf_sysConfIitem_1" ></c:set>
		<div class="note note-info">
							<h4 class="block">使用说明</h4>
							<p>
								java 获取参数值： Constant.configMap.get("参数");
								<br/>JSP 获取参数值： \${参数}
							</p>
		</div>
		
<!-- BEGIN SAMPLE TABLE PORTLET-->
<div class="portlet box grey">
	<div class="portlet-title">
		<div class="caption"><i class="fa fa-table"></i>配置参数</div>
		<div class="tools">
			<a href="javascript:;" class="collapse"></a>
		</div>
	</div>
	<div class="portlet-body">
	
		<form id="${formId }" method="post" action="${ctx}/sysconf/sysConfIitem/saveConfig" class="form-horizontal" >
			<div class="form-body">
				
			<input type="hidden" class="" name="id" value="${confTypeId}"/>
			<c:forEach var="entity" items="${list}" varStatus="s">
				<!-- 枚举 -->
				<c:if test="${entity.valueType == '3' }">
					<form:field  label="${entity.itemName }"  useBody="true"  >
						<tag:enum cssClass="form-control form-control-inline input-medium select2me" name="list[${s.count-1}].itemValue" inputType="radio"  enumName="${entity.enumType.enumName }" enumKey="${entity.itemValue}" />
						<span class="help-block">
							*参数   ${confTypeKey}_${entity.itemKey }
						</span>
					</form:field>	
				</c:if>
				
				<!-- 密码 -->
				<c:if test="${entity.valueType == '4' }">
					<form:field type="password" name="list[${s.count-1}].itemValue" attrs="" label="${entity.itemName }"  value="${entity.itemValue}" >
					<span class="help-block">
						*参数   ${confTypeKey}_${entity.itemKey }
					</span>
					</form:field>
				</c:if>
				
				<!-- 字符串 -->
				<c:if test="${entity.valueType == '1' || entity.valueType == '2'}">
					<form:field type="textarea" name="list[${s.count-1}].itemValue" attrs="" label="${entity.itemName }"  value="${entity.itemValue}" >
					<span class="help-block">
						*参数   ${confTypeKey}_${entity.itemKey }
					</span>
					</form:field>
				</c:if>
				
				<!-- 长文本 -->
				<c:if test="${entity.valueType == '5' }">
					<form:field type="textarea" name="list[${s.count-1}].itemValue" attrs="rows=4" label="${entity.itemName }"  value="${entity.itemValue}" >
					<span class="help-block">
						*参数   ${confTypeKey}_${entity.itemKey }
					</span>
					</form:field>
				</c:if>
					<input type="hidden" name="list[${s.count-1}].id" value="${entity.id}"/>
			</c:forEach>
			</div>
			
			
			<div class="form-actions right">
				<button type="button" class="btn default remove">取消</button>
				<button type="submit" class="btn blue"><i class="fa fa-check"></i> 确认</button>
			</div>
		</form>
		
	</div>
</div>
<!-- END SAMPLE TABLE PORTLET-->
	
<script type="text/javascript">

jQuery(document).ready(function() {
	FormSamples.init({
		formId:'${formId }'
	});
	
});
</script>