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
		
        <div class="container unit-button-wrap">
            <button type="button" class="btn btn-default">Pridėti naują matavimo vienetą</button>
        </div>
        <div class="unit-table-wrap container ">

            <table id="example" class="table-hover table-bordered table ">
                <thead>
                    <tr>
                        <th>Pavadinimas</th>
                        <th>Sutrumpinimas</th>
                        <th></th>
                    </tr>
                </thead>

                <tfoot>
                    <tr>
                        <th>Pavadinimas</th>
                        <th>Sutrumpinimas</th>
                        <th></th>
                    </tr>
                </tfoot>

                <tbody>

                    <tr>
					    <!--Matavimo vieneto vardas -->
                        <td>Kilogramas</td>
						<!--Matavimo vieneto sutrumpinimas -->
                        <td>kg</td>
						<!--Matavimo vieneto administratoriaus modifikavimas -->
                        <td><a class="btn" data-toggle="modal" data-target="#Kilogramas">Modifikuoti</a></td>
                    </tr>

                    <tr>
                        <td>Gramas</td>
                        <td>g</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Tona</td>
                        <td>t</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Metras</td>
                        <td>m</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Centimetras</td>
                        <td>cm</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Milimetras</td>
                        <td>mm</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Litras</td>
                        <td>l</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Mililitras</td>
                        <td>ml</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Vienetai</td>
                        <td>vnt</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Stiklinė</td>
                        <td>Stiklinė</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Pusė stiklinės</td>
                        <td>Pusė stiklinės</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Arbatinis šaukštelis</td>
                        <td>Arbatinis šaukštelis</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
                    <tr>
                        <td>Uncija</td>
                        <td>oz</td>
                        <td><a class="btn" href="#">Modifikuoti</a></td>
                    </tr>
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
