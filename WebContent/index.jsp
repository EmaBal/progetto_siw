<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>E-commerce</title>
</head>
<body>
	<f:view>
		<div class="container">
				<h:form>
					<h1>E-commerce</h1>
					<div>
						<c:choose>
							<c:when
								test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Customer')}">
								<h:commandButton value="Add address"
									action="#{userController.openNewAddressPage}" />
							</c:when>
							<c:otherwise>
								<div>
									Login:<br> Email:
									<h:inputText value="#{userController.email}" required="true"
										requiredMessage="Email is mandatory" styleClass="form-control"
										id="email" />
									<h:message for="email" />
								</div>
								<div>
									Password:
									<h:inputSecret value="#{userController.password}"
										required="true" requiredMessage="Password is mandatory"
										styleClass="form-control" id="password" />
									<h:message for="password" />
								</div>
								<h:commandButton value="Log in"
									action="#{userController.findCredentials}"
									styleClass="btnbtn-default" />
							</c:otherwise>
						</c:choose>
						<div>${userController.passwordErr}</div>
					</div>
					<li><h:commandLink
							action="#{consultaListinoController.mostraListinoProdotti}"
							value="List available products" /></li>
					<li><a href='<c:url value="/faces/signUp.jsp" />'>Sign up</a></li>
				</h:form>
		</div>
	</f:view>

</body>
</html>

