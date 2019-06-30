<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/static/include/include.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>

	<script type="text/javascript">
		$(function(){
			initPage($("#queryForm"));
		});
	</script>
  </head>
  
  <body>
  	<div class="row">
  		<form action="${r"${ctx }"}/complain/list.do" id="queryForm" method="post" target="_self" name="querForm">
			<div class="col-xs-12 queryHeight"> 
				<div class="queryTitleDiv widget-box">
					<!--标题表头开始标签-->
					<div class="widget-header">
						<h5 class="widget-title">条件查询</h5>
						<div class="widget-toolbar">
							<a href="#" data-action="collapse">
								<i class="ace-icon fa fa-chevron-up"></i>
							</a>
						</div>
					</div>
					<!--标题表头结束标签-->
					<!--查询表单内容开始标签-->
					<div class="widget-body">
						<div class="widget-main">
								<table style="width:100%;border-collapse:separate; border-spacing:10px;">
									<tr>
								  		
									</tr>	
									<tr>
										<td  align="center" colspan="6">
									  		<div class="queryBtnDiv">
												<button class="btn btn-sm btn-info" onclick="onSelect($('#queryForm'));">
													<i class="fa fa-search align-top bigger-125"></i>
													查询
												</button>												
												<button class="btn btn-sm btn-info" onclick="onReset('queryForm')">
													<i class="fa fa-refresh align-top bigger-125"></i>
													重置
												</button>	
											</div>														  
							 			</td>
									</tr>
								</table>
						</div>
					</div>
					<!--查询表单内容结束标签-->
				</div>
			</div>
		</div>
	  	<div class="row">
		    <div class="col-xs-12 buttonHeight">
			 	<div class="centerDiv">
					<div class="btnDiv">	
						<button class="btn btn-sm btn-info" onclick="showDetail()">
							<i class="fa fa-eye align-top bigger-125"></i>
							详情
						</button>
						<button class="btn btn-sm btn-info" onclick="insertRow()">
							<i class="fa fa-plus align-top bigger-125"></i>
							新增
						</button>
						<button class="btn btn-sm btn-info" onclick="updateRow()">
							<i class="fa fa-edit  align-top bigger-125"></i>
							修改
						</button>
						<button class="btn btn-sm btn-info" onclick="deleteRow()">
							<i class="fa fa-trash-o align-top bigger-125"></i>
							删除
						</button>
					</div>
			 	</div>
		 	</div>		
	 	</div>		
	   	<div class="row">
	  		<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-12 tableHeight">
						<!--表格内容开始标签-->
						<table id="sample-table-1" class="table table-striped table-bordered table-hover">
							<tr>
								<th class="center">
									<label>
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</th>
								<#list fields as attr> 
							    <th>${attr.remark}</th>
							    </#list>
					    	</tr>
					    	<c:forEach items="${r"${data }"}" var="item">
					    		<tr>
					    			<td class="center">
										<label class="position-relative">
											<input id="ids" name="ids" value="<#if id??>${r"${item."}${id.fieldName}${r"}"}</#if>" type="checkbox" class="ace" />
											<span class="lbl"></span>
										</label>
									</td>
									<#list fields as attr> 
								    <td>${r"${item."}${attr.fieldName}${r"}"}</td>
								    </#list>
					    		</tr>
					    	</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<!--引入分页开始JSP-->
		 		<jsp:include page="/static/include/pagePlug.jsp"></jsp:include> 
			<!--引入分页结束JSP-->
	  	</div>
	</form>
  </body>
  
  <script type="text/javascript">
	function showDetail() {
    	if(checkNum("ids") < 1) {
    		top.layer.alert("必须选择一行!");
    		return;
    	} else if (checkNum("ids") > 1) {
    		top.layer.alert("只能选择一行,不允许多选!");
    		return;
    	} 
    	 $('input[name="ids"]:checked').each(function(){
             var ids=$(this).val();
             var index=top.layer.open({
 	  				title:"详情信息",
	         		type: 2,
	         		shadeClose: true,
	         		maxmin: true,
	         		shade: 0.8,
	         		area: ['60%', '80%'],
	         		btn:['保存','返回'],
	         		content:getBasePath()+"${modelName?uncap_first}/detail.do?id="+ids, //iframe的url
	         		yes:function(){
	         			var saveform = top.layer.innerFrame(index);
	        	    	saveform.contentWindow.save();
	         		},
	        	    cancel:function(){
	        	    	top.layer.close(index);
	        	    }	
	         	}); 
        });      
    }
	
	function updateRow(){
		if(checkNum("ids") < 1) {
    		top.layer.alert("必须选择一行!");
    		return;
    	} else if (checkNum("ids") > 1) {
    		top.layer.alert("只能选择一行,不允许多选!");
    		return;
    	} 
		
		$('input[name="ids"]:checked').each(function(){
             var ids=$(this).val();
             var index=top.layer.open({
 	  				title:"详情信息",
	         		type: 2,
	         		shadeClose: true,
	         		maxmin: true,
	         		shade: 0.8,
	         		area: ['60%', '80%'],
	         		btn:['保存','返回'],
	         		content:getBasePath()+"${modelName?uncap_first}/toUpdatePage.do?id="+ids, //iframe的url
	         		yes:function(){
	         			var saveform = top.layer.innerFrame(index);
	        	    	saveform.contentWindow.save();
	         		},
	        	    cancel:function(){
	        	    	top.layer.close(index);
	        	    }	
         	}); 
        });   
		 
	}
	
	function deleteRow(){
		if(checkNum("ids") < 1) {
    		top.layer.alert("必须选择一行!");
    		return;
    	}
		var ids="";
		 $('input[name="ids"]:checked').each(function(){
             if(ids==""){
            	 ids+=$(this).val();
             }else{
            	 ids+=","+$(this).val();
             }
			 
		 });
		var index=top.layer.confirm("是否确定删除指定记录?",function(){
			$.ajax({
  		  	 	url:getBasePath()+"${modelName?uncap_first}/delete.do", 
			 	type:"post",
			 	async:true,
			 	data:{
					 ids:ids
				 },
				 dataType:"JSON",
				 success:function(res){
		   			 if(res.code=="200"){
		   			 	var win=top.layer.parent();
						top.layer.refresh(win);//刷新
						top.layer.alert("操作成功",{icon:6});
		   				//var index = parent.layer.getFrameIndex(window.name);
		   				//parent.layer.close(index);
		   			 }else{
		   			 	top.layer.alert(res.code,{icon:5});
		   			 }
		   			 top.layer.close(index);
				 },
				 error:function(e){
				 	top.layer.alert("服务器异常",{icon:5,time:3000});
				 }
  			});
		});
	}
  </script>
</html>

<%@ include file="/static/include/includeBottom.jsp"%>	
