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
   
  <jsp:include page="navbar.jsp" />

        <div class="add-recept-form container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <form:form class="form-horizontal" role="form" method="POST" modelAttribute="fridgeItemForm">
                        <div class="form-horizontal add-recepts-header">
                            <h1>Pridėti produktą</h1>
                        </div>
                        <div class="form-group">
                            <label for="recept-name" class="col-md-3 control-label">Pavadinimas*</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="autocomplete" autocomplete='off' onfocus="startAutocomplete(this)" placeholder="Pavadinimas"  />
                                <input type="hidden" value="${fridgeItemForm.productId}" name="productId" />
                            </div>
                            <form:errors path="productId" cssClass="error"/>
                        </div>
                        <div class="form-group">
                             <label for="recept-name" class="col-md-3 control-label">Kiekis</label>
                                <div class="col-md-9">
                                     <input type="text" class="form-control" placeholder="kiekis" value="${fridgeItemForm.amount}" name="amount" />
                                </div>
                                <form:errors path="amount" cssClass="error"/>
                        </div>
                        <div class="form-group">
                            <label for="recept-name" class="col-md-3 control-label">Matavimo vienetas</label>
                                <div class="col-md-9">
                                        <input id="productUnit" class="form-control" readonly="readonly" />
                                        <input id="unitIdHolder" type="hidden" value="${fridgeItemForm.unitId}" name="unitId" />
                                </div>
                                <form:errors path="unitId" cssClass="error"/>
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

    <script type="text/javascript">

        function setOnClick (eventHolder) {
            $('#unitIdHolder').val($(eventHolder).attr('value'));
        };

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
                    $(eventHolder.parentNode.getElementsByTagName('input')[1]).val(parseInt(suggestion.data));
                    $.ajax({
                        type: 'GET',
                        dataType: 'json',
                        url: '../product/' + suggestion.data + '/unit',
                        success: function(response) {
                            $('#productUnit').val(response.abbreviation);
                            $('#unitIdHolder').val(response.unitId);
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