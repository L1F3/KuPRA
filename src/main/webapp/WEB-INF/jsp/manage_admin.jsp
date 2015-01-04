<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" />
    <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Valdyti</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	 <script src="<c:url value="/resources/jquery.dataTables.min.js"/>"></script>
    <script src="http://cdn.datatables.net/plug-ins/9dcbecd42ad/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.0.0/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.0.0/js/bootstrap-toggle.min.js"></script>
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
                     <a class="navbar-brand" href="home">
					    <!-- System brand -->
                        <p class="brand">
                            <img class="brand" src="<c:url value="/resources/svg/brand.svg"/>" />KuPRA
						</p>
                    </a>
                </div>
                <div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav custom-navbar">
                        <li><a href="recipe">Ikelti recepta</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="search/all">Visi Receptai</a></li>
                                <li><a href="search/user">Mano receptia</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="product/all">Produktai</a></li>
                                <li><a href="unit/all">Matavimo vienetai</a></li>
                            </ul>
                        </li>
                        <li><a href="fridge/list">Šaldytuvas</a></li>
                        <li><a href="#">Valgiaraštis</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right custom-navbar">
                        <li><a href="user">Vartotojo profilis</a></li>
                        <li><a href="../j_spring_security_logout">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>



        <div class="user-profile  tabbable ">
            <div class="container">
                <ul class="nav nav-tabs ">
                    <li class="active"><a href="#vartotojaiTab" data-toggle="tab">Vartotojai</a></li>
                    <li><a href="#matavimoVienetaiTab" data-toggle="tab">Matavimo vienetai</a></li>
                    <li><a href="#produktaiTab" data-toggle="tab">Produktai</a></li>
                    <li><a href="#receptaiTab" data-toggle="tab">Receptai</a></li>
                </ul>
                <div class="tab-content custom-tab">


                    <div id="vartotojaiTab" class="tab-pane active">
                        <div class="container" style="padding: 0px; width: 100%;">
                            <table id="vartotojaiTable" class="table-hover table-bordered table ">
                                <thead>
                                    <tr>
                                        <th>Vardas</th>
                                        <th>Administratoriaus rolė</th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Vardas</th>
                                        <th>Administratoriaus rolė</th>
                                    </tr>
                                </tfoot>

                                <tbody>
                                    <tr>
                                        <td>Vardas Pavardenis</td>
                                        <td>
                                            <input id="toggle-event" type="checkbox" data-toggle="toggle" data-onstyle="default" /></td>
                                    </tr>
                                    <tr>
                                        <td>Jonas Jonaitis</td>
                                        <td>
                                            <input id="Checkbox1" type="checkbox" data-toggle="toggle" data-onstyle="default" /></td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>




                    <div id="matavimoVienetaiTab" class="tab-pane">

                        <div class="container" style="padding: 0px; width: 100%;">
                            <table id="matavimoVienetaiTable" class="table-hover table-bordered table ">
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
                                        <td>Kilogramas</td>
                                        <td>kg</td>
                                        <td>
										 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
											<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
											 <button type="submit" class="btn btn-default"  ><span class="glyphicon glyphicon-trash"> Ištrinti</span></button>
											 <button type="submit" class="btn btn-default" ><span class="glyphicon glyphicon-wrench"> Modifikuoti</span> </button>
									    </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="produktaiTab" class="tab-pane ">
                        <div class="container" style="padding: 0px; width: 100%;">
                            <table id="produktaiTable" class="table-hover table-bordered table ">
                                <thead>
                                    <tr>
                                        <th>Pavadinimas</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Pavadinimas</th>
                                        <th></th>
                                    </tr>
                                </tfoot>

                                <tbody>
                                    <tr>
                                        <td>Kriaušė</td>
										<td>
										 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
											<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
											 <button type="submit" class="btn btn-default"  ><span class="glyphicon glyphicon-trash"> Ištrinti</span></button>
											 <button type="submit" class="btn btn-default" ><span class="glyphicon glyphicon-wrench"> Modifikuoti</span> </button>
									    </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
						
			
									
						
                    </div>

                    <div id="receptaiTab" class="tab-pane">
                        <div class="container" style="padding: 0px; width: 100%;">
                            <table id="receptaiTable" class="table-hover table-bordered table ">
                                <thead>
                                    <tr>
                                        <th>Recepto pavadinimas</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Recepto pavadinimas</th>
                                        <th></th>
                                    </tr>
                                </tfoot>

                                <tbody>
                                    <tr>
                                        <td>Kiaušinienė</td>
                                        <td>
										 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
											<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
											 <button type="submit" class="btn btn-default"  ><span class="glyphicon glyphicon-trash"> Ištrinti</span></button>
											 <button type="submit" class="btn btn-default" ><span class="glyphicon glyphicon-wrench"> Modifikuoti</span> </button>
									    </td>
                                    </tr>
                                </tbody>
                            </table>
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
            $('.add-image-box').click(function () {
                var box_html = $('<div class="text-box form-group container"><div class="col-md-4"><input type="file" class="" name="txtImage[]" id="imageinput"/></div><div class=""><button type="submit" class="remove-box btn btn-danger btn-sm"><i class="fa fa-minus-circle fa-lg"></i></button></div></div>');
                $('.text-box:last').after(box_html);
                box_html.fadeIn('slow');
            });

            $('.form-horizontal').on('click', '.remove-box', function () {
                $(this).closest(".form-group").remove();
                return false;
            });

            $(document).on('focus', 'div.form-group-options div.input-group-option:last-child input', function () {
                var sInputGroupHtml = $(this).parent().html();
                var sInputGroupClasses = $(this).parent().attr('class');
                $(this).parent().parent().append('<div class="' + sInputGroupClasses + '">' + sInputGroupHtml + '</div>');
            });

            $(document).on('click', 'div.form-group-options .input-group-addon-remove', function () {
                $(this).parent().remove();
            });


            $('#vartotojaiTable').dataTable();
            $('#matavimoVienetaiTable').dataTable();
            $('#produktaiTable').dataTable();
            $('#receptaiTable').dataTable();

            $('#toggle-event').change(function () {
                //  $('#console-event').html('Toggle: ' + $(this).prop('checked'))
            })

        });
    </script>
</body>
</html>
