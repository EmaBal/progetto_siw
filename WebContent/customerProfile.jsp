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

<title>Profile</title>

</head>
<body style="background-color: rgb(54, 75, 113); color: white;">
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
												styleClass="navbar-item-link" value="Products"
												style="text-decoration:none; line-height:25px; padding-top:0px; padding-bottom:0px; position:relative; display:block; padding:1px 15px; margin:10px;">
											</h:commandLink>
										</h:form></li>

									<li class="navbar-item-opaque">
											<a class="navbar-item-link" style="text-decoration: none" href='<c:url value="/faces/support.jsp" />'>Support</a>
										</li>
								<li class="navbar-item-opaque">
											<a class="navbar-item-link" style="text-decoration: none" href='<c:url value="/faces/contactPage.jsp" />'>Contact</a>
										</li>
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
		</div>

		<div class="col-sm-3"></div>
		<div class="col-sm-6" align="center">
			<c:choose>
				<c:when
					test="${userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
					<h1>Customer's Profile</h1>
				</c:when>
				<c:otherwise>
					<h1>Your profile</h1>
				</c:otherwise>
			</c:choose>
			<br> <b>First name:</b> ${userController.customer.firstname} <br>
			<br> <b>Last name:</b> ${userController.customer.lastname} <br>
			<br> <b>Email:</b> ${userController.customer.email} <br> <br>
			<b>Phone number:</b> ${userController.customer.phonenumber} <br>
			<br> <b>Birth date:</b> ${userController.customer.birthDate}<br>
			<br> <b>Address:</b>
			<c:choose>
				<c:when
					test="${!userController.customer.address.equals(null) && userController.customer.address != null}">
					${userController.customer.address.street}, 
					${userController.customer.address.city}, 
					${userController.customer.address.state}, 
					${userController.customer.address.zipcode}, 
					${userController.customer.address.country}
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when
							test="${userController.userprivilege.equals('it.uniroma3.model.Customer')}">
						You have no address set. Do it now!
						<br>
							<br>
							<h:form>
								<h:commandLink action="#{userController.openNewUserAddressPage}"
									value="Set Address" styleClass="btn btn-default">
									<span class="glyphicon glyphicon-home"
										style="margin: 5px; color: black;"></span>
								</h:commandLink>
							</h:form>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
					<h2>Customer's Orders:</h2>
					<h:form>
						<c:forEach var="currentOrder"
							items="#{userController.orderController.orders}">
							<li><h:commandLink
									action="#{userController.openOrderDetails(currentOrder)}">${currentOrder.id}</h:commandLink></li>
						</c:forEach>
					</h:form>
				</c:when>
			</c:choose>
		</div>
		<div class="col-sm-3"></div>
	</f:view>
</body>
</html>