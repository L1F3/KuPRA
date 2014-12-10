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
  <div class="container login">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">

         <img src="<c:url value="/resources/MainI.svg" />"  class="center-block  icon-size img-responsive"/>
          
        <form class="form-horizontal form-signin" role="form">
             <fieldset>
            <div class="form-group ">
               <label for="inputEmail" class="col-sm-2 control-label">Email</label>
               <div class="col-sm-10 controls">
			         <div class="input-group">
					   <span class="input-group-addon"><img src="<c:url value="/resources/svg/user.svg"/>"  class="icons"/> </span>
<!-- *** -->           <input type="email" class="form-control" id="inputEmail" placeholder="Email" required/>  
					 </div> 
					 <!-- Cia klaida -->
                </div>
           </div>
           <div class="form-group">
               <label for="inputPassword" class="col-sm-2 control-label">Password</label>
               <div class="col-sm-10 controls"> 
			       <div class="input-group">
				      <span class="input-group-addon"><img src="<c:url value="/resources/svg/key.svg"/>"  class="icons"/></span>
<!-- *** -->          <input type="password" class="form-control" id="inputPassword" placeholder="Password" required/>
					</div> 
					 <!-- Cia klaida -->
               </div>
           </div>
           <div class="form-group">
             <label class="col-md-4 control-label" for="buttonLogIn"></label>
             <div class=" col-md-12 center-block ">
                <a class="btn btn-lg btn-primary btn-block" href="Main.html" role="button">Prisijungti</a>
                 <a href="javascript:;" class="forget" data-toggle="modal" data-target=".forget-modal">Pamiršote slaptažodį ?</a>
             </div>  
                    
          </div> 
           
           <div class="form-group">
                <label class="col-md-7 control-label" for="buttonRegistration">Norite sukurti naują formą?</label>
                <div class=" col-md-5">
                    <a class="btn btn-lg btn-primary btn-block" href="register" role="button">Registracija</a>
                </div>
           </div>
         </fieldset>
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
					<span class="sr-only">Uždaryti</span>
				</button>
				<h4 class="modal-title">Atkurti slaptažodį</h4>
			</div>
			<div class="modal-body">
				<p>Įveskite savo elektroninį paštą</p>
<!-- *** -->    <input type="email" name="recovery-email" id="recovery-email" class="form-control" required>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default button-recovery-cancel" data-dismiss="modal">Atšaukti</button>
				<button type="button" class="btn btn-custom button-recovery-accept">Atstatyti</button>
			</div>
		</div> 
	</div> 
</div> 
    
    
      
  </div>  

    <script type="text/javascript">
        $(document).ready(function () {
            $('.carousel').carousel({
                interval: 2000
            })
        });
</script>

	
</body>
</html>