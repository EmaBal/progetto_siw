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

<title>New Product</title>
</head>
<body style="background-color:#1F71AD;color: white;">
	<f:view>
		
			<div class="first">
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
											<a class="navbar-button-login" href="#"
												data-toggle="dropdown" id="navLogin"> <c:choose>
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
												<div class="container" style="padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto; width: auto;">
													<h:form>
														<div align="center">
															<c:choose>
																<c:when test="${userController.user!=null}">
																	<c:choose>
																		<c:when
																			test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Customer')}">
																			<c:choose>
																				<c:when test="${userController.user.address!=null}">
																					<h:commandLink value="Change address" styleClass="bluea"
																						action="#{userController.openNewUserAddressPage}" />
																					<br>
																					<br>
																				</c:when>
																				<c:otherwise>
																					<h:commandLink value="Set address" styleClass="bluea"
																						action="#{userController.openNewUserAddressPage}" />
																					<br>
																					<br>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																		<c:when
																			test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
																			<h:commandLink value="Add product"  styleClass="bluea"
																				action="#{userController.openNewProductPage}" />
																			<br>
																			<br>
																			<h:commandLink value="Add provider"  styleClass="bluea"
																				action="#{userController.openNewProviderPage}"/>
																			<br>
																			<br>
																			<h:commandLink value="List providers"  styleClass="bluea"
																				action="#{userController.showProviders}" />
																			<br>
																			<br>
																		</c:when>
																	</c:choose>
																	<h:commandLink value="Log out"  styleClass="btn btn-danger"
																		action="#{userController.logOut}" />
																</c:when>
																<c:otherwise>
																	<div>
																		Email:
																		<h:inputText value="#{userController.email}"
																			required="true" requiredMessage="Email is mandatory"
																			styleClass="login-control" id="email" />
																		<div style="text-align:right;color:red;"><h:message for="email" /></div>
																	</div>
																	<br>
																	<div>
																		Password:
																		<h:inputSecret value="#{userController.password}"
																			required="true"
																			requiredMessage="Password is mandatory"
																			styleClass="login-control" id="password" />
																		<div style="text-align:right;color:red;"><h:message for="password" /></div>
																	</div>
																	<br>
																	<h:commandButton value="Login"
																		action="#{userController.logIn}"
																		styleClass="btn btn-primary" />
																	<div style="color:red;">${userController.logMessage}</div>
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
				<h:form>
					<div>
						Name:
						<h:inputText value="#{userController.productController.name}"
							required="true" requiredMessage="Name is mandatory" id="name"
							styleClass="form-control" />
						<div class="warningform">
							<h:message for="name" />
						</div>
					</div>
					<div>
						Code:
						<h:inputText value="#{userController.productController.code}"
							required="true" requiredMessage="Code is mandatory" id="code"
							styleClass="form-control" />
						<div class="warningform">
							<h:message for="code" />
						</div>
					</div>
					<div>
						Price:
						<h:inputText value="#{userController.productController.price}"
							required="true" requiredMessage="Price is mandatory"
							converterMessage="Price must be a number" id="price"
							styleClass="form-control" />
						<div class="warningform">
							<h:message for="price" />
						</div>
					</div>
					<div>
						Description:
						<h:inputTextarea
							value="#{userController.productController.description}"
							required="false" cols="20" rows="5" styleClass="form-control" />

					</div>
					<div>
						Providers that distribute this product:
						<table style="width: 100%;">
							<tr>
								<th>Name</th>
								<th>VAT</th>
								<th>email</th>
							</tr>
							<c:forEach var="currentProvider"
								items="#{userController.providerController.providers}">
								<tr>
									<td><h:selectBooleanCheckbox
											value="#{userController.providerController.selectedProviders[currentProvider]}" />
										<h:outputLabel value="#{currentProvider.name}" /></td>

									<td>${currentProvider.vatin}</td>
									<td>${currentProvider.email}</td>
								</tr>
							</c:forEach>

						</table>

					</div>
					<div align="center">
						<h:commandButton styleClass="btn btn-default"  value="Create product" style="color:black; margin: 15px;"
							action="#{userController.createProduct}" />
					</div>
					
				</h:form>
			</div>
			<div class="col-sm-3"></div>
			</div>

	
	

	</f:view>
</body>
</html>