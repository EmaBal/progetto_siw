<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<f:view><h:form>
		<h1>E-commerce</h1>

		<li>Sing up:</li>
	    <div>Street: <h:inputText value="#{userController.addressController.street}" 
			required="true"
            requiredMessage="Street is mandatory"
            id="street"/> <h:message for="street" />
		</div>
		<div>City: <h:inputText value="#{userController.addressController.city}" 
            required="true"
            requiredMessage="City is mandatory"
            id="city"/> <h:message for="city" />
		</div>
		<div>State: <h:inputText value="#{userController.addressController.state}" 
            required="true"
            requiredMessage="State is mandatory"
            id="state"/> <h:message for="state" />
		</div>
		<div>Zip code: <h:inputText value="#{userController.addressController.zipcode}" 
            required="true"
            requiredMessage="Zip code is mandatory"
            id="zipcode"/> <h:message for="zipcode" />
		</div>
		<div>Country: <h:inputText value="#{userController.addressController.country}" 
            required="true"
            requiredMessage="Country is mandatory"
            id="country"/> <h:message for="country" />
		</div>
		
		<div>
			<h:commandButton value="Add address"  action="#{userController.addAddress}"/>
		</h:form></div>
		
	</f:view>
</body>
</html>