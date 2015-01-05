<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Receptai</title>
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
        
        <jsp:include page="navbar.jsp" />

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
    
    <jsp:include page="footer.jsp" />
    
</body>
</html>
