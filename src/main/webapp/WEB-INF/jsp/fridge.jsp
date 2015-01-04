﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <li><a href="../search/all">Visi Receptai</a></li>
                                <li><a href="../search/user">Mano receptia</a></li>
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
                        <li><a href="../../j_spring_security/logout">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>
		
	<form:form method="POST">
		<div class="recipe-form">
            <div class="container">
                <div class='row'>
                    <div class='col-md-3'>
						<input method="GET" value="Ieskoti pagal turimus" type="submit" formaction="../fridge/available" class="btn btn-default col-xs-12"/>
						<a href="../add_product_fridge"><input type="button" class="btn btn-default col-xs-12"  style="margin-top:30px" value="Pridėti produktą"></input></a>
						<input value = "Trinti" type="submit" formaction="../fridge/list/delete" class="btn btn-default col-xs-12" style="margin-top:30px"></input>
						<button type="button" class="btn btn-default col-xs-12" style="margin-top:30px">Išsaugoti</button>
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
											<input type="text" class="fridge-text-field" value="${item.amount}" />
											<span class="fridge-row">${item.unit.abbreviation}</span>
										</td>
										<td><a href=""><input type="button" value="Ištrinti" class="btn"/></a></td>
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

	
	
    <footer class="footer">
        <div class="container">
            <p>KuPRA</p>
        </div>
    </footer>

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