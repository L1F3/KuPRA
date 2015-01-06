<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Friend recipes</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
</head>
<body>
    <div class="page-wrap">

        <jsp:include page="navbar.jsp" />



        <div class="profile-data">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-2  ">
                      <!--<div class="inline-profile">

                            <img src="" class="img-circle  user-profile-image"/>
                        </div>-->
                    </div>
                    <div class="col-md-8 col-sm-10  ">
                        <div>
						    <!-- User nickname -->
                            <span class="user-nick">${user.name}</span>
							 <!-- About user -->
                            <p>${user.description}</p>
                        </div>
                    </div>
                    <div class="col-md-2 ">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <p style="font-size: 30px; padding-top: 40px;">Receptai </p>
        </div>
        <div class="recipies-content">
            <div class="container">
                <div class='row'>
       <c:forEach var="recipe" items="${friendRecipes}">
			<div class='col-sm-3'>
              <div class="panel panel-default  panel-custom" >
			    <!-- Recipe image -->
                <img src="../recipe/image/${recipe.recId}" class="image-all"/>
				<!-- Recipe name -->
                <div class="recipe-name-box">
                     <a href="../recipe/${recipe.recId}"><p class="recipe-name" >${recipe.name} Cool</p></a>
                 </div>
                   <div class="made-recipe-user-name">
                 <!-- Recipe creator -->
                        <span>${user.username}</span> 
                </div>
				 <!-- Recipe rating/ people rating -->
                 <div class="recipe-rating-box">
                         <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">${recipe.rating}</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">${recipe.ratingCount}</p>
                         </span>
                     </div>  
                  
                 </div>
          </div>
		  </c:forEach>
                   <!-- <div class='col-sm-3'>
                        <div class="panel panel-default  panel-custom">
                            <img src="pie.jpg" class="img-responsive image-size" />
                            <div class="made-recipe-user-name">
                                <a href="#">Jonas Jonaitis</a>
                            </div>
                            <div class="recipe-name-box">
                                <a href="HTMLPage1.html">
                                    <p class="recipe-name">Žele</p>
                                </a>
                            </div>
                            <div class="recipe-info-box">
                                <span>Kaledinis patiekalas vaikams
                                </span>
                            </div>
                            <div class="recipe-rating-box">
                                <span>
                                    <img src="star.svg" class="img-responsive rating-icon" />
                                    <p class="recipe-rating">7</p>
                                </span>
                                <span>
                                    <img src="people.svg" class="img-responsive rating-icon" />
                                    <p class="rating-people">80</p>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class='col-sm-3'>
                        <div class="panel panel-default  panel-custom">
                            <img src="pie.jpg" class="img-responsive image-size" />
                            <div class="made-recipe-user-name">
                                <a href="#">Jonas Jonaitis</a>
                            </div>
                            <div class="recipe-name-box">
                                <a href="HTMLPage1.html">
                                    <p class="recipe-name">Žele</p>
                                </a>
                            </div>
                            <div class="recipe-info-box">
                                <span>Kaledinis patiekalas vaikams
                                </span>
                            </div>
                            <div class="recipe-rating-box">
                                <span>
                                    <img src="star.svg" class="img-responsive rating-icon" />
                                    <p class="recipe-rating">7</p>
                                </span>
                                <span>
                                    <img src="people.svg" class="img-responsive rating-icon" />
                                    <p class="rating-people">80</p>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class='col-sm-3'>
                        <div class="panel panel-default  panel-custom">
                            <img src="pie.jpg" class="img-responsive image-size" />
                            <div class="made-recipe-user-name">
                                <a href="#">Jonas Jonaitis</a>
                            </div>
                            <div class="recipe-name-box">
                                <a href="HTMLPage1.html">
                                    <p class="recipe-name">Žele</p>
                                </a>
                            </div>
                            <div class="recipe-info-box">
                                <span>Kaledinis patiekalas vaikams
                                </span>
                            </div>
                            <div class="recipe-rating-box">
                                <span>
                                    <img src="star.svg" class="img-responsive rating-icon" />
                                    <p class="recipe-rating">7</p>
                                </span>
                                <span>
                                    <img src="people.svg" class="img-responsive rating-icon" />
                                    <p class="rating-people">80</p>
                                </span>
                            </div>

                        </div>
                    </div> -->
                </div>
            </div>
        </div>
        
    </div>
    
    <jsp:include page="footer.jsp" />
    
</body>
</html>
