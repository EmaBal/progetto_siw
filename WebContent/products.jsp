<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Products</title>
</head>
<body>

	<f:view>
		<div class="container">

			<h:form>
				<h1>Products :</h1>
				<table>
					<tr>
						<th>Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Add to cart</th>
					</tr>
					<c:forEach var="currentProduct"
						items="#{userController.productController.products}">
						<tr>
							<td><h:commandLink
									action="#{userController.openProductDetails(currentProduct)}"
									value="#{currentProduct.name}">
								</h:commandLink></td>
							<td>${currentProduct.price}</td>
							<td><h:inputText
									value="#{userController.orderController.selectedProduct[currentProduct]}"
									converterMessage="Quantity must be a number" id="quantity"
									styleClass="form-control" />
								<div class="warningform">
									<h:message for="price" />
								</div></td>
							<td><h:commandButton styleClass="btn btn-default"
									value="Add to cart" ></h:commandButton>
							</td>
						</tr>
					</c:forEach>

				</table>
			</h:form>
		</div>
	</f:view>
</body>
</html>