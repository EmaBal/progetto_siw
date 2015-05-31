<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
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
<title>Products</title>
</head>
<body style="background-color: #1F71AD; color: white;">

	<f:view>
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
																		<h:commandLink value="Set address" styleClass="bluea"
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
																<h:commandLink value="List providers" styleClass="bluea"
																	action="#{userController.showProviders}" />
																<br>
																<br>
															</c:when>
														</c:choose>
														<h:commandLink value="Log out" styleClass="btn btn-danger"
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
																required="true" requiredMessage="Password is mandatory"
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
			<!-- /.container-fluid --> </nav>
			<!-- navbar end -->
			<h:form>
				<div class="row">
					<div class="col-sm-2" style="background-color: transparent;"></div>
					<div class="col-sm-8" style="background-color: transparent;"
						align="center">
						<div class="panel-group" id="accordion">
							<c:forEach var="currentProduct"
								items="#{userController.productController.products}"
								varStatus="loop">
								<div class="panel panel-primary ">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#accordion${currentProduct.id}">${currentProduct.name}</a>
										</h4>
									</div>
									<div id="accordion${currentProduct.id}"
										class="panel-collapse collapse">
										<div class="panel-body" style="color: black">
											<div class="row">
												<div class="col-sm-4" style="background-color: transparent;">
													<div align="left">
														<b>Description:</b> ${currentProduct.description}
													</div>
													<div align="left">
														<b>Price:</b>
														<c:choose>
															<c:when
																test="${userController.orderController.orderlines[currentProduct] != null}">
																<c:out
																	value="${(userController.orderController.orderlines[currentProduct].quantity) * currentProduct.price}"></c:out>
															</c:when>
															<c:otherwise>${currentProduct.price}</c:otherwise>
														</c:choose>
													</div>
													<div align="left">
														<b>Quantity:</b>
														<h:inputText
															value="#{userController.productController.productsQuantity[currentProduct]}"
															converterMessage="Quantity must be a number"
															styleClass="form-control"
															style="width: 30%; display: inline-block" id="quantity"
															converter="javax.faces.Integer"></h:inputText>
														<div class="warningform">
															<h:message for="quantity" />
														</div>
													</div>
												</div>
												<div class="col-sm-4" style="background-color: transparent;"></div>
												<div class="col-sm-4" style="background-color: transparent;"
													align="right">
													<div class="btn-group-lg">
														<h:commandLink
															action="#{userController.openProductDetails(currentProduct)}"
															styleClass="btn btn-default" value="Info">
														</h:commandLink>
														&nbsp;
														<h:commandLink
															action="#{userController.addProductToCart(currentProduct)}"
															styleClass="btn btn-default" value="Add to cart"></h:commandLink>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<h:commandButton action="#{userController.createOrder}"
							styleClass="btn btn-default" value="Create order"></h:commandButton>

						<%--						<table class="table table-condensed"
							style="border-collapse: collapse;">
							<tbody>
								<c:forEach var="currentProduct"
									items="#{userController.productController.products}">
									<tr data-toggle="collapse" data-target="#demo1"
										class="accordion-toggle">
										<td><h:commandLink styleClass="btn btn-default"
												value="#{currentProduct.name}" /></td>
									</tr>
									<tr>
										<td colspan="6" class="hiddenRow"><div
												class="accordian-body collapse" id="demo1">
												<table class="table">
													<tbody>
														<tr>
															<td style="width: 100%">Price:
																${currentProduct.price}</td>
														</tr>
														<tr>
															<td>Description: ${currentProduct.description}</td>
															<td>Quantity: <h:inputText
																	value="#{userController.productController.cart[currentProduct]}"
																	converterMessage="Quantity must be a number"
																	id="quantity" styleClass="form-control"
																	converter="javax.faces.Integer"></h:inputText>
																<div class="warningform">
																	<h:message for="quantity" />
																</div></td>
															<td><h:commandLink
																	action="#{userController.openProductDetails(currentProduct)}"
																	value="Info">
																</h:commandLink></td>
															<td><h:commandLink
																	action="#{userController.addProductToCart(currentProduct)}"
																	styleClass="btn btn-default" value="Add to cart"></h:commandLink>
															</td>
														</tr>
													</tbody>
												</table>
											</div></td>
									</tr>
								</c:forEach>
							</tbody>

						</table> --%>
						<%-- <c:choose>
						<c:when
							test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Customer')}">
							<h:form>
								<h1>Products:</h1>
								<table class="table" align="center">
									<tr>
										<th>Name</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Add to cart</th>
									</tr>
									<c:forEach var="currentProduct"
										items="#{userController.productController.products}">
										<tr>
											<td><h:commandLink
													action="#{userController.openProductDetails(currentProduct)}"
													value="#{currentProduct.name}">
												</h:commandLink></td>
											<td><c:choose>
													<c:when
														test="${userController.orderController.orderlines[currentProduct] != null}">
														<c:out
															value="${(userController.orderController.orderlines[currentProduct].quantity) * currentProduct.price}"></c:out>
													</c:when>
													<c:otherwise>${currentProduct.price}</c:otherwise>
												</c:choose></td>

											<td><h:inputText
													value="#{userController.productController.productsQuantity[currentProduct]}"
													converterMessage="Quantity must be a number" id="quantity"
													styleClass="form-control" converter="javax.faces.Integer"></h:inputText>
												<div class="warningform">
													<h:message for="quantity" />
												</div></td>
											<td><h:commandButton
													action="#{userController.addProductToCart(currentProduct)}"
													styleClass="btn btn-default" value="Add to cart"></h:commandButton>
											</td>
										</tr>
									</c:forEach>

								</table>
								<h:commandButton action="#{userController.createOrder}"
									styleClass="btn btn-default" value="Create order"></h:commandButton>
							</h:form>
						</c:when>
						<c:when
							test="${userController.user==null || userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
							<h:form>
								<h1>Products :</h1>
								<table>
									<tr>
										<th>Name</th>
										<th>Price</th>
									</tr>
									<c:forEach var="currentProduct"
										items="#{userController.productController.products}">
										<tr>
											<td><h:commandLink
													action="#{userController.openProductDetails(currentProduct)}"
													value="#{currentProduct.name}">
												</h:commandLink></td>
											<td>${currentProduct.price}</td>
										</tr>
									</c:forEach>
								</table>
							</h:form>
						</c:when>
					</c:choose> --%>
					</div>
					<div class="col-sm-2" style="background-color: transparent;"></div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>