<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<!-- <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" -->
<!-- 	type="text/css" /> -->
<!-- <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> -->
<title>Products</title>
</head>
<body>

	<f:view>
		<div class="container">

			<h:form>
				Products for provider ${userController.providerController.provider.name}:

				<%-- 					<f:selectItems --%>
				<%-- 						value="#{userController.providerController.productController.products}" --%>
				<%-- 						var="currentProduct" itemValue="#{currentProduct.id}" --%>
				<%-- 						itemLabel="#{currentProduct.name}" /> --%>


				<table>
					<tr>
						<th>Name</th>
						<th>description</th>
						<th>Price</th>
					</tr>
					<c:forEach var="currentProduct"
						items="#{userController.providerController.productController.products}">
						<tr>
							<td><h:selectBooleanCheckbox
									value="#{userController.providerController.productController.selectedProducts[currentProduct]}" />
								<h:outputLabel  value="#{currentProduct.name}" /></td>

							<td><h:commandLink
									action="#{userController.productController.selezionaProdottoDaMostrare(currentProduct)}"
									value="#{currentProduct.description}">
								</h:commandLink></td>
							<td>${currentProduct.price}</td>
						</tr>
					</c:forEach>

				</table>
					<h:commandButton
					action="#{userController.providerController.saveProviderProducts}"
					value="save">
				</h:commandButton>
			</h:form>
		</div>
	</f:view>
</body>