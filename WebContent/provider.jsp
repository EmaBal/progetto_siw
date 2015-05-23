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
			<div>Company Name:
				${userController.providerController.provider.name}</div>
			<h2>Details</h2>
			<div>Phone number:
				${userController.providerController.provider.phonenumber}</div>
			<div>Email: ${userController.providerController.provider.email}</div>
			<div>VAT code:
				${userController.providerController.provider.vatin}</div>
			<h:form>
				<c:choose>
					<c:when
						test="${userController.providerController.provider.address==null}">
						<h:commandLink value="Set address"
							action="#{userController.providerController.openNewProviderAddressPage}" />
						<br>
					</c:when>
					<c:otherwise>
						<h:commandLink value="Change address"
							action="#{userController.providerController.openNewProviderAddressPage}"
							styleClass="list-group-item-text" />
						<br>
						<div>Street :
							${userController.providerController.provider.address.street}</div>
						<div>City:
							${userController.providerController.provider.address.city}</div>
						<div>State:
							${userController.providerController.provider.address.state}</div>
						<div>Zip code:
							${userController.providerController.provider.address.zipcode}</div>
						<div>Country :
							${userController.providerController.provider.address.country}</div>
					</c:otherwise>
				</c:choose>
				<h1>Products :</h1>
				<c:choose>
					<c:when
						test="${userController.providerController.provider.products != null}">
						<table>
							<tr>
								<th>Name</th>
								<th>Price</th>
							</tr>

							<c:forEach var="currentProduct"
								items="#{userController.providerController.provider.products}">
								<tr>
									<td><h:commandLink
											action="#{userController.productController.selezionaProdottoDaMostrare(currentProduct)}"
											value="#{currentProduct.name}">
										</h:commandLink></td>
									<td>${currentProduct.price}</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<br>This provider has no products<br>
					</c:otherwise>
				</c:choose>
			</h:form>


		</div>

	</f:view>
</body>
</html>