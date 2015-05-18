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
	    <div>Email: <h:inputText value="#{userController.email}" 
			required="true"
            requiredMessage="Email is mandatory"
            id="email"/> <h:message for="email" />
		</div>
		<div>Password: <h:inputText value="#{userController.password}" 
            required="true"
            requiredMessage="Password is mandatory"
            id="password"/> <h:message for="password" />
		</div>
		<div>First name: <h:inputText value="#{userController.firstname}" 
            required="true"
            requiredMessage="First name is mandatory"
            id="firstname"/> <h:message for="firstname" />
		</div>
		<div>Last name: <h:inputText value="#{userController.lastname}" 
            required="true"
            requiredMessage="Last name is mandatory"
            id="lastname"/> <h:message for="lastname" />
		</div>
		<div>Phone number: <h:inputText value="#{userController.phonenumber}" 
            required="true"
            requiredMessage="Phone number is mandatory"
            id="phonenumber"/> <h:message for="phonenumber" />
		</div>
		
		<div>
			<h:commandButton value="Sign Up"  action="#{userController.createCustomer}"/>
		</h:form></div>
		
	</f:view>
</body>
</html>