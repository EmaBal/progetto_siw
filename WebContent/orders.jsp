<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Cart</title>
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

<title>Orders</title>
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
			<div class="col-sm-6" align="center">
				<c:choose>
					<c:when
						test="${(userController.orderController.orders != null) and (not empty userController.orderController.orders)}">
						<c:choose>
							<c:when
								test="${userController.userprivilege.equals('it.uniroma3.model.Customer')}">
								<h3>Your orders :</h3>
							</c:when>
							<c:otherwise>
								<h3>Confirmed orders:</h3>
							</c:otherwise>
						</c:choose>

						<table class="table">
							<thead>
								<tr>
									<c:choose>
										<c:when
											test="${userController.userprivilege.equals('it.uniroma3.model.Customer')}">
											<th>Order Id</th>
											<th>Creation date</th>
											<th>Confirmation date</th>
											<th>Evasion date</th>
											<th>Info</th>
										</c:when>
										<c:otherwise>
											<th>Order Id</th>
											<th>Creation date</th>
											<th>Confirmation date</th>
											<th>Evasion</th>
										</c:otherwise>
									</c:choose>
								</tr>
							</thead>
							<tbody class="table-striped">
								<h:form>
									<c:forEach var="currentOrder"
										items="#{userController.orderController.orders}">
										<tr>
											<c:choose>
												<c:when
													test="${userController.userprivilege.equals('it.uniroma3.model.Customer')}">
													<td>${currentOrder.key.id}</td>
												</c:when>
												<c:otherwise>
													<td><h:commandLink
															action="#{userController.getCustomerFromOrder(currentOrder.key)}">
															<span class="glyphicon glyphicon-user"></span>&nbsp;${currentOrder.key.id}</h:commandLink></td>
												</c:otherwise>
											</c:choose>
											<td>${currentOrder.key.creationDate}</td>
											<td>${currentOrder.key.confirmationDate}</td>
											<c:choose>
												<c:when
													test="${userController.userprivilege.equals('it.uniroma3.model.Customer')}">
													<td>${currentOrder.key.evadingDate}</td>
												</c:when>
												<c:otherwise>
													<td><c:choose>
															<c:when test="${currentOrder.value==true}">
																<h:commandLink styleClass="btn btn-default"
																	action="#{userController.orderController.evadeOrder(currentOrder.key)}"
																	value="Evade"> &nbsp; 
															<span style="vertical-align: text-top;"
																		class="glyphicon glyphicon-briefcase"></span>
																</h:commandLink>
															</c:when>
															<c:otherwise>
																<h:commandLink styleClass="btn btn-default"
																	action="#{userController.orderController.evadeOrder(currentOrder.key)}"
																	value="Evade" disabled="true"> &nbsp; 
															<span style="vertical-align: text-top;"
																		class="glyphicon glyphicon-briefcase"></span>
																</h:commandLink>
															</c:otherwise>
														</c:choose></td>
												</c:otherwise>
											</c:choose>

											<c:if
												test="${userController.userprivilege.equals('it.uniroma3.model.Customer')}">
												<td><h:commandLink styleClass="btn btn-default"
														action="#{userController.openOrderDetails(currentOrder.key)}"
														value="info">
														<span style="vertical-align: text-top; color: #1F71AD"
															class="glyphicon glyphicon-info-sign"></span>
													</h:commandLink></td>
											</c:if>
										</tr>
									</c:forEach>
								</h:form>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when
								test="${userController.userprivilege.equals('it.uniroma3.model.Customer')}">
								<br>You don't have any order to evade. There are no new confirmed orders <br>
							</c:when>
							<c:otherwise>
								<br>You don't have any order yet! please use product button to navigate through <br>
							</c:otherwise>
						</c:choose>

					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-sm-3"></div>
		</div>


	</f:view>
</body>
</html>