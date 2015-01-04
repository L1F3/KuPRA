<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
	<title>Registration</title>
	 <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	 <script src="<c:url value="/resources/jquery.dataTables.min.js"/>"></script>
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
					<a class="navbar-brand" href="home">
						<!-- System brand -->
						<p class="brand">
							<img src="<c:url value="/resources/svg/brand.svg"/>" />KuPRA
						</p>
					</a>
				</div>
				<div class="collapse navbar-collapse menu" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="recipe">Ikelti recepta</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Receptai<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="search/all">Visi Receptai</a></li>
								<li><a href="search/user">Mano receptia</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Klasifikatoriai<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="product/all">Produktai</a></li>
								<li><a href="unit/all">Matavimo vienetai</a></li>
							</ul>
						</li>
						<li><a href="fridge/list">Šaldytuvas</a></li>
						<li><a href="meals">Valgiaraštis</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="profile">Vartotojo profilis</a></li>
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
					<li class="active"><a href="#profile" data-toggle="tab">Profilis</a></li>
					<li><a href="#friends" data-toggle="tab">Mano draugai</a></li>
					<li><a href="#users" data-toggle="tab">Naudotoju sarašas</a></li>
				</ul>
				<div class="tab-content custom-tab">
					<div id="profile" class="tab-pane active">
						<div class="container">
							<div class="row">


								<div class="col-md-6">

									<form:form method="POST" class="form-horizontal form-profile" role="form" modelattribute="userForm">

									<div class="form-group">
										<label class="col-md-5 control-label">Email</label>
										<div class="col-md-7">
											<div class="input-group">
												<!-- *** -->                <p class="form-control-static profile-user-name">${userForm.loginname}</p>
											</div>
										</div>
									</div>


									<div class="form-group">
										<label for="inputUserName" class="col-md-5 control-label"> Slapyvardis *</label>
										<div class="col-md-7 controls">
											<div class="input-group">
												<span class="input-group-addon"><img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/></span>
												<!-- *** -->          <input type="text" class="form-control" id="inputUserName" value="${userForm.username}" name="username"/>  
											</div> 
											<form:errors path="username" cssClass="error" /> 				   
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="col-md-5 control-label">Slaptažodis</label>
										<div class="col-md-7 controls">
											<div class="input-group">
												<span class="input-group-addon"> <img src="<c:url value="/resources/svg/key.svg"/>"  class="icons-registration"/></span>
												<!-- *** -->          <input type="password" class="form-control" id="inputPassword" placeholder="Slaptažodis" name="password"/>		
											</div> 
											<form:errors path="password" cssClass="error" /> 
										</div>
									</div>
									<div class="form-group ">
										<label for="inputRePassword" class="col-md-5 control-label">Pakartoti slaptažodi</label>
										<div class="col-md-7 controls">
											<div class="input-group">
												<span class="input-group-addon"> <img src="<c:url value="/resources/svg/key.svg"/>"  class="icons-registration"/></span>
												<!-- *** -->              <input type="password" class="form-control" id="inputRePassword" placeholder="Pakartoti slaptažodi" name="passrepeat"/>
											</div> 
											<form:errors path="passrepeat" cssClass="error" /> 
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail" class="col-md-5 control-label">Elektroninio pašto adresas *</label>
										<div class="col-md-7 controls">
											<div class="input-group">
												<span class="input-group-addon"> <img src="<c:url value="/resources/svg/email.svg"/>" class="icons-registration"/></span>
												<!-- *** -->             <input type="email" class="form-control" id="inputEmail" value="${userForm.email}" name="email"/> 
											</div> 
											<form:errors path="email" cssClass="error" />       
										</div>
									</div>
									<div class="extended-info">
										<div class="form-group">
											<label for="inputName" class="col-md-5 control-label">Vardas</label>
											<div class="col-md-7 controls">
												<div class="input-group">
													<span class="input-group-addon"> <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/></span>
													<!-- *** -->         	<input type="text" class="form-control" id="inputName" value="${userForm.name}" name="name"/>  
												</div> 
												<form:errors path="name" cssClass="error" />  
											</div>
										</div>
										<div class="form-group">
											<label for="inputLastName" class="col-md-5 control-label">Pavarde</label>
											<div class="col-md-7 controls">
												<div class="input-group">
													<span class="input-group-addon">  <img src="<c:url value="/resources/svg/user.svg"/>"  class="icons-registration"/></span>
													<!-- *** -->             <input type="text" class="form-control" id="inputLastName" value="${userForm.lastname}" name="lastname"/>
												</div> 
												<form:errors path="lastname" cssClass="error" /> 	 
											</div>
										</div>
										<div class="form-group ">
											<label for="inputAddress" class="col-md-5 control-label">Adresas</label>
											<div class="col-md-7 controls">
												<div class="input-group">
													<span class="input-group-addon"><img src="<c:url value="/resources/svg/buildings.svg"/>"  class="icons-registration"/> </span>
													<!-- *** -->          <input type="text" class="form-control" id="inputAddress" value="${userForm.address}" name="address"/> 
												</div>
												<form:errors path="address" cssClass="error" />
											</div>
										</div>
										<div class="form-group ">
											<label for="despription" class="col-md-5 control-label no-padding-right">Aprašymas</label>
											<div class="col-md-7 controls">

												<!-- *** -->     <textarea  class="form-control description" id="despription" name="despription" value="${userForm.description}"></textarea>       
											</div>
										</div>

										<div class="col-md-6 col-md-offset-5 info-registration"><p>*pažymeti laukai privalomi</p></div> 
									</div>
								</form:form>
							</div>
							<div class="col-md-6" style="margin-bottom: 15px;">
								<!--<div class="profile-image-block">-->
								<div style="width: 50%; margin: 0px auto;">
									<img src="src="<c:url value="/resources/pie.jpg"/>"" class="profile-image-size" />
									<input type="file" id="exampleInputFile" />
								</div>
							</div>
						</div>
						<div class="save-button-wrapper">
							<button class="button">Išsaugoti</button>
						</div>
					</div>

				</div>
				<div id="friends" class="tab-pane ">
					 <div class="container" style="padding: 0px; width: 100%;">
                            <table id="friendstable" class="table-hover table-bordered table ">
                                <thead>
                                    <tr>
                                        <th>Slapyvardis</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Slapyvardis</th>
                                        <th></th>
                                    </tr>
                                </tfoot>

                                <tbody>
                                    <tr>
                                        <td>  
											<a href="#" style="text-decoration: none" > <img src="<c:url value="/resources/1.jpg"/>" class="img-circle friend-profile-image" />ABCD</a>
										</td>
										<td>
										 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
											<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
											 <button type="submit" class="btn btn-default"  ><span> Nebedraugauti</span></button>
									    </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
				</div>
				<div id="users" class="tab-pane">
					 <div class="container" style="padding: 0px; width: 100%;">
                            <table id="userstable" class="table-hover table-bordered table ">
                                <thead>
                                    <tr>
                                        <th>Slapyvardis</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Slapyvardis</th>
                                        <th></th>
                                    </tr>
                                </tfoot>

                                <tbody>
                                    <tr>
                                        <td><a href="#" style="text-decoration: none">ABCD</a></td>
										<td>
										 <!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-trash" >Ištrinti </span></a>-->
											<!-- <a class="btn btn-default"  href="#"><span class="glyphicon glyphicon-wrench" >Modifikuoti </span></a>-->
											 <button type="submit" class="btn btn-default"  ><span> Draugauti</span></button>
									    </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
				</div>
				<!-- /.tab-content -->
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
            $('#friendstable').dataTable();
			$('#userstable').dataTable();
        });
    </script>
			
</body>
</html>
