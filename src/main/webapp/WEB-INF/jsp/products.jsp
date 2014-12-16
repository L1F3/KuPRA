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
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="profile">Vartotojo profilis</a></li>
                        <li><a href="#">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>
		
        <div class="container product-button-wrap">
            <button type="button" class="btn btn-default">Pridėti naują produktą</button>
        </div>
        <div class="products-wrap ">
            <div class=" container">
                <div class="row">
                    <div class="col-md-3 col-xs-12 col-sm-4">
                        <!--Data-target Gauti iš duombazes id ar pavadinima -->
                        <div data-toggle="modal" data-target="#agurkas">
                            <div class="panel panel-default product-panel-custom">
                                <!--Paveiksliukas -->
								
                                <img src="<c:url value="/resources/products/agurkas.jpg"/>" class="img-responsive image-size" />
                                <!--Pavadinimas -->
                                <div class="product_name">
                                    <p>Agurkas</p>
                                </div>
                            </div>
                        </div>

                        <!-- Modal  id putini tą pavadinima kuri data-target įdedi tada viskas veiks-->
                        <div class="modal fade" id="agurkas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-vertical-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <!--Pavadinimas -->
                                        <h4 class="modal-title">Agurkas</h4>
                                        <h5 class="modal-title product-modal-id">id :123456</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="modal-image-size col-xs-10 col-md-10">
                                                <img src="<c:url value="/resources/products/agurkas.jpg"/>" class="img-responsive" />
                                            </div>
                                            <div class="product-units col-xs-2 col-md-2">
                                                  <div class="row">
                                                        <span class="col-sm-12" >Matavimo_vienetai</span>
                                                        <span class="col-sm-12">kg</span>
                                                        <span class="col-sm-12">mg</span>
                                                  </div>
                                            </div>
                                        </div>
                                        <div class="product-modal-description">
                                            <h3>Aprašymas</h3>
                                            <span>Agurkas (lot. Cucumis) – moliūginių (Cucurbitaceae) šeimos augalų gentis.
                                              Šaknis liemeninė, stiebas šliaužiantis. Žiedai vienalyčiai, geltoni. Vaisiai žali, vidutinio dydžio.
                                              Augalus apdulkina vabzdžiai, dirbtiniu būdu – žmogus. Nedaugelis veislių augina sėklų neturinčius vaisius be apdulkinimo. 
                                              Jos gerai tinka šiltnamiams. Dauguma veislių vaisius mezga tik apdulkinus žiedus. Derliui padidinti į agurkų laukus vežami bičių aviliai.
                                              Žiedus kartais apdulkina musės. Nepakankamo apdulkinimo požymiai yra nukrentantys ar deformuoti vaisiai.
                                              Tik dalinai apdulkintų žiedų vietoje išaugę vaisiai būna nuo stiebo nutolusioje dalyje pabalę.
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-md-3  col-xs-12 col-sm-4">
                        <div data-toggle="modal" data-target="#braske">
                            <div class="panel panel-default product-panel-custom">
                                <img src="products/braske.jpg" class="img-responsive image-size" />
                                <div class="product_name">
                                    <p>Braškė</p>
                                </div>
                            </div>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="braske" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-vertical-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Braškė</h4>
                                    </div>
                                    <div class="modal-body">
                                        ...
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-3  col-xs-12 col-sm-4">
                        <div class="panel panel-default product-panel-custom">
                            <img src="products/sviestas.jpg" class="img-responsive image-size" />
                            <div class="product_name">
                                <p>Sviestas</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3  col-xs-12 col-sm-4">
                        <div class="panel panel-default product-panel-custom">
                            <img src="products/bulves.jpg" class="img-responsive image-size" />
                            <div class="product_name">
                                <p>Bulvė</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3  col-xs-12 col-sm-4">
                        <div class="panel panel-default product-panel-custom">
                            <img src="products/pomidoras.jpg" class="img-responsive image-size" />
                            <div class="product_name">
                                <p>Pomidoras</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3  col-xs-12 col-sm-4">
                        <div class="panel panel-default product-panel-custom">
                            <img src="products/morka.jpg" class="img-responsive image-size" />
                            <div class="product_name">
                                <p>Morka</p>
                            </div>
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
        
    </script>
</body>
</html>
