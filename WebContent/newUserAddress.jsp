<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Sign up</title>
</head>
<body>
	<f:view>
		<div class="container">
			<h:form>
			Insert address fields:<br><br>
				<div>
					Street:<br>
					<h:inputText value="#{userController.addressController.street}"
						required="true" requiredMessage="Street is mandatory"
						validatorMessage="The field is not correctly written"
						styleClass="form-control" id="street">
						<f:validateRegex pattern="^(([a-zA-Z]+\s){2,}+[0-9]+)$" />
					</h:inputText>
					<h:message for="street" />
				</div><br>
				<div>
					City:<br>
					<h:inputText value="#{userController.addressController.city}"
						required="true" requiredMessage="City is mandatory"
						validatorMessage="The field contains invalid characters"
						styleClass="form-control" id="city">
						<f:validateRegex pattern="[a-zA-Z]+" />
					</h:inputText>
					<h:message for="city" />
				</div><br>
				<div>
					State:<br>
					<h:inputText value="#{userController.addressController.state}"
						required="true" requiredMessage="State is mandatory"
						validatorMessage="The field contains invalid characters"
						styleClass="form-control" id="state">
						<f:validateRegex pattern="[A-Z][A-Z]" />
					</h:inputText>
					<h:message for="state" />
				</div><br>
				<div>
					Zip code:<br>
					<h:inputText value="#{userController.addressController.zipcode}"
						required="true" requiredMessage="Zip code is mandatory"
						validatorMessage="The field is not correctly written"
						styleClass="form-control" id="zipcode">
						<f:validateRegex pattern="^[0-9]{5}" />
					</h:inputText>
					<h:message for="zipcode" />
				</div><br>
				<div>
					Country:<br>
					<h:inputText value="#{userController.addressController.country}"
						required="true" requiredMessage="Country is mandatory"
						validatorMessage="The field contains invalid characters"
						styleClass="form-control" id="country">
						<f:validateRegex pattern="[a-zA-Z]+" />
					</h:inputText>
					<h:message for="country" />
				</div>
				<br>
				<div>
					<c:choose>
						<c:when test="${userController.user.address==null}">
							<h:commandButton value="Add address"
								action="#{userController.addAddress}"
								styleClass="btnbtn-default" />
						</c:when>
						<c:otherwise>
							<h:commandButton value="Change address"
								action="#{userController.addAddress}"
								styleClass="btnbtn-default" />
						</c:otherwise>
					</c:choose>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>