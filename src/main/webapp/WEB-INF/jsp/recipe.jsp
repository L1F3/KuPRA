﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>${recipe.name}</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
	 <link href="<c:url value="/resources/css/lightbox.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	 <script src="<c:url value="/resources/js/lightbox.min.js" />"></script>
	 	 <script src="<c:url value="/resources/js/jquery-1.11.0.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css' />
</head>
<body>

    <div class="page-wrap">

         <jsp:include page="navbar.jsp" />

        <div class="user-recipe-content-wrapper container">
            <div class="row ">
                <div class="col-md-2 container">
                    <div class="menu-row  ">
						<input type="submit" value="Įtraukti į valgiaraštį" class=" btn-block button" onclick="window.location.href='../meals/add/${recipe.recId}'"/>
                        <input type="submit" data-toggle="modal" data-target="#patikrinti_ingridientus" value="Patikrinti ingredientus" class=" btn-block button" />
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
                                <!--<img src="../recipe/image/${recipe.recId}/thumb" class="img-responsive img-size" /> -->
								<a href="../recipe/image/${recipe.recId}" data-lightbox="roadtrip"><img src="../recipe/image/${recipe.recId}" class="img-responsive img-size" /></a>
							</div>
                        </div>

                    </div>
					<!-- Recipe cooking time/rating/people rating -->
                    <div class="rating-time">
                        <div class="row">
						    <div class="col-md-3 col-sm-3 col-xs-3">
                                <img src="<c:url value="/resources/svg/clock.svg"/>" class="img-responsive user-recipe-img display-inline" />
                                <span class="display-inline">Pagaminamas per:</span>
                                <span class="cooking-time display-inline">${recipe.cookingTime}</span>
                            </div>
							<div class="col-md-3 col-sm-3 col-xs-3">
                                <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive user-recipe-img display-inline" />
                                <span class="display-inline">Porcijų kiekis</span>
                                <span class="cooking-time display-inline">${recipe.servings}</span>
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
										<li>${recipeProduct.amount} ${recipeProduct.product.unit.abbreviation} ${recipeProduct.product.name}</li>
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
										
										
										<c:forEach var="item" items="${forTwo}">
										<div class="needed-products-form">
											<span>${item.fourth}<span>
											<span>${item.second}</span>
											<span>${item.third}</span>
										</div>
										</c:forEach>
																				
                                    </div>
                                </div>
                            </div>
                        </div>
		
		
		
    </div>
      
      <jsp:include page="footer.jsp" />
      
</body>
</html>
