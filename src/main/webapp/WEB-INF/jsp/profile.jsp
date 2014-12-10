<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Registration</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
</head>
<body>


 <div id="page-content-wrapper">
  <div class="navbar navbar-default navbar-fixed-top " role="navigation">    
   <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">KuPRA</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">Ikelti recepta</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Visi Receptai</a></li>
            <li><a href="#">Mano receptia</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Produktai</a></li>
            <li><a href="#">Matavimo vienetai</a></li>
          </ul>
        </li>
        <li><a href="#">Šaldytuvas</a></li>
        <li><a href="#">Valgiaraštis</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Vartotojo profilis</a></li>
        <li><a href="#">Atsijungti</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
 </div>

 <div class="user-profile">
 <div class="container">
 <div class="tabbable">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#profile" data-toggle="tab">Profilis</a></li>
    <li><a href="#friends" data-toggle="tab">Mano draugai</a></li>
    <li><a href="#users" data-toggle="tab">Naudotoju sarašas</a></li>
  </ul>
  <div class="tab-content">
    <div id="profile" class="tab-pane active">

        <div class="container registration">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
 
        <form:form method="POST" class="form-horizontal form-registration" role="form" modelAttribute="userForm">
           <h1 class="registration-h1">Registracija</h1>
           <fieldset>
            <div class="form-group">
               <label for="inputLoginName" class="col-md-5 control-label">Prisijungimo vardas *</label>
               <div class="col-md-7 controls">
			     <div class="input-group">
				       <span class="input-group-addon"><img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/></span>
<!-- *** -->          <input value="${userForm.loginname}" type="text" class="form-control" id="inputLoginName icon-login-name" placeholder="Prisijungimo vardas" name="loginname"/> 
                  </div>
                   <form:errors path="loginname" cssClass="error" /> 				  
                </div>
           </div>  
           <div class="form-group">
               <label for="inputUserName" class="col-md-5 control-label"> Slapyvardis *</label>
               <div class="col-md-7 controls">
			      <div class="input-group">
				      <span class="input-group-addon"><img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/></span>
<!-- *** -->          <input type="text" class="form-control" id="inputUserName" placeholder="Slapyvardis" name="username"/>  
				   </div> 
                   <form:errors path="username" cssClass="error" /> 				   
                </div>
           </div>
           <div class="form-group">
               <label for="inputPassword" class="col-md-5 control-label">Slaptažodis *</label>
               <div class="col-md-7 controls">
			        <div class="input-group">
			           <span class="input-group-addon"> <img src="<c:url value="/resources/svg/key.svg"/>"  class="icons-registration"/></span>
<!-- *** -->          <input type="password" class="form-control" id="inputPassword" placeholder="Slaptažodis" name="password"/>		
                    </div> 
                      <form:errors path="password" cssClass="error" /> 
               </div>
           </div>
            <div class="form-group ">
               <label for="inputRePassword" class="col-md-5 control-label">Pakartoti slaptažodi *</label>
               <div class="col-md-7 controls">
			         <div class="input-group">
					       <span class="input-group-addon"> <img src="<c:url value="/resources/svg/key.svg"/>"  class="icons-registration"/></span>
<!-- *** -->              <input type="password" class="form-control" id="inputRePassword" placeholder="Pakartoti slaptažodi" name="passrepeat"/>
                     </div> 
                      <form:errors path="passrepeat" cssClass="error" /> 
               </div>
           </div>
           <div class="form-group">
               <label for="inputEmail" class="col-md-5 control-label">Elektroninio pašto adresas *</label>
               <div class="col-md-7 controls">
			         <div class="input-group">
					      <span class="input-group-addon"> <img src="<c:url value="/resources/svg/email.svg"/>"  class="icons-registration"/></span>
<!-- *** -->             <input type="email" class="form-control" id="inputEmail" placeholder="Elektroninis paštas" name="email"/> 
                    </div> 
                      <form:errors path="email" cssClass="error" />       
                </div>
           </div>
               <div class="extended-info">
           <div class="form-group">
               <label for="inputName" class="col-md-5 control-label">Vardas</label>
               <div class="col-md-7 controls">
			          <div class="input-group">
					     <span class="input-group-addon"> <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/></span>
<!-- *** -->         	<input type="text" class="form-control" id="inputName" placeholder="Vardas" name="name"/>  
                      </div> 
						<form:errors path="name" cssClass="error" />  
                </div>
           </div>
            <div class="form-group">
               <label for="inputLastName" class="col-md-5 control-label">Pavarde</label>
               <div class="col-md-7 controls">
			         <div class="input-group">
					      <span class="input-group-addon">  <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/></span>
<!-- *** -->             <input type="text" class="form-control" id="inputLastName" placeholder="Pavarde" name="lastname"/>
                    </div> 
                      <form:errors path="lastname" cssClass="error" /> 	 
                </div>
           </div>
            <div class="form-group ">
               <label for="inputAddress" class="col-md-5 control-label">Adresas</label>
               <div class="col-md-7 controls">
			       <div class="input-group">
				        <span class="input-group-addon"><img src="<c:url value="/resources/svg/buildings.svg"/>"  class="icons-registration"/> </span>
<!-- *** -->          <input type="text" class="form-control" id="inputAddress" placeholder="Adresas" name="address"/> 
                   </div>
                      <form:errors path="address" cssClass="error" />
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
    <div id="friends" class="tab-pane">
    
    </div>
    <div id="users" class="tab-pane">
     
    </div>
  </div><!-- /.tab-content -->
</div><!-- /.tabbable -->
</div>
</div>



</div>

</body>
</html>