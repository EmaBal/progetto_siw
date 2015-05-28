<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

</head>
<body style="background-color: #1F71AD">

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
																required="true" requiredMessage="Password is mandatory"
																styleClass="login-control" id="password" />
															<h:message for="password" />
														</div>
														<br>
														<h:commandButton value="Login"
															action="#{userController.logIn}"
															styleClass="btn btn-default" />
														<div>${userController.logMessage}</div>
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
			<div class="row" style="height: 300px">
				<div class="col-sm-3" style="background-color: transparent;"></div>
				<div class="col-sm-6" style="background-color: transparent;">
					<h:form>
						<div>
							<div style="color: white">Email</div>
							<h:inputText value="#{userController.email}" required="true"
								validatorMessage="Email must be in the form a@b.c"
								requiredMessage="Email is mandatory" id="email"
								styleClass="form-control">

								<f:validateRegex pattern="(.+\@.+\..+)" />

							</h:inputText>
							<div class="warningform">
								<h:message for="email" />
							</div>
						</div>
						<br>
						<div>
							<div style="color: white">Password</div>
							<h:inputSecret value="#{userController.password}" required="true"
								requiredMessage="Password is mandatory"
								validatorMessage="The password's first character must be a letter, it must contain at least 4 characters and no more than 15 characters and no characters other than letters, numbers and the underscore may be used"
								id="password" styleClass="form-control">

								<f:validateRegex pattern="(^[a-zA-Z]\w{3,14}$)" />

							</h:inputSecret>
							<div class="warningform">
								<h:message for="password" />
							</div>
						</div>
						<br>
						<div>
							<div style="color: white">First name</div>
							<h:inputText value="#{userController.firstname}" required="true"
								validatorMessage="First name name can only contains letters"
								requiredMessage="First name is mandatory" id="firstname"
								styleClass="form-control">
								<f:validateRegex pattern="(^[a-zA-Z][a-zA-Z]+$)" />
							</h:inputText>
							<div class="warningform">
								<h:message for="firstname" />
							</div>
						</div>
						<br>
						<div>
							<div style="color: white">Last name</div>
							<h:inputText value="#{userController.lastname}" required="true"
								validatorMessage="Last name name can only contains letters"
								requiredMessage="Last name is mandatory" id="lastname"
								styleClass="form-control">
								<f:validateRegex pattern="(^[a-zA-Z][a-zA-Z]+$)" />
							</h:inputText>
							<div class="warningform">
								<h:message for="lastname" />
							</div>
						</div>
						<br>
						<div>
							<div style="color: white">Phone number</div>
							<h:inputText value="#{userController.phonenumber}"
								required="true"
								validatorMessage="Phone number must be between 6 and 15 numbers (Please use 00 instead of + for international prefix)"
								requiredMessage="Phone number is mandatory" id="phonenumber"
								styleClass="form-control">
								<f:validateRegex pattern="(^[0-9]{6,15})" />
							</h:inputText>
							<div class="warningform">
								<h:message for="phonenumber" />
							</div>
						</div>
						<br>
						<div>
							<div style="color: white">Birth date (dd/mm/yyyy)</div>
							<h:inputText value="#{userController.birthdate}" required="true"
								converterMessage="Birth date must be in the form dd/MM/yyyy"
								requiredMessage="Birth date is mandatory" id="birthdate"
								styleClass="form-control">
								<f:converter converterId="validatingPatternDateTimeConverter" />
								<f:attribute name="validateRegex"
									value="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$" />
								<f:attribute name="convertPattern" value="dd/mm/yyyy" />
							</h:inputText>
							<div class="warningform">
								<h:message for="birthdate" />
							</div>
						</div>
						<br>
						<div>${userController.logMessage}</div>
						<br>
						<div align="center">
							<h:commandButton value="Sign Up" 
								action="#{userController.createCustomer}"
								 style="color:black; margin: 15px;"
								styleClass="btn btn-default" />
							<%-- 							<h:commandButton value="Sign Up as administrator"
								action="#{userController.createAdministrator}"
								styleClass="btn btn-default" /> --%>
						</div>
					</h:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3" style="background-color: transparent;"></div>
	</f:view>
</body>
</html>