
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
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
        <a class="navbar-brand" href="http://localhost:8080/KuPRA/app/home">
         <!-- System brand -->
         <p class="brand">
          <img class="brand" src="<c:url value="/resources/svg/brand.svg"/>" />KuPRA
        </p>
      </a>
    </div>
    <div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav custom-navbar">
        <li><a href="http://localhost:8080/KuPRA/app/recipe">Ikelti receptą</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="http://localhost:8080/KuPRA/app/search/all">Visi receptai</a></li>
            <li><a href="http://localhost:8080/KuPRA/app/search/user">Mano receptai</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="http://localhost:8080/KuPRA/app/product/all">Produktai</a></li>
            <li><a href="http://localhost:8080/KuPRA/app/unit/all">Matavimo vienetai</a></li>
          </ul>
        </li>
        <li><a href="http://localhost:8080/KuPRA/app/fridge/list">Šaldytuvas</a></li>
        <li><a href="http://localhost:8080/KuPRA/app/meals">Valgiaraštis</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right custom-navbar">
        <li><a href="http://localhost:8080/KuPRA/app/profile">Vartotojo profilis</a></li>
        <li><a href="../j_spring_security_logout">Atsijungti</a></li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</div>
<script type="text/javascript">
  $(document).ready(function () {
    $('.nav a').each(function () {
      if (window.location.href == $(this).attr('href')) {
        $(this).addClass('active');
        $($(this).parents('.dropdown')).children().addClass('active');
      };
    });
  });
</script>
</body>
</html>
