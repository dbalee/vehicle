<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护系统-车辆备案</title>  
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
<script type="text/javascript" src="${path}js/selectList.js"></script>
<link rel="stylesheet" href="${path}css/bootstrap.css">
<script type="text/javascript">
   $(document).ready(function(){
	 loadSelect("001","category","category.dict_id"); 
   });
</script>

</head>
<style type="text/css">
body{
  background: url(${path}images/dotted.png);
}
 #box{
  width: 500px;
  height: auto;
  margin: 50px auto
 }
 #box span{
 float: right;
 margin-top: 20px;
 font-size: 20px
 }
 #box input{
  margin-top: 20px
 }
 #box button{
   float: right;
   margin-top: 20px;
   margin-right:50px;
   /*width: 300px*/
 }
 #box div{
  position: relative;
 }
 .choose{
  position: relative;
  width: 100%;
  height: 50px;
  /*background:red */
 }
 #box .box-innner{
  width: 100%;
  height: 40px;
  /*background: red;*/
  margin-top: 10px
 }
 #box .sel{
  width: 100px;
  height: 30px;
  margin-top:20px;
  text-align: center;
  
 }
 

</style>
<body>
  <font color="red" ><s:property value="exception.message" /></font>
<form action="${pageContext.request.contextPath}/ordinary/VehicleAction_saveVehicleByOrdinary" method="post"> 
<div id="box">
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车牌号:</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="plateId" id="plateId" required  oninvalid="setCustomValidity('请填写车牌号');" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
          <div class="col-lg-5 col-md-6  col-xs-6"  style="width: 210px">
            <span style="text-align:right">车辆类型：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6" style="width: 200px">
             <span id="category"></span>
         </div> 
       </div> 
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>发动机型号:</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="engineId" id="engineId" required  oninvalid="setCustomValidity('请填写发动机编号');" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车辆型号:</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="model" class="form-control" id="model" required  oninvalid="setCustomValidity('请填写车辆型号');" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车底盘号衍射:</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="carChassisId" id="carChassisId" required  oninvalid="setCustomValidity('请填写车底盘号衍射');" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车辆重量:</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="weight" id="weight" required  oninvalid="setCustomValidity('请填写车辆重量');" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>出厂日期:</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="manufactureDate" id="manufactureDate" class="sang_Calender" required  oninvalid="setCustomValidity('请选择出厂日期');" oninput="setCustomValidity('');" style="width:220px;height:35px;border-radius:5px" />
         </div>
     </div>
      <button class="btn btn-primary" type="submit">进行备案</button>  
  </div>
</form>
<script type="text/javascript" src="${path}js/datetime.js"></script>
</body>
</html>
