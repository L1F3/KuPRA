<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Trūksta</title>
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

		<div class="add-recept-form container">
            <div class="row">
                <div class="container col-md-6 col-md-offset-3" style="border: 12px solid #FFFFFF; border-radius: 10px;  background: #FFFFFF; ">
					<div class="row">
						<p class="col-xs-6" id="alert" style="color:red">Truksta produktų</p>
						<a class="col-xs-6 accept-serving" href="fridge/list" type="button">Šaldytuvas</a>
					</div>
					<div class="row">
						<c:forEach var="item" items="${fromTwo}">
						<p class="col-xs-12">${item.fourth} ${item.second}(${item.third})</p>
						</c:forEach>
					</div>
				</div>
            </div>
        </div>
	</div>
	
    <jsp:include page="footer.jsp" />
	
</body>
</html>