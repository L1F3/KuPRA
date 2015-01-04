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
    <script src="<c:url value="/resources/connect.js" />"></script>
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css' />
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
                     <a class="navbar-brand" href="../home">
					    <!-- System brand -->
                        <p class="brand">
                            <img src="<c:url value="/resources/svg/brand.svg"/>" />KuPRA
						</p>
                    </a>
                </div>
                <div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="../recipe">Ikelti recepta</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="../search/all">Visi Receptai</a></li>
                                <li><a href="../search/user">Mano receptai</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="../product/all">Produktai</a></li>
                                <li><a href="../unit/all">Matavimo vienetai</a></li>
                            </ul>
                        </li>
                        <li><a href="../fridge/all">Šaldytuvas</a></li>
                        <li><a href="../meals">Valgiaraštis</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../profile">Vartotojo profilis</a></li>
                        <li><a href="../../j_spring_security_logout">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>

        <div class="user-recipe-content-wrapper container">
            <div class="row ">
                <div class="col-md-2 container">
                    <div class="menu-row  ">
						<a type="button" href="../meals/add/${recipe.recId}" class="button" type="submit" onclick="">Įtraukti į valgiaraštį</a>
                        <input type="submit" value="Patikrinti ingredientus" class=" btn-block button" />
                    </div>

                </div>
                <div class=" content col-md-10 container">
				    <!-- Recipe name -->
                    <p class="recipe-top-name">${recipe.name}</p>
					<!-- Creator -->
                    <a href="../profile/${recipe.user.userId}" class="recipe-user-nick">${recipe.user.username}</a>
					<!-- Recipe Images -->
                    <div class="images">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="../recipe/image/${recipe.recId}/thumb" class="img-responsive img-size" />
							</div>
                        </div>

                    </div>
					<!-- Recipe cooking time/rating/people rating -->
                    <div class="rating-time">
                        <div class="row">
						    <div class="col-md-3 col-sm-3 col-xs-3">
                                <img src="<c:url value="/resources/svg/clock.svg"/>" class="img-responsive user-recipe-img display-inline" />
                                <span class="display-inline">Pagaminamas per:</span>
                                <span class="cooking-time display-inline">60min</span>
                            </div>
							<div class="col-md-3 col-sm-3 col-xs-3">
                                <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive user-recipe-img display-inline" />
                                <span class="display-inline">Porcijų kiekis</span>
                                <span class="cooking-time display-inline">3</span>
                            </div>

                            <div class="col-md-3 col-sm-3  col-xm-3 ">
                                <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive user-recipe-img  display-inline" />
                                <span class="display-inline">Įvertinimas</span>
                                <span class="display-inline">${recipe.rating}</span>
                            </div>
                            <div class="col-md-3 col-sm-3  col-xm-3 ">
                                <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive user-recipe-img display-inline" />
                                <span class="display-inline">${recipe.ratingCount}</span>
                            </div>
                        </div>
                    </div>
					<!-- Recipe description -->
                    <div class="recipe-user-info">
                        <div class="row recipe-user-row wrap">
                            <div class="col-md-6">
                                <p>Ingredientai:</p>
                                <ul class="recipe-user-ingridients">
								
									<c:forEach var="recipeProduct" items="${recipe.ingredients}">
										<li>${recipeProduct.amount}${recipeProduct.unit.abbreviation} ${recipeProduct.product.name}</li>
									 </c:forEach>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <p>Aprašymas:</p>
                                <p class="recipe-description">${recipe.description}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<div class="modal fade" id="patikrinti_ingridientus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-vertical-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <!--Pavadinimas -->
                                        <h4 class="modal-title">Patikrinimas</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p style="color:red">Nėra produktų</p>
										
										<div class="needed-products-form">
											<span>Bulvės<span>
											<span>2</span>
											<span>kg</span>
										</div>
										<div class="needed-products-form">
											<span>Bulvės<span>
											<span>2</span>
											<span>kg</span>
										</div>
										<div class="needed-products-form">
											<span>Bulvės<span>
											<span>2</span>
											<span>kg</span>
										</div>
										<div class="needed-products-form">
											<span>Bulvės<span>
											<span>2</span>
											<span>kg</span>
										</div>
																				
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
</body>
</html>
