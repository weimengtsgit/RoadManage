<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/taglibs.jsp"%>
<style>
<!--
.my-custom-theme {
	border-radius: 5px; 
	border: 2px solid #000;
	background-color:#4c4c4c;
	color: #fff;
	position: fixed; 
}

.my-custom-theme .tooltipster-content {
	font-family: Arial, sans-serif;
	font-size: 14px;
	line-height: 16px;
	padding: 8px 10px;
}
-->
</style>
<link rel="stylesheet" type="text/css" href="${ctx}/jqueryui/tooltipster/css/tooltipster.css" />
<script type="text/javascript" src="${ctx}/jqueryui/tooltipster/js/jquery.tooltipster.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    	$('.tooltip').tooltipster({
    		position: 'right',
    		fixedWidth: 400,
    		theme: '.my-custom-theme',
    		
    		icon: 'a',
    		iconDesktop: true
    		
		});
    });
</script>
<form id="pagerForm" onsubmit="return SLAVEJS.submitPageForm(this)&&navTabSearch(this);" method="post" action="${ctx}/system/sysDept/list">
	  <input type="hidden" name="pageNo" id="pageNo" value="${pageData.pagination.pageNo}" />
      <input type="hidden" name="fieldName" id="fieldName" value="${pageData.compositor.fieldName}" />
      <input type="hidden" name="compositorType" id="compositorType" value="${pageData.compositor.compositorType}" />
<div class="pageShow">
	<div class="pageContent" selector="h1">
		<div class="panel collapse" minH="220" defH="220" style="clear: right;float: left;width: 50%;margin: 0px;" >
			<h1>报表一</h1>
			<div>
				<div class="hchart" id="dailyInstallationsChart1" style="width: 100%; height: 100%;">chart1</div>
			</div>
		</div>
		<div class="panel collapse" minH="220" defH="220" style="clear: right;float: left;width: 50%;margin: 0px;">
			<h1>报表二</h1>
			<div>
				<div class="hchart" id="dailyInstallationsChart2" style="width: 100%; height: 100%;">chart2</div>
			</div>
		</div>
	</div>
</div>
<div class="pageHeader">
	<div class="searchBar">
		<ul class="searchContent">
			
				<li>
					<label>部门名称：</label>
					<input type="text" name="filter_LIKES_deptName" value="${pageData.filtraMap.LIKES_deptName}" maxlength="32"/>
				</li>
			
				<li>
					<label>部门编号：</label>
					<input type="text" name="filter_LIKES_deptNum" value="${pageData.filtraMap.LIKES_deptNum}"/>
				</li>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_deptAddr" value="${pageData.filtraMap.LIKES_deptAddr}"/>
			
					<input class="hiddenItem" type="hidden" name="filter_LIKES_deptDesc" value="${pageData.filtraMap.LIKES_deptDesc}"/>
			
				<li>
					<label>上级部门：</label>
					<input id="system_parentId_deptName_list" type="hidden" name="parentId.id" value='' />
					<input type="text" name="filter_LIKES_parentId.deptName" value='${pageData.filtraMap["LIKES_parentId.deptName"]}' suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId" />
					<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>
				</li>
				
				<li>
					<label>部门名称：</label>
					<input type="text" name="" value="${pageData.filtraMap.LIKES_deptName}" maxlength="32"/>
				</li>
				<li>
					<label>部门编号：</label>
					<input type="text" name="" value="${pageData.filtraMap.LIKES_deptNum}"/>
				</li>
				<li>
					<label>上级部门：</label>
					<input id="system_parentId_deptName_list" type="hidden" name="" value='' />
					<input type="text" name="" value='${pageData.filtraMap["LIKES_parentId.deptName"]}' suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId" />
					<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>
				</li>
				<li>
					<label>部门名称：</label>
					<input type="text" name="" value="${pageData.filtraMap.LIKES_deptName}" maxlength="32"/>
				</li>
				<li>
					<label>部门编号：</label>
					<input type="text" name="" value="${pageData.filtraMap.LIKES_deptNum}"/>
				</li>
				<li>
					<label>上级部门：</label>
					<input id="system_parentId_deptName_list" type="hidden" name="" value='' />
					<input type="text" name="" value='${pageData.filtraMap["LIKES_parentId.deptName"]}' suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId" />
					<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>
				</li>
				<li>
					<label>部门名称：</label>
					<input type="text" name="" value="${pageData.filtraMap.LIKES_deptName}" maxlength="32"/>
				</li>
				<li>
					<label>部门编号：</label>
					<input type="text" name="" value="${pageData.filtraMap.LIKES_deptNum}"/>
				</li>
				<li>
					<label>上级部门：</label>
					<input id="system_parentId_deptName_list" type="hidden" name="" value='' />
					<input type="text" name="" value='${pageData.filtraMap["LIKES_parentId.deptName"]}' suggestFields="deptName" suggestUrl="${ctx}/system/sysDept/lookupJson" lookupGroup="parentId" />
					<a class="btnLook" href="${ctx}/system/sysDept/lookupList" lookupGroup="parentId">查找带回</a>
				</li>
				
				
				
				<li>
				<a href="#" class="tooltip" title="<div style='float: left;'>提供了0-24时各时段内新增用户与启动次数的数据，帮您分析用户使用应用的时段规律。</div><h2>Get your Google阿事实上事实上 onaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</h2><br/><h1>sdfsdfasdf</h1>">here</a>
				</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><a class="button" href="${ctx}/system/sysDept/advancedSearch" rel="system_sysDept_advancedSearch" target="dialog" mask="true" width="795" height="460" title="查询框"><span>高级查询</span></a></li>
			</ul>
		</div>
	</div>
</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/system/sysDept/new" target="navTab" rel="system_sysDept_edit"><span>添加部门</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="${ctx}/system/sysDept/delAll" target="selectedTodo" rel="ids" postType="string" title="删除的同时，会将关联该部门的所有部门全部删除。确实要删除这些记录吗?" ><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="28"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				
				<th width="32">序号</th>
					
				<th orderField="deptName" class=${pageData.compositor.fieldName eq 'deptName' ? pageData.compositor.compositorType : ''}>部门名称</th>
					
				<th orderField="deptNum" class=${pageData.compositor.fieldName eq 'deptNum' ? pageData.compositor.compositorType : ''}>部门编号</th>
					
				<th orderField="deptAddr" class=${pageData.compositor.fieldName eq 'deptAddr' ? pageData.compositor.compositorType : ''}>部门地址</th>
			
				<th orderField="parentId.deptName" class="${pageData.compositor.fieldName eq 'parentId.deptName' ? pageData.compositor.compositorType : ''}">上级部门</th>
				
				<th width="90">操作</th>
			</tr>
		</thead>
		<tbody scroller="no" mintr="19">
			<c:forEach var="entity" items="${pageData.result}" varStatus="s">
				<tr target="dialog" mask="true" title="查看部门-${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}">
					<td><input name="ids" value="${entity.id }" type="checkbox"></td>
						
					<td>${s.count + (pageData.pagination.pageNo-1)*pageData.pagination.pageSize}</td>
					
					<td>${entity.deptName}</td>
						
					<td>${entity.deptNum}</td>
						
					<td>${entity.deptAddr}</td>
				
					<td><a href="${ctx}/system/sysDept/view?id=${entity.parentId.id}" target="dialog" rel="system_sysDept_dialog" title="${entity.parentId.deptName}">${entity.parentId.deptName}</a></td>
				
					<td>
						<a title="删除的同时，会将关联该部门的所有部门全部删除。确实要删除吗？" target="ajaxTodo" href="${ctx}/system/sysDept/delete?id=${entity.id}" class="btnDel">删除</a>
						<a title="编辑部门" target="navTab" rel="system_sysDept_edit" href="${ctx}/system/sysDept/edit?id=${entity.id}" class="btnEdit">编辑</a>
						<a title="查看部门" target="navTab" rel="system_sysDept_view" href="${ctx}/system/sysDept/view?id=${entity.id}" class="btnView">查看</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>每页显示${pageData.pagination.pageSize}条，</span>
			<span>共${pageData.pagination.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${pageData.pagination.totalCount}" numPerPage="${pageData.pagination.pageSize}" pageNumShown="5" currentPage="${pageData.pagination.pageNo}"></div>

	</div>
</div>

<script type="text/javascript">

var dailyInstallationsChart1 = {
	    chart: {
	        type: 'line',
	        marginRight: 130,
	        marginBottom: 25
	    },
	    title: {
	        text: 'Monthly Average Temperature',
	        x: -20 //center
	    },
	    subtitle: {
	        text: 'Source: WorldClimate.com',
	        x: -20
	    },
	    xAxis: {
	        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
	            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
	    },
	    yAxis: {
	        title: {
	            text: 'Temperature (°C)'
	        },
	        plotLines: [{
	            value: 0,
	            width: 1,
	            color: '#808080'
	        }]
	    },
	    tooltip: {
	        valueSuffix: '°C'
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'top',
	        x: -10,
	        y: 100,
	        borderWidth: 0
	    },
	    series: [{
	        name: 'Tokyo',
	        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
	    }, {
	        name: 'New York',
	        data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
	    }, {
	        name: 'Berlin',
	        data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
	    }, {
	        name: 'London',
	        data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
	    }]
	};
	
var dailyInstallationsChart2 = {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
    },
    title: {
        text: 'Browser market shares at a specific website, 2010'
    },
    tooltip: {
	    pointFormat: '{series.name}: <b>{point.percentage}%</b>',
    	percentageDecimals: 1
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                color: '#000000',
                connectorColor: '#000000',
                formatter: function() {
                    return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                }
            }
        }
    },
    series: [{
        type: 'pie',
        name: 'Browser share',
        data: [
            ['Firefox',   45.0],
            ['IE',       26.8],
            {
                name: 'Chrome',
                y: 12.8,
                sliced: true,
                selected: true
            },
            ['Safari',    8.5],
            ['Opera',     6.2],
            ['Others',   0.7]
        ]
    }]
};
</script>
