<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Šaldytuvas</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="http://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
</head>
<body>
    <div class="page-wrap">
       
       <jsp:include page="navbar.jsp" />
		
	<form:form method="POST">
		<div class="recipe-form">
            <div class="container">
                <div class='row'>
                    <div class='col-md-3'>
						<input method="GET" value="Ieškoti pagal turimus" type="submit" formaction="../fridge/available" class="btn btn-default col-xs-12"/>
						<input type="submit" class="btn btn-default col-xs-12" formaction="../add_product_fridge" style="margin-top:30px" value="Pridėti produktą"></input>
						<input value = "Trinti" type="submit" formaction="../fridge/list/delete" class="btn btn-default col-xs-12" style="margin-top:30px; display:none;"></input>
						<button type="button" class="btn btn-default col-xs-12" style="margin-top:30px; display:none;">Išsaugoti</button>
                    </div>
								
					<div class="col-md-9 fridge-table">
						<div class="table-responsive">
							<table id="mytable" class="table table-hover">
								<thead>
									<th>Produktas</th>
									<th>Kiekis</th>
									<th><th>
								</thead>
								<tbody>
			
									
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.product.name}</td>
										<td>
											<!--<input type="text" class="fridge-text-field" value="${item.amount}" />-->
											<span class="fridge-row">${item.amount} ${item.unit.abbreviation}</span>
										</td>
										<td><a href="${item.frId}/delete"><input type="button" value="Ištrinti" class="btn"/></a></td>
									</tr>
								</c:forEach>	
									
								</tbody>
							</table>
						</div>          
					</div>
                </div>
            </div>
        </div>
		</form:form>	
    </div>

	
	
    <jsp:include page="footer.jsp" />

    <script>
        $(document).ready(function () {
			$("#mytable #checkall").click(function () {
				if ($("#mytable #checkall").is(':checked')) {
					$("#mytable input[type=checkbox]").each(function () {
						$(this).prop("checked", true);
					});

				} else {
					$("#mytable input[type=checkbox]").each(function () {
						$(this).prop("checked", false);
					});
				}
			});
        });
    </script>
</body>
</html>