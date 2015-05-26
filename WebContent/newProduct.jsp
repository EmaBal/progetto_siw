<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>New Product</title>
</head>
<body>
<f:view>
<h:form>
    <div>Name: <h:inputText value="#{userController.productController.name}" 
                     required="true"
                     requiredMessage="Name is mandatory"
                     id="name"/> <h:message for="name" />
	</div>
    <div>Code: <h:inputText value="#{userController.productController.code}" 
                     required="true"
                     requiredMessage="Code is mandatory"
                     id="code"/> <h:message for="code" />
	</div>
    <div>Price: <h:inputText value="#{userController.productController.price}" 
                     required="true"
                     requiredMessage="Price is mandatory"
                     converterMessage="Price must be a number"
                     id="price"/> <h:message for="price" />
	</div>
    <div>Description: <h:inputTextarea value="#{userController.productController.description}" 
    				required="false" 
    				cols="20" 
    				rows="5" /> 
                     
	</div>
	<div>Providers that distribute this product:
	<table>
					<tr>
						<th>Name</th>
						<th>VAT</th>
						<th>email</th>
					</tr>
					<c:forEach var="currentProvider"
						items="#{userController.providerController.providers}">
						<tr>
							<td><h:selectBooleanCheckbox
									value="#{userController.providerController.selectedProviders[currentProvider]}" />
								<h:outputLabel  value="#{currentProvider.name}" /></td>

							<td><h:commandLink
									action="#{userController.providerController.selectProvider(currentProvider)}"
									value="#{currentProvider.vatin}">
								</h:commandLink></td>
							<td>${currentProvider.email}</td>
						</tr>
					</c:forEach>

				</table>
	
	</div>
	<div>
		<h:commandButton value="Submit"  action="#{userController.productController.createProduct}"/>
	</div>
	<h:commandLink action="#{userController.productController.listProducts}"
						value="List all Products" />
</h:form>
</f:view>
</body>
</html>