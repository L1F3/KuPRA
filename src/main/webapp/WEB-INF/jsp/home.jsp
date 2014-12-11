<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Registration</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
</head>
<body>

  <div id="page-content-wrapper">

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
                    <a class="navbar-brand" href="#">
					    <!-- System brand -->
                        <p class="brand">
                            <img class="brand"src="<c:url value="/resources/svg/brand.svg"/>" />KuPRA</p>
                    </a>
                </div>
                <div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="add-recept">Ikelti recepta</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Visi Receptai</a></li>
                                <li><a href="#">Mano receptia</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Produktai</a></li>
                                <li><a href="#">Matavimo vienetai</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Šaldytuvas</a></li>
                        <li><a href="#">Valgiaraštis</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="profile">Vartotojo profilis</a></li>
                        <li><a href="#">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>

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
  
  <form class="col-md-12" id="searchForm">
    <div class="form-group col-md-4 col-md-offset-4">
      <div class="input-group input-group-lg ">
        <input type="text" class="form-control" placeholder="Search"/>
        <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
      </div>
    </div>
  </form>


  
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
			<div class='col-sm-3'>
              <div class="panel panel-default  panel-custom" >
			    <!-- Recipe image -->
                <img src="<c:url value="/resources/pie.jpg"/>" class="img-responsive image-size"/>
                <div class="made-recipe-user-name">
				 <!-- Recipe creator -->
                        <span>Jonas Jonaitis</span> 
                </div>
				<!-- Recipe name -->
                <div class="recipe-name-box">
                     <a href="#"><p class="recipe-name" >${recipe.name} Cool</p></a>
                 </div>
				 <!-- Recipe description -->
                 <div class="recipe-info-box">
                       <span>${recipe.description} AAAAAA</span>
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
		  <!--
           <div class='col-sm-3'>
              <div class="panel panel-default  panel-custom" >
                <img src="<c:url value="/resources/pie.jpg"/>" class="img-responsive image-size"/>
                <div class="made-recipe-user-name">
                        <a href="#">Jonas Jonaitis</a> 
                </div>
                <div class="recipe-name-box">
                     <a href="#"><p class="recipe-name" >Želė</p></a>
                 </div>
                 <div class="recipe-info-box">
                       <span>Kalėdinis patiekalas vaikams
                       </span>
                 </div>
                 <div class="recipe-rating-box">
                         <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">7</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">80</p>
                         </span>
                     </div>  
                  
                 </div>
          </div>      
           <div class='col-sm-3'>
              <div class="panel panel-default  panel-custom" >
                <img src="<c:url value="/resources/pie.jpg"/>" class="img-responsive image-size"/>
                <div class="made-recipe-user-name">
                        <a href="#">Jonas Jonaitis</a> 
                </div>
                <div class="recipe-name-box">
                     <a href="#"><p class="recipe-name" >Želė</p></a>
                 </div>
                 <div class="recipe-info-box">
                       <span>Kalėdinis patiekalas vaikams
                       </span>
                 </div>
                 <div class="recipe-rating-box">
                         <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">7</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">80</p>
                         </span>
                     </div>  
                  
                 </div>
          </div>
           <div class='col-sm-3'>
              <div class="panel panel-default  panel-custom" >
                <img src="<c:url value="/resources/pie.jpg"/>" class="img-responsive image-size"/>
                <div class="made-recipe-user-name">
                        <a href="#">Jonas Jonaitis</a> 
                </div>
                <div class="recipe-name-box">
                     <a href="#"><p class="recipe-name" >Želė</p></a>
                 </div>
                 <div class="recipe-info-box">
                       <span>Kalėdinis patiekalas vaikams
                       </span>
                 </div>
                 <div class="recipe-rating-box">
                         <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">7</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">80</p>
                         </span>
                     </div>  
                  
                 </div>
          </div>
           <div class='col-sm-3'>
              <div class="panel panel-default  panel-custom" >
                <img src="<c:url value="/resources/pie.jpg"/>" class="img-responsive image-size"/>
                <div class="made-recipe-user-name">
                        <a href="#">Jonas Jonaitis</a> 
                </div>
                <div class="recipe-name-box">
                     <a href="HTMLPage1.html"><p class="recipe-name" >Želė</p></a>
                 </div>
                 <div class="recipe-info-box">
                       <span>Kalėdinis patiekalas vaikams
                       </span>
                 </div>
                 <div class="recipe-rating-box">
                         <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">7</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">80</p>
                         </span>
                     </div>  
                  
                 </div>
          </div>
           <div class='col-sm-3'>
              <div class="panel panel-default  panel-custom" >
                <img src="<c:url value="/resources/pie.jpg"/>" class="img-responsive image-size"/>
                <div class="made-recipe-user-name">
                        <a href="#">Jonas Jonaitis</a> 
                </div>
                <div class="recipe-name-box">
                     <a href="#"><p class="recipe-name" >Želė</p></a>
                 </div>
                 <div class="recipe-info-box">
                       <span>Kalėdinis patiekalas vaikams
                       </span>
                 </div>
                 <div class="recipe-rating-box">
                         <span>
                              <img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
                               <p class="recipe-rating">7</p>
                         </span>
                         <span>
                              <img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
                              <p class="rating-people">80</p>
                         </span>
                     </div>  
                  
                 </div>
          </div>	-->	  
        </div> 
      </div>
      </div>
	  <div class="push"></div>
  </div>
  <footer>
        <div class="container-fluid custom-footer">
            <div class="container">
                <p>KuPra PS5 gamybos </p>
            </div>
        </div>
    </footer>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.carousel').carousel({ interval: 7000 });
        });
</script>
</body>


</html>
