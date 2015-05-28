<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Product</title>
</head>
<body>

	<f:view>
		<div class="container">
			<div>Name: ${userController.productController.product.name}</div>
			<h2>Details</h2>
			<div>Code: ${userController.productController.product.code}</div>
			<div>Price: ${userController.productController.product.price}</div>
			<div>Description:
				${userController.productController.product.description}</div>
				<div>Quantity: ${userController.productController.product.quantity}</div>
		</div>
	</f:view>
	<c:if
		test="${userController.user!=null && userController.userprivilege.equals('it.uniroma3.model.Administrator')}">
		<c:choose>
			<c:when
				test="${userController.productController.product.providers != null}">
				<table>
					<tr>
						<th>Name</th>
						<th>email</th>
					</tr>

					<c:forEach var="currentProvider"
						items="#{userController.productController.product.providers}">
						<tr>
							<td><h:commandLink
									action="#{userController.providerController.selectProvider(currentProvider)}"
									value="#{currentProvider.name}">
								</h:commandLink></td>
							<td>${currentProvider.email}</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
		there are no providers distributing this product!
	</c:otherwise>
		</c:choose>
	</c:if>

</body>
</html>