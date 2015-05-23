<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<!-- <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" /> -->
<link href="bootstrap/css/style.css" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/jquery-2.1.4.js"></script>
<script src="content/js/jquery.min.js"></script>
<script src="content/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- <script>
	$(document).ready(function() {
		$('.dropdown-toggle').dropdown();
	});
</script> -->


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
<title>E-commerce</title>
</head>
<body>
	<section class="section-form" id="section1">
		<div class="container">
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
										<f:view>
											<div class="container">
												<h:form>
													<div>
														<c:choose>
															<c:when test="${userController.user!=null}">
																<c:choose>
																	<c:when
																		test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Customer')}">
																		<c:choose>
																			<c:when test="${userController.user.address!=null}">
																				<h:commandLink value="Change address"
																					action="#{userController.openNewUserAddressPage}"
																					styleClass="list-group-item-text" />
																				<br>
																				<br>
																			</c:when>
																			<c:otherwise>
																				<h:commandLink value="Set address"
																					action="#{userController.openNewUserAddressPage}" />
																				<br>
																				<br>
																			</c:otherwise>
																		</c:choose>
																	</c:when>
																	<c:when
																		test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
																		<h:commandLink value="Add product"
																			action="#{userController.openNewProductPage}"
																			style="text-align: right" />
										 								<br>
																		<br>
																		<h:commandLink value="Add provider"
																			action="#{userController.openNewProviderPage}"
																			style="text-align: right" />
																		<br>
																		<br>
																		<h:commandLink value="List providers"
																			action="#{userController.showProviders}"
																			style="text-align: right" />
																			<br>
																		<br>
																	</c:when>
																</c:choose>
																<h:commandLink value="Log out"
																	action="#{userController.logOut}"
																	style="text-align: right" />
															</c:when>
															<c:otherwise>
																<div>
																	Email:
																	<h:inputText value="#{userController.email}"
																		required="true" requiredMessage="Email is mandatory"
																		styleClass="login-control" id="email" />
																	<h:message for="email" />
																</div>
																<br>
																<div>
																	Password:
																	<h:inputSecret value="#{userController.password}"
																		required="true"
																		requiredMessage="Password is mandatory"
																		styleClass="login-control" id="password" />
																	<h:message for="password" />
																</div>
																<br>
																<h:commandButton value="Login"
																	action="#{userController.logIn}"
																	styleClass="btnbtn-default" />
																<div>${userController.logMessage}</div>
															</c:otherwise>
														</c:choose>
													</div>
													<%-- 											<li><h:commandLink
													action="#{userController.mostraListinoProdotti}"
													value="List available products" /></li> --%>
												</h:form>
											</div>
										</f:view>
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
	</section>
		<section class="section-form-second" id="section2">
			Prova
		</section>
</body>
</html>

