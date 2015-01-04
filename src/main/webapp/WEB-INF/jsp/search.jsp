<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Mano receptai</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
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
                                <li><a href="all">Visi Receptai</a></li>
                                <li><a href="user">Mano receptia</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="../product/all">Produktai</a></li>
                                <li><a href="../unit/all">Matavimo vienetai</a></li>
                            </ul>
                        </li>
                        <li><a href="../fridge/list">Šaldytuvas</a></li>
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
        <div class="container recipe-form">
            <div class="row">
                <div class="col-md-3 ">
                    <div class="search-panel">
                        <!-- Search box -->
                        <form:form method="GET" action="${requestScope['javax.servlet.forward.request_uri']}">
                            <div class="form-group">
                                 <div class="input-group input-group-sm">
                    <div class="icon-addon addon-sm">
                       <input name="key" type="text" class="form-control" id="inputSearch" placeholder="Ieškoti" value="${key}" />
                    </div>
					 <span class="input-group-btn">
                        <button type="submit" class="btn btn-default" type="button"><img id="magnifying-glass"  src="<c:url value="/resources/svg/magnifying.svg"/>" class="inputFieldIcon" onmouseover="hover(this);" onmouseout="unhover(this);" /></button>
                    </span>
                </div>
            </div>
                        <br />
                        <p><b>Rikiuoti pagal įvertinimą</b></p>
                        <div id="showingOrder-form-wrapper">
                                <input type="radio" name="order" value="best" />
                                Geriausi viršuje<br />
                                <input type="radio" name="order" value="worst" />
                                Blogiausi viršuje<br />
                                <div class="dropdown-menu-style">
                                    <input type="radio" name="order" value="byRating" />
                                    <select name="rating">
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
                                <br />
                                <input type="radio" name="order" value="none" />
                                Nenumatyta<br />
                        </div>
                        <br />
                        <div class="refreshButtonStyle">
                            <button class="button" type="submit" onclick="">Atnaujinti</button>
                        </div>
                        </form:form>
                    </div>

                </div>
				<div class="col-md-9 container ">
					<div class="row">
						
						<c:forEach var="recipe" items="${recipes}">
							<div class="col-md-4 col-sm-6">
								<div class="panel panel-default panel-custom" >
									<!-- Recipe image -->
									<center><a href="../recipe/${recipe.recId}"><img src="../recipe/image/${recipe.recId}/thumb2" class="img-responsive" id="search-tile-thumbnail"/></a></center>
									
									<!-- Recipe name -->
									<div class="recipe-name-box">
										<a href="../recipe/${recipe.recId}"><p class="recipe-name" >${recipe.name}</p></a>
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
