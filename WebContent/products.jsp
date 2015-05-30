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
						<th>Q</th>
					</tr>
					<c:forEach var="currentProduct"
						items="#{userController.productController.products}">
						<tr>
							<td><h:commandLink
									action="#{userController.openProductDetails(currentProduct)}"
									value="#{currentProduct.name}">
								</h:commandLink></td>
							<td><c:choose>
									<c:when
										test="${userController.orderController.orderlines[currentProduct] != null}">
										<c:out value="${(userController.orderController.orderlines[currentProduct].quantity) * currentProduct.price}"></c:out>
										<%-- <c:if test="#{!userController.orderController.isOrderLine(currentProduct)}"> ${currentProduct.price} </c:if> --%>
									</c:when>
									<c:otherwise>${currentProduct.price}</c:otherwise>
								</c:choose></td>

							<td><h:inputText
									value="#{userController.productController.cart[currentProduct]}"
									converterMessage="Quantity must be a number" id="quantity"
									styleClass="form-control" converter="javax.faces.Integer"></h:inputText>
								<div class="warningform">
									<h:message for="quantity" />
								</div></td>
							<td><h:commandButton
									action="#{userController.addProductToCart(currentProduct)}"
									styleClass="btn btn-default" value="Add to cart"></h:commandButton>
							</td>

							<td>${userController.productController.cart[currentProduct]}</td>
						</tr>
					</c:forEach>

				</table>
				<h:commandButton action="#{userController.createOrder}"
					styleClass="btn btn-default" value="Create order"></h:commandButton>
			</h:form>
		</div>
	</f:view>
</body>
</html>