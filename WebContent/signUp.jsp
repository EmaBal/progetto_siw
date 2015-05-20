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
				<h1>E-commerce</h1>

				<li>Sign up:</li>
				<div>
					Email:
					<h:inputText value="#{userController.email}" required="true"
						validatorMessage="Email must be in the form a@b.c"
						requiredMessage="Email is mandatory" id="email">

						<f:validateRegex pattern="(.+\@.+\..+)" />

					</h:inputText>
					<h:message for="email" />
				</div>
				<div>
					Password:
					<h:inputSecret value="#{userController.password}" required="true"
						requiredMessage="Password is mandatory"
						validatorMessage="The password's first character must be a letter, it must contain at least 4 characters and no more than 15 characters and no characters other than letters, numbers and the underscore may be used"
						id="password">

						<f:validateRegex pattern="(^[a-zA-Z]\w{3,14}$)" />

					</h:inputSecret>
					<h:message for="password" />
				</div>
				<div>
					First name:
					<h:inputText value="#{userController.firstname}" required="true"
						validatorMessage="First name name can only contains letters"
						requiredMessage="First name is mandatory" id="firstname">
						<f:validateRegex pattern="(^[a-zA-Z][a-zA-Z]+$)" />
					</h:inputText>
					<h:message for="firstname" />
				</div>
				<div>
					Last name:
					<h:inputText value="#{userController.lastname}" required="true"
						validatorMessage="Last name name can only contains letters"
						requiredMessage="Last name is mandatory" id="lastname">
						<f:validateRegex pattern="(^[a-zA-Z][a-zA-Z]+$)" />
					</h:inputText>
					<h:message for="lastname" />
				</div>
				<div>
					Phone number:
					<h:inputText value="#{userController.phonenumber}" required="true"
						validatorMessage="Phone number must be between 6 and 15 numbers (Please use 00 instead of + for international prefix)"
						requiredMessage="Phone number is mandatory" id="phonenumber">
						<f:validateRegex pattern="(^[0-9]{6,15})" />
					</h:inputText>
					<h:message for="phonenumber" />
				</div>

				<div>
					<h:commandButton value="Sign Up"
						action="#{userController.createCustomer}" />
						
				</div>
				
			</h:form>
		</div>
	</f:view>
</body>
</html>