<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link href="bootstrap/css/style.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Raleway:400,200'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/jquery-2.1.4.js"></script>
<script src="content/js/jquery.min.js"></script>
<script src="content/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script>
	$(window).on('resize', function() {
		$('container').toggleClass('row', $(window).width() > 768);
	});
</script>
<script>
	$('.dropdown.keep-open').on({
		"shown.bs.dropdown" : function() {
			this.closable = true;
		},
		"click" : function(e) {
			var target = $(e.target);
			if (target.hasClass("btn-primary"))
				this.closable = true;
			else
				this.closable = false;
		},
		"hide.bs.dropdown" : function() {
			return this.closable;
		}
	});
</script>

<script>
	$('#myDropdown').on('hide.bs.dropdown', function() {
		return false;
	});
</script>

<title>OGCommerce</title>

</head>
<body>
	<f:view>
		<section class="section-form" id="section1">
			<div class="first" style="background-color: rgb(54, 75, 113); background-repeat: no-repeat;">
				<div class="container">

					<!-- navbar start -->
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse" data-target="#bs-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="index.jsp">OGC</a>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<!-- <li class="navbar-item-opaque"><a href="products.jsp"
										class="navbar-item-link">Products</a></li> -->
									<li class="navbar-item-opaque"><h:form>
											<h:commandLink action="#{userController.showProducts}"
												styleClass="navbar-item-link" value="Products"
												style="text-decoration:none; line-height:25px; padding-top:0px; padding-bottom:0px; position:relative; display:block; padding:1px 15px; margin:10px;">
											</h:commandLink>
										</h:form></li>

									<li class="navbar-item-opaque"><a class="navbar-item-link"
										style="text-decoration: none"
										href='<c:url value="/faces/support.jsp" />'>Support</a></li>
									<li class="navbar-item-opaque"><a class="navbar-item-link"
										style="text-decoration: none"
										href='<c:url value="/faces/contactPage.jsp" />'>Contact</a></li>
									<li class="navbar-item-login" id="menuLogin">
										<div class="dropdown keep-open">
											<a class="navbar-button-login" href="#"
												data-toggle="dropdown" id="navLogin"> <c:choose>
													<c:when test="${userController.user!=null}">
														<span class="glyphicon glyphicon-user"></span>&nbsp;
													${userController.user.firstname} &nbsp;
													${userController.user.lastname} 
												</c:when>
													<c:otherwise>
													Login
												</c:otherwise>
												</c:choose>
											</a>
											<div class="dropdown-menu">
												<div class="container"
													style="padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto; width: auto;">
													<h:form>
														<div align="center">
															<c:choose>
																<c:when test="${userController.user!=null}">
																	<c:choose>
																		<c:when
																			test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Customer')}">
																			<span class="glyphicon glyphicon-home"
																				style="margin: 5px; color: black;"></span>
																			<h:commandLink value="Your profile"
																				styleClass="bluea"
																				action="#{userController.openCustomerProfilePage}" />
																			<br>
																			<br>
																			<c:choose>
																				<c:when test="${userController.user.address!=null}">
																					<span class="glyphicon glyphicon-home"
																						style="margin: 5px; color: black;"></span>
																					<h:commandLink value="Change address"
																						styleClass="bluea"
																						action="#{userController.openNewUserAddressPage}" />
																					<br>
																					<br>
																				</c:when>
																				<c:otherwise>
																					<span class="glyphicon glyphicon-home"
																						style="margin: 5px; color: black;"></span>
																					<h:commandLink value="Set address"
																						styleClass="bluea"
																						action="#{userController.openNewUserAddressPage}" />
																					<br>
																					<br>
																				</c:otherwise>
																			</c:choose>
																			<span class="glyphicon glyphicon-shopping-cart"
																				style="margin: 5px; color: black;"></span>
																			<h:commandLink value="My cart" styleClass="bluea"
																				action="#{userController.openCartPage}" />
																			<br>
																			<br>
																			<span class="glyphicon glyphicon-list"
																				style="margin: 5px; color: black;"></span>
																			<h:commandLink value="My Orders" styleClass="bluea"
																				action="#{userController.showOrders}" />
																			<br>
																			<br>
																		</c:when>
																		<c:when
																			test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
																			<span class="glyphicon glyphicon-plus"
																				style="margin: 5px; color: black;"></span>
																			<h:commandLink value="Add product" styleClass="bluea"
																				action="#{userController.openNewProductPage}" />
																			<br>
																			<br>
																			<span class="glyphicon glyphicon-plus"
																				style="margin: 5px; color: black;"></span>
																			<h:commandLink value="Add provider"
																				styleClass="bluea"
																				action="#{userController.openNewProviderPage}" />
																			<br>
																			<br>
																			<span class="glyphicon glyphicon-list"
																				style="margin: 5px; color: black;"></span>
																			<h:commandLink value="List providers"
																				styleClass="bluea"
																				action="#{userController.showProviders}" />
																			<br>
																			<br>
																			<span class="glyphicon glyphicon-briefcase"
																				style="margin: 5px; color: black;"></span>
																			<h:commandLink value="Evade orders"
																				styleClass="bluea"
																				action="#{userController.showOrders}" />
																			<br>
																			<br>
																		</c:when>
																	</c:choose>
																	<h:commandLink value="Log out"
																		styleClass="btn btn-danger"
																		action="#{userController.logOut}">
																		<span class="glyphicon glyphicon-log-out"
																			style="margin: 5px; color: white;"></span>
																	</h:commandLink>
																</c:when>
																<c:otherwise>
																	<div>
																		Email:
																		<h:inputText value="#{userController.email}"
																			required="true" requiredMessage="Email is mandatory"
																			styleClass="login-control" id="email" />
																		<div style="text-align: right; color: red;">
																			<h:message for="email" />
																		</div>
																	</div>
																	<br>
																	<div>
																		Password:
																		<h:inputSecret value="#{userController.password}"
																			required="true"
																			requiredMessage="Password is mandatory"
																			styleClass="login-control" id="password" />
																		<div style="text-align: right; color: red;">
																			<h:message for="password" />
																		</div>
																	</div>
																	<br>
																	<h:commandLink value="Login"
																		action="#{userController.logIn}"
																		styleClass="btn btn-primary" type="submit">
																		<span class="glyphicon glyphicon-log-in"
																			style="margin: 5px; color: white;"></span>
																	</h:commandLink>
																	<div style="color: red;">${userController.logMessage}</div>
																</c:otherwise>
															</c:choose>
														</div>
													</h:form>
												</div>
											</div>
										</div>
									</li>
									<c:if test="${userController.user==null}">
										<li><a href='<c:url value="/faces/signUp.jsp" />'>Sign
												up</a></li>
									</c:if>

								</ul>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container-fluid -->
					</nav>
					<!-- navbar end -->

					<div class="row">
						<div class="col-sm-3" style="background-color: transparent;"></div>
						<div class="col-sm-6" style="background-color: transparent;">
							<div align="center" style="line-height: 200px">
								<img src="pictures/ogc_logo.png" alt="ogc_logo"
									style="width: 70%; height: 70%">
							</div>
						</div>
						<div class="col-sm-3" style="background-color: transparent;"></div>
					</div>
					<div class="row">
						<div class="col-sm-3" style="background-color: transparent;"></div>
						<div class="col-sm-6" style="background-color: transparent;">
							<div align="center">
								<p style="color: white; font-size: medium;">
									My code doesn't work, I have no idea why.<br>My code
									works, I have no idea why.
							</div>
						</div>
						<div class="col-sm-3" style="background-color: transparent;"></div>
					</div>
					<div class="row">
						<div class="col-sm-3" style="background-color: transparent;"></div>
						<div class="col-sm-6" style="background-color: transparent;">
							<h:form styleClass="navbar-form">
								<div align="center">
									<h:inputText autocomplete="false"
										value="#{userController.productController.name}"
										styleClass="form-control"
										style="width: 80%; vertical-align: middle; display: inline-block;"
										id="search" required="true" requiredMessage="">
										<h:commandLink
											action="#{userController.getAllProductsFromSearch}"
											id="search_button">
											<span class="glyphicon glyphicon-search"
												style="left: 79%; color: #888"></span>
										</h:commandLink>
									</h:inputText>
									<h:message for="search" />
								</div>
							</h:form>
						</div>
						<div class="col-sm-3" style="background-color: transparent;"></div>
					</div>
				</div>
			</div>
		</section>
		<section class="section-form" id="section2">
			<div class="second"
				style="color: black; padding-top: 25px; padding-bottom: 45px"
				align="center">
				<!-- Questo sito internet e' stato concepito a scopo puramente dimostrativo.<br>
				I prodotti in catalogo, le descrizioni dei prodotti, i nomi e, piu' in generale,<br>
				tutte le scritte del sito sono presenti unicamente per fornire un esempio.<br>
				Ogni riferimento a fatti, cose, persone o corsi universitari (vedi intestazione)<br>
				e' puramente casuale e non intende offendere o discriminare.<br><br>
				Il sito e' accessibile solo in parte ai visitatori,<br>
				per accedere come amministratore<br>
				e' sufficente usare le creadenziali email:'admin@admin.com' password:'admin' <br>
				(e' anche possibile scommentare le righe da 334 a 337 della pagina signUp.jsp per<br>
				consentire la registrazione come amministratore a qualunque visitatore)<br>
				per accedere come cliente<br>
				e' necessaria la registrazione (raggiungibile premendo il pulsate sign up dalla <br>
				barra di navigazione superiore).<br> -->

				<h1>Wherever you are, we're there with you</h1>
				<br>
				<br>
				<div class="row" align="left" style="padding-left: 120px">
					<div class="col-sm-4" style="background-color: transparent;">
						<div class="row">
							<div class="col-xs-2"
								style="background-color: transparent; padding-right: 0px;"
								align="right">
								<span class="glyphicon glyphicon-plane"
									style="font-size: 30px; color: rgb(58, 109, 158);"></span>
							</div>
							<div class="col-xs-10" style="background-color: transparent">
								<div style="font-size: 20px">
									<b>Fast evade</b>
								</div>
								We evade orders as soon as they<br> reach our servers,
								giving you the best<br> e-commerce experience possible.
							</div>
						</div>
					</div>
					<div class="col-sm-4" style="background-color: transparent;">
						<div class="row">
							<div class="col-xs-2"
								style="background-color: transparent; padding-right: 0px;"
								align="right">
								<span class="glyphicon glyphicon-shopping-cart"
									style="font-size: 30px; color: rgb(58, 109, 158);"></span>
							</div>
							<div class="col-xs-10" style="background-color: transparent">
								<div style="font-size: 20px">
									<b>Large products availability</b>
								</div>
								Our providers are some of the best<br> on the market, as
								they guarantee<br> products availability almost every day.
							</div>
						</div>
					</div>
					<div class="col-sm-4" style="background-color: transparent;">
						<div class="row">
							<div class="col-xs-2"
								style="background-color: transparent; padding-right: 0px;"
								align="right">
								<span class="glyphicon glyphicon-earphone"
									style="font-size: 30px; color: rgb(58, 109, 158);"></span>
							</div>
							<div class="col-xs-10" style="background-color: transparent">
								<div style="font-size: 20px">
									<b>Always reachable</b>
								</div>
								You can contact us 24/7,<br> as we're always online<br>
								for our customers' needs.
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section-form" id="section3">
			<div class="third" style="padding-top: 25px; padding-bottom: 20px">
				<div class="container">
					<div class="col-sm-2" style="background-color: transparent;"></div>
					<div class="col-sm-8" style="background-color: transparent;">
						<h1 align="center" style="color: white">Technologies used for
							development</h1>
						<div
							style="position: relative; display: -webkit-flex; display: -ms-flexbox; display: flex; width: 100%; max-width: 900px; margin-top: 50px; margin-right: auto; margin-left: auto; -webkit-align-items: center; -ms-flex-align: center; align-items: center; -webkit-justify-content: space-between; -ms-flex-pack: justify; justify-content: space-between;">
							<div align="center" style="background-color: transparent;">
								<img src="pictures/java_logo.png" alt="java_logo"
									style="width: 50%">
							</div>
							<div align="center" style="background-color: transparent;">
								<img src="pictures/jsf_logo.png" alt="jsf_logo"
									style="width: 50%">
							</div>
							<div align="center" style="background-color: transparent;">
								<img src="pictures/jsp_logo.png" alt="jsp_logo"
									style="width: 80%">
							</div>
							<div align="center" style="background-color: transparent;">
								<img src="pictures/eclipse_logo.png" alt="eclipse_logo"
									style="width: 60%">
							</div>
							<div align="center" style="background-color: transparent;">
								<img src="pictures/bootstrap_logo.png" alt="bootstrap_logo"
									style="width: 110%">
							</div>
						</div>
						<br>
					</div>
					<div class="col-sm-2" style="background-color: transparent;"></div>
				</div>
			</div>
		</section>
		<section class="section-form" id="section4">
			<div class="second"></div>
		</section>
	</f:view>
</body>
</html>

