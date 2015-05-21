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
<script>
	$(document).ready(function() {
		$('.dropdown-toggle').dropdown();
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
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">OGC</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Products</a></li>
						<li><a href="#">Support</a></li>
						<li><a href="#">Contact</a></li>
						<li class="dropdown" id="menuLogin"><a
							class="dropdown-toggle" href="#" data-toggle="dropdown"
							id="navLogin">Login</a>
							<div class="dropdown-menu" >
								<f:view>
									<div class="container">
										<h:form>

											<div>
												<c:choose>
													<c:when
														test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Customer')}">
														<c:choose>
															<c:when test="${userController.user.address!=null}">
																<h:commandButton value="Change address"
																	action="#{userController.openNewAddressPage}" />
															</c:when>
															<c:otherwise>
																<h:commandButton value="Set address"
																	action="#{userController.openNewAddressPage}" />
															</c:otherwise>
														</c:choose>

													</c:when>
													<c:when
														test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
														<h:commandButton value="Add product"
															action="#{userController.openNewProductPage}" />
													</c:when>
													<c:otherwise>
														<div>
															Login:<br> Email:
															<h:inputText value="#{userController.email}"
																required="true" requiredMessage="Email is mandatory"
																styleClass="login-control" id="email" />
															<h:message for="email" />
														</div>
														<div>
															Password:
															<h:inputSecret value="#{userController.password}"
																required="true" requiredMessage="Password is mandatory"
																styleClass="login-control" id="password" />
															<h:message for="password" />
														</div>
														<h:commandButton value="Log in"
															action="#{userController.logIn}"
															styleClass="btnbtn-default" />
													</c:otherwise>
												</c:choose>
												<div>${userController.passwordErr}</div>
											</div>
											<li><h:commandLink
													action="#{userController.mostraListinoProdotti}"
													value="List available products" /></li>
											<li><a href='<c:url value="/faces/signUp.jsp" />'>Sign
													up</a></li>
										</h:form>
									</div>
								</f:view>
								<%-- 									</form> --%>
							</div></li>
						<li><a href='<c:url value="/faces/signUp.jsp" />'>Sign up</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
</body>
</html>

