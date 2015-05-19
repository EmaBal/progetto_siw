<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up</title>
</head>
<body>
	<f:view>
		<h:form>
			Insert address fields:<br>
			<div>
				Street:
				<h:inputText value="#{userController.addressController.street}"
					required="true" requiredMessage="Street is mandatory"
					validatorMessage="The field is not correctly written"
					id="street">
					<f:validateRegex pattern="^([a-zA-Z]+\s[a-zA-Z]+\s+[0-9]+)$" />
				</h:inputText>
				<h:message for="street" />
			</div>
			<div>
				City:
				<h:inputText value="#{userController.addressController.city}"
					required="true" requiredMessage="City is mandatory"
					validatorMessage="The field contains invalid characters" id="city">
					<f:validateRegex pattern="[a-zA-Z]+" />
				</h:inputText>
				<h:message for="city" />
			</div>
			<div>
				State:
				<h:inputText value="#{userController.addressController.state}"
					required="true" requiredMessage="State is mandatory"
					validatorMessage="The field contains invalid characters" id="state">
					<f:validateRegex pattern="[A-Z][A-Z]" />
				</h:inputText>
				<h:message for="state" />
			</div>
			<div>
				Zip code:
				<h:inputText value="#{userController.addressController.zipcode}"
					required="true" requiredMessage="Zip code is mandatory"
					validatorMessage="The field is not correctly written" id="zipcode">
					<f:validateRegex pattern="^[0-9]{5}" />
				</h:inputText>
				<h:message for="zipcode" />
			</div>
			<div>
				Country:
				<h:inputText value="#{userController.addressController.country}"
					required="true" requiredMessage="Country is mandatory"
					validatorMessage="The field contains invalid characters"
					id="country" >
				<f:validateRegex pattern="[a-zA-Z]+" />
				</h:inputText>
				<h:message for="country" />
			</div>
			<div>
				<h:commandButton value="Add address"
					action="#{userController.addAddress}" />
			</div>
		</h:form>
	</f:view>
</body>
</html>