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

  <div class="page-wrap">
   
  <jsp:include page="navbar.jsp" />

		<div class="add-recept-form container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <form:form class="form-horizontal" role="form" method="POST" modelAttribute="unitForm">
                        <div class="form-horizontal add-recepts-header">
                            <h1>Matavimo vieneto pridėjimas</h1>
                        </div>
                        <div class="form-group" style="margin-bottom:20px">
                            <label for="recept-name" class="col-md-3 control-label">Pavadinimas*</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="recept-name" placeholder="Pavadinimas" value="${unitForm.name}" name="name" />
								 <form:errors path="name" cssClass="error"/>
                            </div>
                           
                        </div>
                        <div class="form-group" style="margin-bottom:80px">
                            <label for="recept-name" class="col-md-3 control-label">Sutrumpinimas*</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="recept-name" placeholder="Sutrumpinimas"  value="${unitForm.abbreviation}" name="abbreviation"/>
								<form:errors path="abbreviation" cssClass="error"/>
                            </div>
                            
                        </div>
                        <div class="save-button-wrapper">
                            <button class="button">Pridėti</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
	</div>
	
    <jsp:include page="footer.jsp" />
	
</body>
</html>