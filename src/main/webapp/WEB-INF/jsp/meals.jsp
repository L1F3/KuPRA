<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Valgiaraštis</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
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
                        <!--System brand -->
                        <p class="brand">
                            <img class="brand" src="<c:url value=" />resources/svg/brand.svg"/>" />KuPRA
                        </p>
                    </a>
                </div>
                <div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav custom-navbar">
                        <li><a href="recipeadd">Ikelti recepta</a></li>
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
                                <li><a href="create-product">Produktai</a></li>
                                <li><a href="create-unit">Matavimo vienetai</a></li>
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
            </div>
        </div>
        <div class="menu-wrap">
            <div class="row">
                <div class="container">
                    <div class='row'>
						<c:forEach var="meal" items="${meals}">
                        <!-- recipe's block -->
                        <div class="col-md-3">
                            <div class="panel panel-default  panel-custom panel-custom-meals">
                                <!-- Recipe's picture-->
                                <img src="recipe/image/${meal.recId}/thumb2" class="img-responsive image-size" />
                                <!-- Recipe's information -->
                                <div class="container" style="width: 100%;">
                                    <!-- Recipe's author -->
                                    <div class="row made-recipe-user-name">
                                        <div class="col-xs-12" style="text-wrap:normal;">
                                            <a href="#">${meal.user.username}</a>
                                        </div>
                                    </div>
                                    <!-- Recipe's name -->
                                    <div class="row recipe-name-box">
                                        <div class="col-xs-12" style="text-wrap:normal;">
                                            <p class="recipe-name">${meal.name}</p>
                                        </div>
                                    </div>
                                    <!-- Recipe's rating -->
                                    <div class="row">
                                        <div class="col-xs-6" style="text-align: center;">
                                            <img src="star.svg" style="height: 30px; width: 30px; margin-left: auto; margin-right: auto;" />
                                            <!-- Rating -->
                                            <p class="recipe-rating">${meal.rating}</p>
                                        </div>
                                        <div class="col-xs-6" style="text-align: center;">
                                            <img src="people.svg" style="height: 30px; width: 30px; margin-left: auto; margin-right: auto;" />
                                            <!-- Total votes -->
                                            <p class="rating-people">${meal.ratingCount}</p>
                                        </div>
                                    </div>
                                    <!-- Rate recipe block -->
                                    <div class="row">
                                        <div class="col-xs-6 dropdown-menu-style" style="padding-right: 0px;">
                                            <select style="margin-top: 10px; margin-left: 30px;">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                            </select>
                                        </div>
                                        <div class="col-xs-6" style="padding-left: 0px;">
                                            <button type="button" class="btn btn-lg btn-warn">Vertinti</button>
                                        </div>
                                    </div>
                                    <!-- Make the meal button -->
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <button id="create_meal" class="btn btn-lg btn-warn" style="margin-top: 5px; margin-bottom: 5px;" data-container="body" onclick="showPopup3459kablelis3taskas14(this)">Gaminti</button>
                                        </div>
                                    </div>
                                    <!-- Date of making -->
                                    <div class="row">
                                        <p class="col-xs-6" style="font-size: 10pt; padding-left: 5px;">Gaminimo data</p>
                                        <p class="col-xs-6" style="font-size: 10pt; padding-right: 5px;">2014-12-13 16:37</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end of block -->
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="popup3459kablelis3taskas14" class="container" style="display: none; padding: 5px;">
        <div class="row">
            <p class="col-xs-6">Porcijų kiekis</p>
            <div class="col-xs-6">
                <form>
                    <input type="text" name="servings" size="4" />
                </form>
            </div>
        </div>
        <div class="row">
            <p class="col-xs-6" id="alert" style="color:red">Truksta produktų</p>
            <a class="col-xs-6 accept-serving" href="" type="button">Šaldytuvas</a>
        </div>
        <div class="row">
            <p class="col-xs-12">Kiauliena 10g</p>
            <p class="col-xs-12">Kiauliena 20g</p>
        </div>
    </div>

    <footer class="footer">
      <div class="container">
        <p>KuPRA</p>
      </div>
    </footer>

    <script>

        function showPopup3459kablelis3taskas14(parent) {
            $(parent).popover({
                html: true,
                content: function () {
                    return $("#popup3459kablelis3taskas14").html();
                }
            })
        }

        function setPopup3459kablelis3taskas14AlertColor(condition) {
            if (condition == true) {
                $("#alert").style.fontcolor = "green"
            } else {
                $("#alert").style.fontcolor = "red"
            }
        }

    </script>
</body>
</html>
