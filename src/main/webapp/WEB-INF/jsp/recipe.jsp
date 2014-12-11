<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Add recipe</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
    <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css' />
</head>
<body>

    <div id="page-content-wrapper">

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
                    <a class="navbar-brand" href="#">
					    <!-- System brand -->
                        <p class="brand">
                            <img class="brand"src="<c:url value="/resources/svg/brand.svg"/>" />KuPRA</p>
                    </a>
                </div>
                <div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="#">Ikelti recepta</a></li>
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
                        <li><a href="#">Vartotojo profilis</a></li>
                        <li><a href="#">Atsijungti</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </div>

        <div class="user-recipe-content-wrapper container">
            <div class="row ">
                <div class="col-md-2 container">
                    <div class="menu-row  ">
                        <input type="submit" value="Įtraukti į valgiaraštį" class=" btn-block button" />
                        <input type="submit" value="Patikrinti ingredientus" class=" btn-block button" />
                    </div>

                </div>
                <div class=" content col-md-10 container">
				    <!-- Recipe name -->
                    <p class="recipe-top-name">Firminis gatve patiekalas</p>
					<!-- Creator -->
                    <a href="#" class="recipe-user-nick">Ponas Ponaitis</a>
					<!-- Recipe Images -->
                    <div class="images">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="1.jpg" class="img-responsive img-size" /></div>
                            <div class="col-md-4">
                                <img src="1.jpg" class="img-responsive img-size" /></div>
                            <div class="col-md-4">
                                <img src="1.jpg" class="img-responsive img-size" /></div>
                        </div>

                    </div>
					<!-- Recipe cooking time/rating/people rating -->
                    <div class="rating-time">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <img src="svg/clock.svg" class="img-responsive user-recipe-img display-inline" />
                                <span class="display-inline">Pagaminamas per:</span>
                                <span class="cooking-time display-inline">60min</span>
                            </div>

                            <div class="col-md-4 col-sm-4  col-xm-4 ">
                                <img src="star.svg" class="img-responsive user-recipe-img  display-inline" />
                                <span class="display-inline">Įvertinimas</span>
                                <span class="display-inline">10 </span>
                            </div>
                            <div class="col-md-4 col-sm-4  col-xm-4 ">
                                <img src="people.svg" class="img-responsive user-recipe-img display-inline" />
                                <span class="display-inline">100</span>
                            </div>
                        </div>
                    </div>
					<!-- Recipe description -->
                    <div class="recipe-user-info">
                        <div class="row recipe-user-row wrap">
                            <div class="col-md-6">
                                <p>Ingridientai:</p>
                                <ul class="recipe-user-ingridients">
                                    <li>2vnt. Kiaušiniai</li>
                                    <li>2kg Burokai</li>
                                    <li>100g Miltai </li>
                                    <li>200g Cukrus </li>
                                    <li>100ml Aliejus</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <p>Aprašymas:</p>
                                <p class="recipe-description">
                                    Įkaitinkite orkaitę iki 160 laipsnių. Sumaišykite sausainių trupinius su sviestu, sudėkite į kepimo formą, išlyginkite, kepkite 10 – 15 minučių.
                                                Varškę pertrinkite per sietelį, sumaišykite su rikota ir maskarpone, įdėkite cukraus ir medaus, maišydami įmuškite po vieną kiaušinį, galiausiai sudėkite citrinos žievelę ir sultis.
                                                Užliekite masę ant pagrindo, pakratykite formą, kad neliktų oro. Kepkite pastatę formą ant indo su vandeniu 60 – 75 minutes 150 – 160 laipsnių temperatūroje.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="container">
                <div class="footCss">
                    PS5 team
                </div>
            </div>
        </div>
    </div>

</body>
</html>
