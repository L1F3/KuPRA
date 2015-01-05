<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Paieška šaldytuve</title>
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
					<h3>Paieška pagal šaldytuve esančius produktus</h3>
					<div class="row"> 
						
						<c:forEach var="recipe" items="${recipes}">
							<div class="col-md-3 col-sm-6">
								<div class="panel panel-default panel-custom" >
									<!-- Recipe image -->
									<center><a href="../recipe/${recipe.recId}"><img src="../recipe/image/${recipe.recId}" class="image-all"/></a></center>
									
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

    <jsp:include page="footer.jsp" />
    
</body>
</html>
