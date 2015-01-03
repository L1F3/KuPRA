<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Produkto pridėjimas į šaldytuvą</title>
   <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

    <script src="<c:url value="/resources/js/jquery.autocomplete.min.js" />"></script>
    <link href="<c:url value="/resources/css/autocomplete.css" />" rel="stylesheet" type="text/css"/>
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
                        <li><a href="add-recept">Ikelti recepta</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Visi Receptai</a></li>
                                <li><a href="#">Mano receptia</a></li>
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
                    <ul class="nav navbar-nav navbar-right custom-navbar">
                        <li><a href="profile">Vartotojo profilis</a></li>
                        <li><a href="#">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>
		<div class="add-recept-form container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <form:form class="form-horizontal" role="form" method="POST" modelAttribute="unitForm">
                        <div class="form-horizontal add-recepts-header">
                            <h1>Pridėti produktą</h1>
                        </div>
                        <div class="form-group">
                            <label for="recept-name" class="col-md-3 control-label">Pavadinimas*</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="recept-name autocomplete" onfocus="startAutocomplete(this)" placeholder="Pavadinimas" value="${unitForm.name}" name="name" />
                            </div>
                            <form:errors path="name" cssClass="error"/>
                        </div>
						<div class="form-group">
							 <label for="recept-name" class="col-md-3 control-label">Kiekis</label>
								<div class="col-md-9">
									 <input type="text" class="form-control" id="recept-name" />
								</div>
					    </div>
					    <div class="form-group">
							<label for="recept-name" class="col-md-3 control-label">Matavimo vienetas</label>
							    <div class="col-md-9">
									   <select class="form-control" placeholder="Pasirinkite vieną ingredientų">
											<option value="" disabled selected>Prašome pasirinkti ingredientą</option>
										</select> 
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
	<footer class="footer">
      <div class="container">
        <p>KuPRA</p>
      </div>
    </footer>

    <script type="text/javascript">
        function startAutocomplete(eventHolder) {
            $(eventHolder).autocomplete({
                serviceUrl: '../product/list',
                paramName: 'name',
                delimiter: ',',
                transformResult: function(response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function(item) {
                            return { 
                                value: item.name, 
                                data: item.productId 
                            };
                        })
                    };
                },
                onSelect: function(suggestion) {
                    var siblingElement = eventHolder.parentNode.getElementsByTagName('select')[0];
                    $.ajax({
                        type: 'GET',
                        dataType: 'json',
                        url: 'product/' + suggestion.data + '/units/list',
                        success: function(response) {
                            siblingElement.getElementsByTagName('option')[0].remove();
                            $.each(response, function(index) {
                                $(siblingElement).append('<option value="' + response[index].unitId + '">' + response[index].abbreviation + '</option>').html();
                            })
                        },
                        error: function(jqXHR, exception) {
                            if (jqXHR.status === 0) {
                                console.log('Connection was not established.\n Verify Network.');
                            } else if (jqXHR.status == 404) {
                                console.log('Requested page not found. [404]');
                            } else if (jqXHR.status == 500) {
                                console.log('Internal Server Error. [500]');
                            } else if (exception === 'parsererror') {
                                console.log('Requested JSON parse failed.');
                            } else if (exception === 'timeout') {
                                console.log('Time out error.');
                            } else if (exception === 'abort') {
                                console.log('Ajax request aborted.');
                            } else {
                                console.log('Uncaught Error.\n' + jqXHR.responseText);
                            }
                        }
                    });
                }
            });
        };
    </script>

</body>
</html>