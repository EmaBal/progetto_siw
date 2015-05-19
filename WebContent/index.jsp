<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-commerce</title>
</head>
<body>

	<f:view>
		<h:form>
			<h1>E-commerce</h1>

			<li>Login:</li>
			<div>
				Email:
				<h:inputText value="#{userController.email}" required="true"
					requiredMessage="Email is mandatory" id="email" />
				<h:message for="email" />
			</div>
			<div>
				Password:
				<h:inputText value="#{userController.password}" required="true"
					requiredMessage="Password is mandatory" id="password" />
				<h:message for="password" />
			</div>
			<div>${userController.passwordErr}</div>
			<div>
				<h:commandButton value="Log in"
					action="#{userController.findCredentials}" />
			</div>
			<li><h:commandLink
					action="#{consultaListinoController.mostraListinoProdotti}"
					value="List available products" /></li>
			<li><a href='<c:url value="/faces/signUp.jsp" />'>Sign up</a></li>
		</h:form>
	</f:view>

</body>
</html>

