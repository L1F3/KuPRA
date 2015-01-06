<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Prisijungimas</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
</head>

<body>

<div id= "page-content-wrapper">
  <div class="container login">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">

         <img src="<c:url value="/resources/MainI.svg" />"  class="center-block  icon-size img-responsive"/>
        
		<form:form method="POST" class="form-horizontal form-signin" role="form" modelAttribute="userForm" action="../j_spring_security_check">
             <fieldset>
            <div class="form-group ">
               <label for="inputEmail" class="col-sm-3 control-label" style="text-align: left;">Prisijungimo vardas</label>
               <div class="col-sm-9 controls">
			         <div class="input-group">
					   <span class="input-group-addon"><img src="<c:url value="/resources/svg/user.svg"/>"  class="icons"/> </span>
<!-- *** -->           <input type="text" class="form-control" id="inputEmail" placeholder="Prisijungimo vardas" name="username" required/>  
					 </div> 
					 <!-- Cia klaida -->
                </div>
           </div>
           <div class="form-group">
               <label for="inputPassword" class="col-sm-3 control-label">Slaptažodis</label>
               <div class="col-sm-9 controls"> 
			       <div class="input-group">
				      <span class="input-group-addon"><img src="<c:url value="/resources/svg/key.svg"/>"  class="icons"/></span>
<!-- *** -->          <input type="password" class="form-control" id="inputPassword" placeholder="Slaptažodis" name="password" required/>
					</div> 
					 <!-- Cia klaida -->
               </div>
           </div>
           <div class="form-group">
             <label class="col-md-4 control-label" for="buttonLogIn"></label>
             <div class=" col-md-12 center-block ">
                <button type="submit" name="buttonRegistration" class="btn btn-lg btn-primary btn-block">Prisijungti</button>
             </div>  
                    
          </div> 
           
           <div class="form-group">
                <label class="col-md-7 control-label" for="buttonRegistration">Norite užsiregistruoti sistemoje?</label>
                <div class=" col-md-5">
                    <a class="btn btn-lg btn-primary btn-block" href="register" role="button">Registracija</a>
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