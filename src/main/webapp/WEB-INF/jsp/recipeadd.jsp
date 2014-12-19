<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Add recipe</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/addRecipe.js" />"></script>
</head>
<body>

    <div class="page-wrap">

       <div class="navbar navbar-default navbar-fixed-top menu " role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed collapse-button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home">
					    <!-- System brand -->
                        <p class="brand">
                            <img src="<c:url value="/resources/svg/brand.svg"/>" />KuPRA
						</p>
                    </a>
                </div>
                <div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="recipe">Ikelti recepta</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="search/all">Visi Receptai</a></li>
                                <li><a href="search/user">Mano receptia</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="product/all">Produktai</a></li>
                                <li><a href="unit/all">Matavimo vienetai</a></li>
                            </ul>
                        </li>
                        <li><a href="fridge/list">Šaldytuvas</a></li>
                        <li><a href="meals">Valgiaraštis</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="profile">Vartotojo profilis</a></li>
                        <li><a href="../j_spring_security_logout">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>

        <div class="add-recept-form">
		  <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <form:form method="POST" action="home" class="form-horizontal" role="form" modelAttribute="recipeForm" enctype="multipart/form-data">
                        <div class="form-horizontal add-recepts-header">
                            <h1>Receptu pridejimas</h1>
                        </div>
                        <div class="form-group">
                            <label for="recept-name" class="col-md-2 control-label">Pavadinimas</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="recept-name" placeholder="Pavadinimas" value="${recipeForm.name}" name="name" />
								<form:errors path="name" cssClass="error" />
                            </div>
                        </div>
						<div class="form-group">
                            <label for="recept-name" class="col-md-3 col-sm-3 control-label">Gamybos trukmė</label>
                            <div class="col-md-3 col-sm-3">
                                <input type="text" class="form-control" id="recept-name" placeholder="" value="" name="" />
								<form:errors path="" cssClass="error" />
                            </div>
							<label for="recept-name" class="col-md-3 col-sm-3 control-label">Porcijų skaičius</label>
							 <div class="col-md-3 col-sm-3">
                                <input type="text" class="form-control" id="recept-name" placeholder="" value="" name="" />
								<form:errors path="" cssClass="error" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recept-name" class="col-md-2 control-label">Nuotraukos</label>
                            <div class="col-md-10">
								<!--<input type="file" id="file" name="file"/>-->
								<form class="form-horizontal">
									<div class="text-box form-group container">
											<div class="col-md-4"><input type="file" class="" name="txtImage[]" id="imageinput"></div>
									</div>
								</form>
								<a class= "add-image-box col-md-12">Pridėti dar nuotraukų </a>
                            </div>
							
                        </div>
                        <div class="form-group ingredients-form ">
                            <label for="ingredients" class="col-sm-2 control-label">Ingridientai</label>
                            <div class="col-sm-10  ">

                              <!--  <input type="text" class="form-control control-group inline-ingredients" id="ingredients" placeholder="Ingredientas" size="45">
                                <input type="text" class="form-control control-group inline-ingredients" id="ingredient-size" size="2" />
                                <div class="dropdown control-group inline-ingredients">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                        Vertes
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <li role="presentation" name="recipe-unit"><a role="menuitem" tabindex="-1" href="#">kg</a></li>
                                        <li role="presentation" name="recipe-unit"><a role="menuitem" tabindex="-1" href="#">mg</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-default">Prideti</button>
                                <button type="button" class="btn btn-default">Pašalinti</button>
								-->
								
								
										<div class="row">
											<div class="form-group form-group-options col-md-12">
												<div class="input-group input-group-option">
													<input type="text" name="ingredients[]" class="form-control" placeholder="Ingridientas">
													<input type="text" name="quantities[]" class="form-control" placeholder="kiek">
													<input type="text" name="units[]" class="form-control" placeholder="units">
													<span class="input-group-addon input-group-addon-remove">
															<span class="glyphicon glyphicon-remove"></span>
														</span>
												</div>
											</div>
										</div>
								</div>
                        </div>
                        <div class="form-group ">
                            <label for="recept-description" class="col-md-2 control-label ">Aprašymas</label>
                            <div class="col-md-10 controls">
                                <!-- *** -->
                                <textarea class="form-control description" id="recipe-despription" value="${recipeForm.description}" name="description"></textarea>
								<form:errors path="description" cssClass="error" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="visibility" />
                                        Privatus 
                                    </label>
                                </div>
                                <div class="info-about-private">
                                    Receptas nebus matomas kitiems sistemos vartotojams išskyrus jusu draugus
                                </div>
                            </div>
                        </div>
                        <div class="save-button-wrapper">
                            <button class="button">Sukurti</button>
                        </div>
                    </form:form>
                </div>
            </div>
		   </div>
        </div>
    </div>
    <footer class="footer">
      <div class="container">
        <p>KuPRA</p>
      </div>
    </footer>
	
	<script>
$(function(){
	$(document).on('focus', 'div.form-group-options div.input-group-option:last-child input', function(){
		var sInputGroupHtml = $(this).parent().html();
		var sInputGroupClasses = $(this).parent().attr('class');
		$(this).parent().parent().append('<div class="'+sInputGroupClasses+'">'+sInputGroupHtml+'</div>');
	});
	
	$(document).on('click', 'div.form-group-options .input-group-addon-remove', function(){
		$(this).parent().remove();
	});
});

$(document).ready(function(){
     $('.add-image-box').click(function(){
        var box_html = $('<div class="text-box form-group container"><div class="col-md-4"><input type="file" class="" name="txtImage[]" id="imageinput"/></div><div class=""><button type="submit" class="remove-box btn btn-danger btn-sm"><i class="fa fa-minus-circle fa-lg"></i></button></div></div>');
        $('.text-box:last').after(box_html);
        box_html.fadeIn('slow');
    });

    $('.form-horizontal').on('click', '.remove-box', function(){
            $(this).closest(".form-group").remove();
        return false;
    });

});
	
	</script>
</body>
</html>