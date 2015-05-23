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
				<h1>Providers :</h1>
				<table>
					<tr>
						<th>Name</th>
						<th>Phone number</th>
						<th>VAT</th>
						<th>email</th>
						<th>address</th>
					</tr>
					<c:forEach var="currentProvider"
						items="#{userController.providerController.providers}">
						<tr>
							<td><h:commandLink
									action="#{userController.providerController.selezionaProviderDaMostrare(currentProvider)}"
									value="#{currentProvider.name}">
								</h:commandLink></td>
							<td>${currentProvider.phonenumber}</td>
							<td>${currentProvider.vatin}</td>
							<td>${currentProvider.email}</td>
							<td><c:choose>
									<c:when	test="${currentProvider.address==null}">
										<h:commandLink value="Set address"
											action="#{userController.providerController.openNewProviderAddressPage(currentProvider)}" />
									</c:when>
									<c:otherwise>
									<h:commandLink value="#{currentProvider.address.street} #{currentProvider.address.city} #{currentProvider.address.country}"
											action="#{userController.providerController.openNewProviderAddressPage(currentProvider)}" />
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</table>
			</h:form>
		</div>
	</f:view>
</body>
</html>