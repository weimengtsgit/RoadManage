<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="name" type="java.lang.String" required="true" %>
<%@ attribute name="value" type="java.lang.String" required="true" %>
<%@ attribute name="width" type="java.lang.Integer" required="true" %>
<%@ attribute name="height" type="java.lang.Integer" required="true" %>
<%@ attribute name="required" type="java.lang.Boolean" required="false"%>

<div class="fileupload fileupload-new" data-provides="fileupload">
	<div class="fileupload-new thumbnail" style="width: ${ width}px; height: ${ height}px;">
		<img width="${ width}" height="${ height}"  src="${sysbaseConfig_image_url_prefix }/${value }" alt="" />
	</div>
	<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: ${ width}px; max-height: ${ height}px; line-height: 20px;"></div>
	<div>
		<span class="btn default btn-file">
		<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
		<span class="fileupload-exists"><i class="fa fa-undo"></i> 更换</span>
		<input  type="hidden" class=""  name="${name }" value="${value}" ${required?"required":"" }  error-target=".fileupload"/>
		<input  type="file" name="${name}File" class="default" onchange=" $(this).prev('input').val($(this).val());"/>
		</span>
		<a href="#" class="btn red fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> 删除</a>
	</div>
</div>