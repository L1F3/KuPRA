<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Pagrindinis puslapis</title>
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

<div id="myCarousel" class="carousel slide">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="<c:url value="/resources/4.jpg"/>"/>
    </div>
    <div class="item">
      <img src="<c:url value="/resources/1.jpg"/>"/>
    </div>
    <div class="item">
      <img src="<c:url value="/resources/2.jpg"/>"/>
    </div>
  </div>
  
  <form:form method="GET" class="col-md-12" id="searchForm" action="search/all">
    <div class="form-group col-md-4 col-md-offset-4">
      <div class="input-group input-group-lg ">
        <input type="text" class="form-control" placeholder="Paieška" name="key"/>
        <span class="input-group-btn">
           <button type="submit" class="btn btn-default" type="button"><img id="magnifying-glass"  src="<c:url value="/resources/svg/magnifying.svg"/>" class="inputFieldIcon" onmouseover="hover(this);" onmouseout="unhover(this);" /></button>
        </span>
      </div>
    </div>
  </form:form>


  
  <!-- Controls 
  <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>  
      -->
</div>


     <div class="recipies-content">
        <div class="container">
         <h3>Populiariausi receptai</h3>
          <div class='row'>
         <c:forEach var="recipe" items="${topRecipes}">
			<div class='col-md-3 col-sm-4 col-xs-12'>
              <div class=" panel panel-default  panel-custom" >
			    <!-- Recipe image -->
               <center><a href="../app/recipe/${recipe.recId}"><img src="recipe/image/${recipe.recId}"  class="image-all"></center>
				<!-- Recipe name -->
                <div class="recipe-name-box">
                     <a href="../app/recipe/${recipe.recId}"><p class="recipe-name" >${recipe.name}</p></a>
                 </div>
				<div class="made-recipe-user-name">
				 <!-- Recipe creator -->
                        <span>${recipe.user.username}</span>
                </div>
				 <!-- Recipe description -->
              <!--   <div class="recipe-info-box">
                       <span>${recipe.description}</span>
                 </div> -->
				 <!-- Recipe rating/ people rating -->
                 <div class="recipe-rating-box">
                         <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">${recipe.finalRating}</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">${recipe.ratingCount}</p>
                         </span>
                     </div>  
                  
                 </div>
          </div>
		  </c:forEach>
        </div> 
      </div>
      </div>
  </div>
  
  <jsp:include page="footer.jsp" />


    <script type="text/javascript">
        $(document).ready(function () {
            $('.carousel').carousel({ interval: 7000 });
        });
</script>
</body>


</html>
