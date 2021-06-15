<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<style>

  ul{
   list-style:none;

   } 

.navbar-expand-sm{
   z-index: 1020;
}

.navbar{
   height:110px;
}

.sidenav {
   height: 100%;
   width: 0;
   position: fixed;
   top: 0;
   right: 0;
   background-color: #0B2161;
   overflow-x: hidden;
   transition: 0.5s;
   opacity: 0.8;
   z-index:99999999;
   
   /* padding-top: 60px; */
}

.sidenav a {
   padding: 8px 8px 8px 32px;
   text-decoration: none;
   font-size: 25px;
   color: #818181;
   display: block;
   transition: 0.3s;
   z-index:99999999;
}

.sidenav a:hover {
   color: #f1f1f1;
}

.sidenav .closebtn {
   position: absolute;
   top: 0;
   right: 25px;
   font-size: 36px;
   margin-left: 50px;
}
.navbar{
   background-color: #0B2161;
    opacity: 0.8;
}

.nav-link{
   color:white;
    font-size:15px;
}

.nav-link a:hover{
   text-decoration:none;
}

.mainlink{

}

.main {
   margin-bottom:20px;
   font-size:45px;
   margin-right:20px;
   padding-right:15px;

}

.mainlink a:hover{
   text-decoration:none;
    color:white;
}

.login{
   margin-left:22px;
    margin-top:31px;
}

.nav_bar{
   padding-top:15px;
   color:white;
}

.home-p{
   padding-bottom:20px;
   right:43%;
   bottom:30%;
   position:absolute;
   z-index:1;
   font-size:20px;
   line-height:-5px;
   text-align:center;
   color:white;
}

.main-image {
   width:100%;
   z-index:-1;

}

.admin {
/*    margin-left:10px;
   margin-top:30px; */
}

.adminlink{
   margin-top:31px;
   margin-left:26px;
}

.adminlink a:hover{
   text-decoration:none;
    color:white;
}



.nav_bar {
   position: absolute;
   top: 0;
   right: 25px;
<!---->   
   
}
.header {
   background:#808080;
   width:100%;
   height:100px;
   display:flex;
   <!--opacity: 0.01;-->
}

.nav .mainlogo{
   margin-left:50px;
   padding-bottom:20px;
   font-size:40px;
   height:30px;
   
   
}

.mainlogo-link {
   color:white;
}

.nav .nav_bar{
   margin-right:30px;
   margin-top:15px;
   color:white;
}

.mainlogo a:hover{
   text-decoration:none;
   color:white;
}

.nav-item{
   margin-top:15px;
}



@media screen and (max-height: 450px) {
   .sidenav {
      padding-top: 15px;
   }
   .sidenav a {
      font-size: 18px;
   }
}
</style>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    
    

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/resources/vendor/metisMenu/metisMenu.min.css"/>" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<c:url value="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"/>" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<c:url value="/resources/vendor/datatables-responsive/dataTables.responsive.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/dist/css/sb-admin-2.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";

}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";

}
</script>



<body>
   <c:if test="${member == null and admin == null}">
   <nav class="navbar navbar-expand-sm">
     <!-- Links -->
     <ul class="navbar-nav">
       <li class="nav-item">
         <div class="mainlink"><a class="nav-link main" href="/violet">violet</a></div>
       </li>
       <li class="nav-item">

       </li>
     </ul>      
           <div id="mySidenav" class="sidenav">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <a href="${rootPath}/cust/login">login</a>
              <a href="${rootPath}/cust/mypage">mypage</a>
              <a href="${rootPath}/cust/profile">profile</a>
              <a href="${rootPath}/story/getAll">story</a>
              <a href="${rootPath}/email/write.do">email</a>
              <a href="${rootPath}/search/searchmain">search</a>
              <a href="${rootPath}/notice/list">service</a>
          </div>
          <span class="nav_bar" style="font-size:45px;cursor:pointer" onclick="openNav()">&#9776;</span>
       
   </nav>
   </c:if>

   <c:if test="${member != null || admin != null}">
      <nav class="navbar navbar-expand-sm">
        <!-- Links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <div class="mainlink"><a class="nav-link main" href="/violet">violet</a></div>
          </li>
          <li class="nav-item">
            <c:if test="${member != null }">
            <p class="nav-link login">${member.cust_id}님 환영합니다.</p>
           </c:if>
           <c:if test="${admin != null }">
            <p class="nav-link login">${admin.cust_id}님 환영합니다.</p>            
           </c:if>
          </li>
          <li class="nav-item">
             <c:if test="${admin.cust_different == 1}">
              <div class="adminlink"><a class="nav-link admin" href="/violet/admin/info">관리자 페이지</a></div>
              </c:if>
          </li>
        </ul>      
              <div id="mySidenav" class="sidenav">
                 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                 <a href="${rootPath}/cust/logout">logout</a>
                 <a href="${rootPath}/cust/mypage">mypage</a>
                 <a href="${rootPath}/cust/profile">profile</a>
                 <a href="${rootPath}/story/getAll">story</a>
                 <a href="${rootPath}/email/write.do">email</a>
                 <a href="${rootPath}/search/searchmain">search</a>
                 <a href="${rootPath}/notice/list">service</a>
             </div>
             <span class="nav_bar" style="font-size:45px;cursor:pointer" onclick="openNav()">&#9776;</span>      
      </nav>
   </c:if>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <!-- <div class="navbar-header">
                <a class="navbar-brand" href="/violet">violet</a>
            </div> -->
           

        
            <!-- /.row -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>       

</html>