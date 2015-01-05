<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Produktai</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
      <div class="page-wrap">
        
        <jsp:include page="navbar.jsp" />
		
        <div class="container product-button-wrap">
			<a href="../product"><input type="button" class="btn btn-default" value="Pridėti naują produktą"></input></a>
        </div>
        <div class="products-wrap ">
            <div class=" container">
                <div class="row">
					<c:forEach var="product" items="${products}">
                    <div class="col-md-3 col-xs-12 col-sm-4">
                        <!--Data-target Gauti iš duombazes id ar pavadinima -->
                        <div data-toggle="modal" data-target="#${product.productId}">
                            <div class="panel panel-default product-panel-custom">
                                <!--Paveiksliukas -->
								
                                <img src="../product/image/${product.productId}/thumb2" class="img-responsive image-size" />
                                <!--Pavadinimas -->
                                <div class="product_name">
                                    <p>${product.name}</p>
                                </div>
                            </div>
                        </div>
                        <!-- Modal  id putini tą pavadinima kuri data-target įdedi tada viskas veiks-->
                        <div class="modal fade" id="${product.productId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-vertical-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <!--Pavadinimas -->
                                        <h4 class="modal-title">${product.name}</h4>
                                        <h5 class="modal-title product-modal-id">ID: ${product.productId}</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="modal-image-size col-xs-6 col-md-6">
                                                <img src="../product/image/${product.productId}/thumb2" class="img-responsive" />
                                            </div>
                                            <div class="col-md-6">
                                                  <div class="row">
                                                         <span class="col-md-12" style="font-size:20px;" >Matavimo vienetai:</span>
													<c:forEach var="unit" items="${product.unitsSet}">
                                                        <span class="col-sm-12">${unit.abbreviation}</span>
													</c:forEach>
                                                  </div>
                                            </div>
                                        </div>
                                        <div class="product-modal-description">
                                            <h3>Aprašymas</h3>
                                            <span>${product.description}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />

    <script>
        
    </script>
</body>
</html>
