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
            <div class="row">
                <div class="container">
                    <div class='row' style="margin-top: 20px;">
						<c:forEach var="meal" items="${meals}">
                        <!-- recipe's block -->
                        <div class="col-md-3">
                            <div class="panel panel-default  panel-custom panel-custom-meals">
							<!-- Delete button -->
                                <div class="delete-button-menu " style="position:relative">
                                     <a href="meals/${meal.recipe.recId}/delete" type="button" style=" right:0; position:absolute;" class="btn btn-default"><img src="<c:url value="/resources/svg/delete.svg"/>" style=" height:20px; width:20px;" /></a>
                                </div>
                                <!-- Recipe's picture-->
                                <img src="recipe/image/${meal.recipe.recId}/thumb2" class="img-responsive image-size" style="width: 100%"/>
                                <!-- Recipe's information -->
                                <div class="container" style="width: 100%;">
								    <!-- Recipe's name -->
                                    <div class="row recipe-name-box">
                                        <div class="col-xs-12" style="text-wrap:normal;">
                                            <p class="recipe-name">${meal.recipe.name}</p>
                                        </div>
                                    </div>
                                    <!-- Recipe's author -->
                                    <div class="row made-recipe-user-name">
                                        <div class="col-xs-12" style="text-wrap:normal;">
                                            <a href="profile/${meal.user.userId}">${meal.recipe.user.username}</a>
                                        </div>
                                    </div>
                                    <!-- Recipe's rating -->
                                    <div class="row">
                                        <div class="col-xs-6" style="text-align: center;">
                                            <img src="<c:url value="resources/svg/star.svg"/>" style="height: 30px; width: 30px; margin-left: auto; margin-right: auto;" />
                                            <!-- Rating -->
                                            <p class="recipe-rating">${meal.recipe.rating}</p>
                                        </div>
                                        <div class="col-xs-6" style="text-align: center;">
                                            <img src="<c:url value="resources/svg/people.svg"/>" style="height: 30px; width: 30px; margin-left: auto; margin-right: auto;" />
                                            <!-- Total votes -->
                                            <p class="rating-people">${meal.recipe.ratingCount}</p>
                                        </div>
                                    </div>
                                    <!-- Rate recipe block -->
									<form:form action="recipe/rate" method="POST" modelAttribute="ratingForm">
									<input type="hidden" name="recipeId" value="${meal.recipe.recId}"/>
                                    <div class="row">
                                        <div class="col-xs-6 dropdown-menu-style" style="padding-right: 0px;">
                                            <select style="margin-top: 10px; margin-left: 30px;" name="ratingValue">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-6" style="padding-left: 0px;">
										<c:choose>
											<c:when test="${meal.made == true}"> 
												<button method="POST" type="submit" class="btn btn-lg btn-warn">Vertinti</button>
											</c:when>
											<c:otherwise>
												<button method="POST" disabled="true" type="submit" class="btn btn-lg btn-warn">Vertinti</button>
											</c:otherwise>
										</c:choose>
                                        </div>
                                    </div>
									</form:form>
                                    <!-- Make the meal button -->
                                    <div class="row">
										<div class="col-xs-6" style="padding-right: 0px;">
											<p>Porcijų kiekis</p>
											<form>
												<input type="text" name="servings" size="4" style="margin-left:15px; margin-bottom:20px;" />
											</form>
										</div>
                                        <div class="col-xs-6" style="padding-left: 0px;">
										<a  href="make/${meal.mealId}" id="create_meal" class="btn btn-lg btn-warn" style="margin-top: 5px; margin-bottom: 5px;" data-container="body" onclick="showPopup3459kablelis3taskas14(this)">Gaminti</a>

                                        </div>
                                    </div>
                                    <!-- Date of making -->
                                    <div class="row">
                                        <p class="col-xs-6" style="font-size: 10pt; padding-left: 5px;">Gaminimo data</p>
                                        <p class="col-xs-6" style="font-size: 10pt; padding-right: 5px;">2014-12-13 16:37</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end of block -->
						</c:forEach>
                    </div>
                </div>
				<div class="container col-md-6 col-md-offset-3" style="border: 12px solid #FFFFFF; border-radius: 10px;  background: #FFFFFF; ">
     <div class="row">
      <p class="col-xs-4" id="alert" style="color:red">Truksta produktų</p>
	  <input type="submit" value="Pridėti viską į šaldytuvą " class=" btn btn-warn" />
     </div>
	  <form:form method="POST" action="DSasadasd">
     <div class="col-md-12">
      <div class="table-responsive">
       <table id="mytable" class="table table-hover">
        <thead>
         <th>Produktas</th>
         <th>Kiekis</th>
        </thead>
        <tbody>
           <c:forEach var="item" items="${fromTwo}">
         <tr>
          <td>${item.fourth}</td>
          <td>
           <input type="text"  style="width:60px;" class="fridge-text-field" value="${item.second}" />
           <span class="fridge-row">${item.third}</span>
          </td>
         </tr>
          </c:forEach>
         
        </tbody>
       </table>
      </div>          
     </div>
	  </form:form>
     
    </div>
				
            </div>
        </div>
    </div>
	<!--
    <div id="popup3459kablelis3taskas14" class="container" style="display: none; padding: 5px;">
        <div class="row">
            <p class="col-xs-6">Porcijų kiekis</p>
            <div class="col-xs-6">
                <form>
                    <input type="text" name="servings" size="4" />
                </form>
            </div>
        </div>
        <div class="row">
            <p class="col-xs-6" id="alert" style="color:red">Truksta produktų</p>
            <a class="col-xs-6 accept-serving" href="" type="button">Šaldytuvas</a>
        </div>
        <div class="row">
            <p class="col-xs-12">Kiauliena 10g</p>
            <p class="col-xs-12">Kiauliena 20g</p>
        </div>
    </div>
	-->
    <jsp:include page="footer.jsp" />

    <script>

        function showPopup3459kablelis3taskas14(parent) {
            $(parent).popover({
                html: true,
                content: function () {
                    return $("#popup3459kablelis3taskas14").html();
                }
            })
        }

        function setPopup3459kablelis3taskas14AlertColor(condition) {
            if (condition == true) {
                $("#alert").style.fontcolor = "green"
            } else {
                $("#alert").style.fontcolor = "red"
            }
        }

    </script>
</body>
</html>
