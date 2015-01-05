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
   <script src="<c:url value="/resources/jquery.dataTables.min.js"/>"></script>
    <script src="http://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
</head>
<body>
<div class="page-wrap">
        
        <jsp:include page="navbar.jsp" />
		
        <div class="container unit-button-wrap">
            <a href="../unit"><input type="button" class="btn btn-default" value="Pridėti naują matavimo vienetą"></input></a>
        </div>
        <div class="unit-table-wrap container ">

            <table id="example" class="table-hover table-bordered table ">
                <thead>
                    <tr>
                        <th>Pavadinimas</th>
                        <th>Sutrumpinimas</th>
                        
                    </tr>
                </thead>

                <tfoot>
                    <tr>
                        <th>Pavadinimas</th>
                        <th>Sutrumpinimas</th>
                       
                    </tr>
                </tfoot>

                <tbody>
					
					<c:forEach var="unit" items="${units}">
                    <tr>
					    <!--Matavimo vieneto vardas -->
                        <td>${unit.name}</td>
						<!--Matavimo vieneto sutrumpinimas -->
                        <td>${unit.abbreviation}</td>

                    </tr>
					</c:forEach>
                    
                </tbody>
            </table>
        </div>
        
		<!--modelio atspausdinimas -->
        <div class="modal fade" id="Kilogramas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-vertical-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <!--Pavadinimas -->
                        <h4 class="">Kilogramas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <form class="form-horizontal" role="form">
                                <div class="form-horizontal add-recepts-header">
                                    <h1>Matavimo vieneto modifikavimas</h1>
                                </div>
                                <div class="form-group col-md-12 ">
                                    <label for="recept-name" class="col-md-3 control-label">Pavadinimas</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="recept-name" placeholder="Pavadinimas" />
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="recept-name" class="col-md-3 control-label">Sutrumpinimas</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="Text1" placeholder="Sutrumpinimas" />
                                    </div>
                                </div>
                                <div class=" col-md-12 modal-modification-unit-buttons">
                                    <div class="unit-modification-button-wrapper ">
                                        <button class="button">Išsaugoti</button>
                                    </div>
                                    <div class="unit-modification-button-wrapper ">
                                        <button class="button">Pašalinti</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script>
        $(document).ready(function () {
            $('#example').dataTable();
        });
    </script>
</body>
</html>
