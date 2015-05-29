<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="typeahead.js"></script>
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
<title>New provider</title>
</head>
<body style="background-color: #1F71AD; color: white;">
	<f:view>

		<div class="first">
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
											styleClass="navbar-item-link">
										</h:commandLink>
									</h:form></li>
								<li class="navbar-item-opaque"><a href="products.jsp"
									class="navbar-item-link">Products</a></li>
								<li class="navbar-item-opaque"><a href="#"
									class="navbar-item-link">Support</a></li>
								<li class="navbar-item-opaque"><a href="#"
									class="navbar-button-link">Contact</a></li>
								<li class="navbar-item-login" id="menuLogin">
									<div class="dropdown keep-open">
										<a class="navbar-button-login" href="#" data-toggle="dropdown"
											id="navLogin"> <c:choose>
												<c:when test="${userController.user!=null}">
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
																		<h:commandLink value="Add provider" styleClass="bluea"
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
																	styleClass="btn btn-primary">
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

			</div>

			<div class="col-sm-3"></div>
			<div class="col-sm-6">


				<div class="form">
					<h:form>
			<h3>Insert provider details:</h3><br>
						<br>
						<div>
							Email:
							<h:inputText value="#{userController.providerController.email}"
								required="true" styleClass="form-control"
								validatorMessage="Email must be in the form a@b.c"
								requiredMessage="Email is mandatory" id="email">

								<f:validateRegex pattern="(.+\@.+\..+)" />

							</h:inputText>
							<div class="warningform"><h:message for="email" /></div>
						</div>
						<br>
						<div>
							Company name:
							<h:inputText value="#{userController.providerController.name}"
								required="true" styleClass="form-control"
								validatorMessage="Company name name can only contains letters"
								requiredMessage="Company name is mandatory" id="name">
								<f:validateRegex pattern="(^[a-zA-Z][a-zA-Z]+$)" />
							</h:inputText>
							<div class="warningform"><h:message for="name" /></div>
						</div>
						<br>
						<div>
							Phone number:
							<h:inputText
								value="#{userController.providerController.phonenumber}"
								required="true" styleClass="form-control"
								validatorMessage="Phone number must be between 6 and 15 numbers (Please use 00 instead of + for international prefix)"
								requiredMessage="Phone number is mandatory" id="phonenumber">
								<f:validateRegex pattern="(^[0-9]{6,15})" />
							</h:inputText>
							<div class="warningform"><h:message for="phonenumber" /></div>
						</div>
						<br>
						<div>
							Company Vat:<br>
							<h:inputText value="#{userController.providerController.vatin}"
								required="true" requiredMessage="Company Vat code is mandatory"
								validatorMessage="The field is not correctly written,please use country specific vatin"
								styleClass="form-control" id="vatin">
								<f:validateRegex
									pattern="^((AT)?U[0-9]{8}|(BE)?0[0-9]{9}|(BG)?[0-9]{9,10}|(CY)?[0-9]{8}L|(CZ)?[0-9]{8,10}|(DE)?[0-9]{9}|(DK)?[0-9]{8}|(EE)?[0-9]{9}|(EL|GR)?[0-9]{9}|(ES)?[0-9A-Z][0-9]{7}[0-9A-Z]|(FI)?[0-9]{8}|(FR)?[0-9A-Z]{2}[0-9]{9}|(GB)?([0-9]{9}([0-9]{3})?|[A-Z]{2}[0-9]{3})|(HU)?[0-9]{8}|(IE)?[0-9]S[0-9]{5}L|(IT)?[0-9]{11}|(LT)?([0-9]{9}|[0-9]{12})|(LU)?[0-9]{8}|(LV)?[0-9]{11}|(MT)?[0-9]{8}|(NL)?[0-9]{9}B[0-9]{2}|(PL)?[0-9]{10}|(PT)?[0-9]{9}|(RO)?[0-9]{2,10}|(SE)?[0-9]{12}|(SI)?[0-9]{8}|(SK)?[0-9]{10})$" />
							</h:inputText>
							<div class="warningform"><h:message for="vatin" /></div>
						</div>
						<br/>
						<div>
							<h:commandButton value="Add provider"
								action="#{userController.providerController.createProvider}"
								styleClass="btn btn-default" style="margin:15px;" />
						</div>
					</h:form>
				</div>
			</div>
			<div class="col-sm-3"></div>
	</f:view>

</body>
</html>