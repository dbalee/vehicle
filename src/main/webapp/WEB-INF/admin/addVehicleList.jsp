<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-车辆备案</title>
<link rel="stylesheet" href="${path}css/bootstrap.css">
<link rel="stylesheet" href="${path}css/basic.css">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
<script type="text/javascript">
  function changePage(pageNum){
	  //1.将页码的值放入对应的表单隐藏域中
	  $("#currentPageInput").val(pageNum);  
	  //2.提交表单
	  $("#pageForm").submit();
  };
  
  function changePageSize(pageSize){
	   //1 将页码的值放入对应表单隐藏域中
	   $("#pageSizeInput").val(pageSize);
	   //2 提交表单
	   $("#pageForm").submit();
	};
	
	function selectAllDels() 
	{ 
		var allCheckBoxs = document.getElementsByName("many"); 
		var desc = document.getElementById("allChecked"); 
		var selectOrUnselect=false; 
		for(var i = 0; i < allCheckBoxs.length; i ++ ) { 
		if(allCheckBoxs[i].checked){ 
		selectOrUnselect=true; 
		break; } } 
		if (selectOrUnselect) { 
		_allUnchecked(allCheckBoxs); }else { 
		_allchecked(allCheckBoxs); } } 
		function _allchecked(allCheckBoxs){ 
		for(var i = 0; i < allCheckBoxs.length; i ++ ) { 
		allCheckBoxs[i].checked = true; } } 
		function _allUnchecked(allCheckBoxs){ 
		for(var i = 0; i < allCheckBoxs.length; i ++ ) { 
		allCheckBoxs[i].checked = false; } 
	} 
	
	$(function(){
	    // 设置属性值
	    $("#submit").click(function() {
	        var many = "";
	        $("input:checkbox[name='many']:checked").each(function() {
	        	many += $(this).val() + " ";
	        });
	        alert("已选择的部分："+many);
	        var xmlhttp;
			if (window.XMLHttpRequest) {
				// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
				xmlhttp = new XMLHttpRequest();
			} else {
				// IE6, IE5 浏览器执行代码
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {		
					var result = xmlhttp.responseText;								
					if(parseInt(result)==1){
						show_notice('备案成功',1);
					}else{
						show_notice('备案失败',1);
					}
								
				}
			}
			xmlhttp.open("POST", "VehicleAction_fileAll", true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("many="+many);     
	    });
	})
	
	function show_notice(str,second,callback){  
	    var box_id = 'notice_box';  
	    var tooltipBox = document.getElementById(box_id);  
	    if(tooltipBox){  
	        document.body.removeChild(tooltipBox);  
	    }  
	    if(!second) second = 2;  
	    tooltipBox = document.createElement('div');  
	    tooltipBox.innerHTML = str;  
	    tooltipBox.id = box_id;  
	    tooltipBox.style.background='rgba(94,94,94,.8)';  
	    tooltipBox.style.color='#fff';  
	    tooltipBox.style.display='inline-block';  
	    tooltipBox.style.padding = '0.4em 1.5em';  
	    tooltipBox.style.borderRadius = '1em';  
	    tooltipBox.style.fontSize = '0.9em';  
	    document.body.appendChild(tooltipBox);  
	    var vWidth = document.documentElement.clientWidth;  
	    var vHeight = document.documentElement.clientHeight;  
	    tooltipBox.style.position = 'fixed';  
	    tooltipBox.style.zIndex = '9999';  
	    tooltipBox.style.left = ((vWidth/2)-(tooltipBox.offsetWidth/2))+'px';  
	    tooltipBox.style.top = ((vHeight/2)-(tooltipBox.offsetHeight/2))+'px';  
	    setTimeout(function () {  
	                    document.body.removeChild(tooltipBox);  
	                    if(callback)    callback();  
	                }, second*1000);  
	}  
</script>
  <style type="text/css">
     .choose{
      display: inline-block;
      width: 100%;
      margin-left: 50px;
      margin-top: 20px;
     }
     .choose button{
      margin-right: 20px
     }
  </style>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/VehicleAction_addVehicle">新建车辆备案</a>
<form id="pageForm" name="ordinaryForm" action="${pageContext.request.contextPath}/admin/VehicleAction_addVehicleList" method="post">
 <div class="pas">
    <span>车牌号：</span>
    <div class="col-lg-6 col-md-6  col-xs-6">
        <input type="text" class="form-control" name="plateId" id="plateId" placeholder="">
    </div>
    <button class="btn btn-primary" type="submit" name="button" class="button">筛&nbsp;&nbsp;选</button>
    <!-- 隐藏域.当前页码 -->
	<input type="hidden" name="currentPage" id="currentPageInput" value="${pageBean.currentPage}" />
	<!-- 隐藏域.每页显示条数 -->
    <input type="hidden" name="pageSize" id="pageSizeInput"   value="${pageBean.pageSize}" />
  </div><!-- 输入框 -->
</form>
  <div class="choose">
      <button class="btn btn-primary" type="button" id="allChecked" value="全选/取消全选" onClick="selectAllDels()">全选/取消全选</button>
      <button class="btn btn-primary" type="button" id="submit">提&nbsp;&nbsp;交</button>
  </div>
 
  <div class="tab"><!-- 表格开始 -->
    <table border="4">
      <thead>
        <tr>
          <td>多选框</td>
          <td>档案号</td>
          <td>车排号</td>
          <td>车的类别</td>
          <td>车辆型号</td>
          <td>发动机编号</td>
          <td>车底盘号衍射</td>
          <td>重量</td>
          <td>车辆状态</td>
          <th>出厂日期</th>
	      <th>车主 </th>
	      <th>维护信息的数量</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${pageBean.list}" var="list" >
	          <tr>
	          	<td><input type="checkbox" name="many" value="${list.vehicleId}"/></td>
	            <td>${list.vehicleId}</td>
	            <td>${list.plateId}</td>
	            <td>${list.category}</td>
	            <td>${list.model}</td>
	            <td>${list.engineId}</td>
	            <td>${list.carChassisId}</td>
	            <td>${list.weight}</td>
	            <td>${list.operationStatus}</td>
	            <td>${list.manufactureDate}</td>
	            <td>${list.userName}</td>
	            <td>${list.maintainNumber}</td>
	            <td>  
	            </td>
	          </tr>
         </c:forEach>
      </tbody>
    </table>
     <div class="ji">
       	 共[<b>${pageBean.totalCount}</b>]条记录,[<b>${pageBean.totalPage}</b>]页
			 ,每页显示 
			 <select name="pageSize" onchange="changePageSize(this.options[this.options.selectedIndex].value)"  id="pageSizeSelect" >
				<option  value="3"  ${pageBean.pageSize==3?'selected':''}>3</option>
				<option  value="5" ${pageBean.pageSize==5?'selected':''}>5</option>
			 </select>
			 条
     </div>
     <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4" id="pge">
           <nav>
          <ul class="pagination">
            <li><a href="javaScript:void(0)" onclick="changePage(${pageBean.currentPage-1})" >前一页</a></li>
            <li><a href="">${pageBean.currentPage}</a></li>
            <li><a href="javaScript:void(0)" onclick="changePage(${pageBean.currentPage+1})" >后一页</a></li>
            <li>到 <input type="text" id="page" name="page" value="${pageBean.currentPage}" style="width: 60px">页</li>
            <li><button class="btn btn-primary" type="button" onclick="changePage($('#page').val())">GO</button></li>
          </ul>

        </nav>
        </div>
  </div>
</body>
</html>