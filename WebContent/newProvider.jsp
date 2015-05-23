<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<f:view>
		<div class="container">
			<h:form>
			Insert address fields:<br>
				<br>
				<div>
					Email:
					<h:inputText value="#{userController.providerController.email}" required="true"
						validatorMessage="Email must be in the form a@b.c"
						requiredMessage="Email is mandatory" id="email">

						<f:validateRegex pattern="(.+\@.+\..+)" />

					</h:inputText>
					<h:message for="email" />
				</div>
				<br>
				<div>
					Company name:
					<h:inputText value="#{userController.providerController.name}" required="true"
						validatorMessage="Company name name can only contains letters"
						requiredMessage="Company name is mandatory" id="name">
						<f:validateRegex pattern="(^[a-zA-Z][a-zA-Z]+$)" />
					</h:inputText>
					<h:message for="name" />
				</div>
				<br>
				<div>
					Phone number:
					<h:inputText value="#{userController.providerController.phonenumber}" required="true"
						validatorMessage="Phone number must be between 6 and 15 numbers (Please use 00 instead of + for international prefix)"
						requiredMessage="Phone number is mandatory" id="phonenumber">
						<f:validateRegex pattern="(^[0-9]{6,15})" />
					</h:inputText>
					<h:message for="phonenumber" />
				</div>
				<br>
				<div>
					Company Vat:<br>
					<h:inputText value="#{userController.providerController.vatin}" required="true"
						requiredMessage="Company Vat code is mandatory"
						validatorMessage="The field is not correctly written,please use country specific vatin"
						styleClass="form-control" id="vatin">
						<f:validateRegex
							pattern="^((AT)?U[0-9]{8}|(BE)?0[0-9]{9}|(BG)?[0-9]{9,10}|(CY)?[0-9]{8}L|(CZ)?[0-9]{8,10}|(DE)?[0-9]{9}|(DK)?[0-9]{8}|(EE)?[0-9]{9}|(EL|GR)?[0-9]{9}|(ES)?[0-9A-Z][0-9]{7}[0-9A-Z]|(FI)?[0-9]{8}|(FR)?[0-9A-Z]{2}[0-9]{9}|(GB)?([0-9]{9}([0-9]{3})?|[A-Z]{2}[0-9]{3})|(HU)?[0-9]{8}|(IE)?[0-9]S[0-9]{5}L|(IT)?[0-9]{11}|(LT)?([0-9]{9}|[0-9]{12})|(LU)?[0-9]{8}|(LV)?[0-9]{11}|(MT)?[0-9]{8}|(NL)?[0-9]{9}B[0-9]{2}|(PL)?[0-9]{10}|(PT)?[0-9]{9}|(RO)?[0-9]{2,10}|(SE)?[0-9]{12}|(SI)?[0-9]{8}|(SK)?[0-9]{10})$" />
					</h:inputText>
					<h:message for="vatin" />
				</div>
				<br>
				<div>
					<h:commandButton value="Add provider" action="#{userController.providerController.createProvider}" styleClass="btnbtn-default" />
				</div>
			</h:form>
		</div>
	</f:view>

</body>
</html>