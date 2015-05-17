<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>E-commerce</title>
</head>
<body>
	<f:view>
		<h1>E-commerce</h1>
		<li><h:form>
			<h:commandLink action="#{consultaListinoController.mostraListinoProdotti}" value="List available products" />
		</h:form></li>
	</f:view>
</body>
</html>

