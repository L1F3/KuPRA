<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Valgiaraštis</title>
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
		
	<div class="menu-wrap">
	   <div class="container">
		<div class='row'>
         <c:forEach var="recipe" items="${topRecipes}">
			<div class='col-md-3'>
              <div class=" panel panel-default  panel-custom" >
			    <!-- Recipe image -->
                <center><img src="recipe/image/${recipe.recId}/thumb2" class="img-responsive image-size"/></center>
                <div class="made-recipe-user-name">
				 <!-- Recipe creator -->
                        <span>${recipe.user.username}</span>
                </div>
				<!-- Recipe name -->
                <div class="recipe-name-box">
                     <a href="../app/recipe/${recipe.recId}"><p class="recipe-name" >${recipe.name}</p></a>
                 </div>
				 <!-- Recipe description -->
              <!--   <div class="recipe-info-box">
                       <span>${recipe.description}</span>
                 </div> -->
				 <!-- Recipe rating/ people rating -->
                 <div class="recipe-rating-box">
						      <!--Vertinimo skalė -->
                                    <div class="dropdown-menu-style">
                                            <select>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                            </select>
                                     </div>
						 <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">${recipe.rating}</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">${recipe.ratingCount}</p>
                         </span>
                     </div>  
					 <div class="create_vote_buttons">
                                    <!-- Create a meal button --> 
                                    <button id="create_meal" class="btn btn-lg btn-warn">Gaminti</button>
                                    <!--Rate btton -->
                                     <button type="button" class="btn btn-default">
                                        <span>Vertinti </span>
                                    </button>
                     </div>
                     <div class="date">
                                     <!--Date  -->
                                    <span class="manu_date">Gaminimo data</span>
                                    <span class="created_date">2014-12-13 16:37</span>
                     </div>
                 </div>
          </div>
		  </c:forEach>
        </div> 
		</div>
	 </div>
 </div>
 
 <jsp:include page="footer.jsp" />

    <script>
        var popupElement1 = 
           ' <div class="container"> Porcijų kiekis <input type="text" name="servings" size="4"/></div><div class="container"><span style="color:green">Produktų turite pakankamai</span><a type="button" class="accept-serving">Patvirtinti</a> </div>';
        var popupElement2 =
           ' <div class="container"> Porcijų kiekis <input type="text" name="servings" size="4"/></div><div class="container"><span style="color:red">Truksta produktų</span><a type="button" style="padding-left:10px" class="accept-serving">Šaldytuvas</a> </div> <div class="container row"><div class="span4"><div>Kiauliena 10g</div> <div>Kiauliena 20g</div></div>';

        $('#create_meal').popover({
            animation: true,
            content: popupElement2,
            html: true
        });
    </script>
</body>
</html>
