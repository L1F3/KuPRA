<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
	<title>Vartotojo profilis</title>
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
		
		<jsp:include page="navbar.jsp" />

		<div class="user-profile  tabbable ">
			<div class="container">
				<ul class="nav nav-tabs ">
					<li class="active"><a href="#profile" data-toggle="tab">Profilis</a></li>
					<!--<li><a href="#friends" data-toggle="tab">Mano draugai</a></li>-->
					<li><a href="#users" data-toggle="tab">Naudotojų sąrašas</a></li>
				</ul>
				<div class="tab-content custom-tab">
					<div id="profile" class="tab-pane active">
						<div class="container">
						<form:form method="POST" class="form-horizontal form-profile" role="form" modelAttribute="userForm" enctype="multipart/form-data">
							<div class="row">


								<div class="col-md-6">

									

									<div class="form-group">
										<label class="col-md-5 control-label">Email</label>
										<div class="col-md-7">
											<div class="input-group col-md-12">
												<input type="text" class="form-control" name="loginname" value="${userForm.loginname}" readonly="readonly"/>
												<!-- *** -->              <!--  <p class="form-control-static profile-user-name">${userForm.loginname}</p>-->
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
												<!-- *** -->          <input type="password" class="form-control" id="inputPassword" placeholder="Slaptažodis" name="password" value="${userForm.password}"/>		
											</div> 
											<form:errors path="password" cssClass="error" /> 
										</div>
									</div>
									<div class="form-group ">
										<label for="inputRePassword" class="col-md-5 control-label">Pakartoti slaptažodį</label>
										<div class="col-md-7 controls">
											<div class="input-group">
												<span class="input-group-addon"> <img src="<c:url value="/resources/svg/key.svg"/>"  class="icons-registration"/></span>
												<!-- *** -->              <input type="password" class="form-control" id="inputRePassword" placeholder="Pakartoti slaptažodį" name="passrepeat" value="${userForm.passrepeat}"/>
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
											<label for="inputLastName" class="col-md-5 control-label">Pavardė</label>
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

												<!-- *** -->     <textarea  class="form-control description" id="despription" name="description">${userForm.description}</textarea>       
											</div>
										</div>

										<div class="col-md-6 col-md-offset-5 info-registration"><p>*pažymėti laukai privalomi</p></div> 
									</div>
								
							</div>
							<div class="col-md-6" style="margin-bottom: 15px;">
								<!--<div class="profile-image-block">-->
								<div style="width: 50%; margin: 0px auto;">
									<img src="profile/image" class="profile-image-size img-circle"  style="margin-bottom:10px;"/>

									<input type="file" name="file" id="exampleInputFile" />
								</div>
							</div>
						</div>
						<div class="save-button-wrapper">
							<button class="button">Išsaugoti</button>
						</div>
					</div>
				</form:form>
				</div>

				<div id="users" class="tab-pane">
      <div class="container" style="padding: 0px; width: 100%;">
                            <table id="userstable" class="table-hover table-bordered table ">
                                <thead>
                                    <tr>
                                        <th>Slapyvardis</th>
                                       
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>Slapyvardis</th>
                                       
                                    </tr>
                                </tfoot>

                                <tbody>
                                	<c:forEach var="user" items="${users}">
                                    <tr>  
                                        <td>  
           <a href="profile/${user.userId}" style="text-decoration: none" style="margin-right:40px; margin-left:40px;" ><!-- <img src="" style="height:80px; width:80px;" class="img-circle" />-->${user.username}</a>
          </td>
          
           
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
    </div>
				<!-- /.tab-content -->
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />

	 <script>
        $(document).ready(function () {
            $('#friendstable').dataTable();
			$('#userstable').dataTable();
        });
    </script>
			
</body>
</html>
