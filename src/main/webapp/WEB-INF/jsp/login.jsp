<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Connect</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
</head>

<body>

    
   <!-- <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
              <div class="item active">
               <img src="2.jpg"  class="img-responsive"  > 
              </div>
              <div class="item">
               <img src="1.jpg"   class="img-responsive" > 
              </div>
            </div>
     </div>

    -->

<div id= "page-content-wrapper">

  <div class="container">
      <div class="row">
        <div class="col-md-12  ">

         <img src="<c:url value="/resources/MainI.svg" />"  class="center-block  icon-size img-responsive"/>
          
        <form method="post" action="<c:url value='j_spring_security_check' />" class="form-horizontal form-signin" role="form">
            <div class="form-group inner-addon left-addon">
               <label for="inputEmail" class="col-sm-2 control-label">Email</label>
               <div class="col-sm-10">
<!-- *** -->          <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="username" >  
                    <i class="glyphicon glyphicon-user"></i>
                </div>
           </div>
           <div class="form-group inner-addon left-addon">
               <label for="inputPassword" class="col-sm-2 control-label">Password</label>
               <div class="col-sm-10">
<!-- *** -->          <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password" >
                    <i class="glyphicon glyphicon-lock"></i>
               </div>
           </div>
            <a href="javascript:;" class="forget" data-toggle="modal" data-target=".forget-modal">Forgot your password?</a>
           <div class="form-group login-form">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-lg btn-primary btn-block">Sign in</button>
                </div>
           </div>
           <div class="form-group registration-form">
             <div class="col-sm-offset-2 col-sm-10">
                   <button type="submit" class="btn btn-lg btn-primary btn-block" value="Login">Registration</button>
             </div>
           </div>
        </form>
     </div> 
   </div>  
  </div> 
    
    
    <div class="modal fade forget-modal" tabindex="-1" role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">X</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Recovery password</h4>
			</div>
			<div class="modal-body">
				<p>Type your email account</p>
<!-- *** -->    <input type="email" name="recovery-email" id="recovery-email" class="form-control">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-custom">Recovery</button>
			</div>
		</div> 
	</div> 
</div> 
    
    
      
  </div>  

	
</body>
</html>