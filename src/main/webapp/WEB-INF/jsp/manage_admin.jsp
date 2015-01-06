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
       
       <jsp:include page="navbar.jsp" />



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
                                        <th>Vardas Pavardė</th>
                                        <th>Administratoriaus rolė</th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Vardas Pavardė</th>
                                        <th>Administratoriaus rolė</th>
                                    </tr>
                                </tfoot>

                                <tbody>
									<c:forEach var="user" items="${users}">
										<tr>
											<td>${user.name} ${user.lastname}</td>
											<td>
												<input id="toggle-event" type="checkbox" data-toggle="toggle" data-onstyle="default" /></td>
										</tr>
									</c:forEach>
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
									<c:forEach var="unit" items="${units}">
										<tr>
											<td>${unit.name}</td>
											<td>${unit.abbreviation}</td>
											<td>
											 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
												<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
												 <button type="submit" class="btn btn-default" onclick="window.location.href='manage/${unit.unitId}/delete'" ><span class="glyphicon glyphicon-trash"> Ištrinti</span></button>
												 <button type="submit" class="btn btn-default" onclick="window.location.href='unitmodify/${unit.unitId}'"><span class="glyphicon glyphicon-wrench"> Modifikuoti</span> </button>
											</td>
										</tr>
									</c:forEach>
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
									<c:forEach var="product" items="${products}">
										<tr>
											<td>${product.name}</td>
											<td>
											 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
												<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
												 <button type="submit" class="btn btn-default"  ><span class="glyphicon glyphicon-trash"> Ištrinti</span></button>
												 <button type="submit" class="btn btn-default" onclick="window.location.href='productmodify/${product.productId}'"><span class="glyphicon glyphicon-wrench"> Modifikuoti</span> </button>
											</td>
										</tr>
									</c:forEach>
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
									<c:forEach var="recipe" items="${recipes}">
										<tr>
											<td>${recipe.name}</td>
											<td>
											 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
												<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
												 <button type="submit" class="btn btn-default"  ><span class="glyphicon glyphicon-trash"> Ištrinti</span></button>
												 <button type="submit" class="btn btn-default" ><span class="glyphicon glyphicon-wrench"> Modifikuoti</span> </button>
											</td>
										</tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />




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
