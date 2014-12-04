<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Registration</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
</head>
<body>

 <div id= "page-content-wrapper">

    

  <div class="container registration">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
 
        <form:form method="POST" class="form-horizontal form-registration" role="form" commandName="regForm" action="register">
           <h1 class="registration-h1">Registracija</h1>
           <fieldset>
            <div class="form-group inner-addon left-addon">
               <label for="inputLoginName" class="col-md-5 control-label">Prisijungimo vardas *</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="text" class="form-control" id="inputLoginName" placeholder="Prisijungimo vardas" path="loginname"/>  
                      <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/>
                </div>
           </div>
           <div class="form-group inner-addon left-addon">
               <label for="inputUserName" class="col-md-5 control-label"> Slapyvardis *</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="text" class="form-control" id="inputUserName" placeholder="Slapyvardis" path="username"/>  
                       <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/>
                </div>
           </div>
           <div class="form-group inner-addon left-addon ">
               <label for="inputPassword" class="col-md-5 control-label">Slaptažodis *</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="password" class="form-control" id="inputPassword" placeholder="Slaptažodis" path="password"/>
                      <img src="<c:url value="/resources/svg/key.svg"/>"  class="icons-registration"/>
               </div>
           </div>
            <div class="form-group inner-addon left-addon">
               <label for="inputRePassword" class="col-md-5 control-label">Pakartoti slaptažodi *</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="password" class="form-control" id="inputRePassword" placeholder="Pakartoti slaptažodi" path="passrepeat"/>
                      <img src="<c:url value="/resources/svg/key.svg"/>"  class="icons-registration"/>
               </div>
           </div>
           <div class="form-group inner-addon left-addon">
               <label for="inputEmail" class="col-md-5 control-label">Elektroninio pašto adresas *</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="email" class="form-control" id="inputEmail" placeholder="Elektroninis paštas" path="email"/>  
                       <img src="<c:url value="/resources/svg/email.svg"/>"  class="icons-registration"/>
                </div>
           </div>
               <div class="extended-info">
           <div class="form-group inner-addon left-addon">
               <label for="inputName" class="col-md-5 control-label">Vardas</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="text" class="form-control" id="inputName" placeholder="Vardas" path="name"/>  
                       <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/>
                </div>
           </div>
            <div class="form-group inner-addon left-addon">
               <label for="inputLastName" class="col-md-5 control-label">Pavarde</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="text" class="form-control" id="inputLastName" placeholder="Pavarde" path="lastname"/> 
                      <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/>
                </div>
           </div>
            <div class="form-group inner-addon left-addon">
               <label for="inputAddress" class="col-md-5 control-label">Adresas</label>
               <div class="col-md-6">
<!-- *** -->          <form:input type="text" class="form-control" id="inputAddress" placeholder="Adresas" path="address"/> 
                      <img src="<c:url value="/resources/svg/buildings.svg"/>"  class="icons-registration"/> 
                </div>
           </div>
           <div class="col-md-6 col-md-offset-5 info-registration"><p>*pažymeti laukai privalomi</p></div> 
           <div class="form-group">
             <label class="col-md-4 control-label" for="buttonRegistration"></label>
             <div class=" col-md-4 center-block ">
                <button name="buttonRegistration" class="btn btn-primary center-block">Registruokis</button>
             </div>
           </div>
          </div>
         </fieldset>
        </form:form>
     </div> 
   </div>  
  </div> 
</div>

</body>
</html>
