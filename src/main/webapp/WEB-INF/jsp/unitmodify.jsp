<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Matavimo vienetai</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
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
                        <li><a href="add-recept">Ikelti recepta</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="../search/all">Visi Receptai</a></li>
                                <li><a href="../search/user">Mano receptia</a></li>
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
        <div class="modal-dialog modal-vertical-centered">
                <div class="">
                    <div class="modal-body">
                        <div class="row">
                            <form:form method="POST" class="form-horizontal" role="form" modelAttribute="unitForm">
                                <div class="form-horizontal add-recepts-header">
                                    <h1>Matavimo vieneto modifikavimas</h1>
                                </div>
                                <div class="form-group col-md-12 ">
                                    <label for="recept-name" class="col-md-3 control-label">Pavadinimas</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="recept-name" name="name" value="${unitForm.name}"/>
                                        <form:errors path="name" cssClass="error" />
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="recept-name" class="col-md-3 control-label">Sutrumpinimas</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="Text1" name="abbreviation" value="${unitForm.abbreviation}" />
                                        <form:errors path="abbreviation" cssClass="error" />
                                    </div>
                                </div>
                                <div class=" col-md-12 modal-modification-unit-buttons">
                                    <div class="unit-modification-button-wrapper ">
                                        <button formaction="unit/modify/${unitForm.unitId}" class="button">Išsaugoti</button>
                                    </div>
                                    <div class="unit-modification-button-wrapper ">
                                        <button class="button">Pašalinti</button>
                                    </div>
                                </div>
                            </form:form>
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

    <script>
        $(document).ready(function () {
            $('#example').dataTable();
        });
    </script>
</body>
</html>
