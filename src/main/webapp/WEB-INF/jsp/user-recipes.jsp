<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Comapatible" content="IE=edge" /> <!-- Tam nustatytu ie rendinima pagal ju verijas -->
    <title>Mano receptai</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/connect.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/normalize.css" />" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/connect.js" />"></script>
</head>
<body>
   <div class="page-wrap">
        
        <jsp:include page="navbar.jsp" />

        <div class="container">
            <div class="row">
                <div class="col-md-3 ">
                    <div class="search-panel">
                        <!-- Search box -->
                        <div class="create-recipe-button">
                            <a href="#"> <input value="Sukurti naują receptą" class="button" /></a>
                        </div>
                        <form>
                            <div class="form-group">
                                <div class="controls">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <a href="#">
												<img  id="magnifying-glass"  src="<c:url value="/resources/svg/magnifying.svg"/>" class="inputFieldIcon" onmouseover="hover(this);" onmouseout="unhover(this);" />
                                            </a>
                                        </span>
                                        <input type="text" class="form-control" id="inputSearch" placeholder="Ieškoti" />
                                    </div>
                                </div>
                            </div>
                        </form>
                        <br />
                        <p><b>Rikiuoti pagal įvertinimą</b></p>
                        <div id="showingOrder-form-wrapper">
                            <form>
                                <input type="radio" name="showingOrder" value="bestFirst" />
                                Geriausi viršuje<br />
                                <input type="radio" name="showingOrder" value="worstFirst" />
                                Blogiausi viršuje<br />
                                <div class="dropdown-menu-style">
                                    <input type="radio" name="showingOrder" value="dontNeedNoneOfYourShit" />
                                    <select>
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
                                <br />
                                <input type="radio" name="showingOrder" value="justRandomShit" />
                                Nenumatyta<br />
                            </form>
                        </div>
                        <br />
                        <div class="refreshButtonStyle">
                            <button class="button" type="button" onclick="">Atnaujinti</button>
                        </div>
                    </div>

                </div>
                <div class="col-md-9 container ">
					<div class='row'>
						
							<div class='col-md-3  size-of-panel'>
								<div class=" panel panel-default  panel-custom" >
									<!-- Recipe image -->
									<center><img src="recipe/image/${recipe.recId}/thumb2" class="img-responsive image-size"/></center>
									<div class="made-recipe-user-name">
									<!-- Recipe creator -->
										<span>${recipe.user.username}</span>
									</div>
									<!-- Recipe name -->
									<div class="recipe-name-box">
										<a href="../app/recipe/${recipe.recId}"><p class="recipe-name" >${recipe.name}</p></a>
									</div>
									<!-- Recipe description -->
									<!--   <div class="recipe-info-box">
										<span>${recipe.description}</span>
									</div> -->
									<!-- Recipe rating/ people rating -->
									<div class="recipe-rating-box">
										<span>
											<img src="<c:url value="/resources/svg/star.svg"/>" class="img-responsive rating-icon"/>
											<p class="recipe-rating">${recipe.rating}</p>
										</span>
										<span>
											<img src="<c:url value="/resources/svg/people.svg"/>" class="img-responsive rating-icon"/>
											<p class="rating-people">${recipe.ratingCount}</p>
										</span>
									</div>  
                  
								</div>
							</div>
						
					</div> 
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
    
</body>
</html>
