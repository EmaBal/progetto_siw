
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
				<h1>Providers :</h1>
				<table>
					<tr>
						<th>Name</th>
						<th>VAT</th>
					</tr>
					<c:forEach var="currentProduct"
						items="#{userController.providerController.providers}">
						<tr>
							<td><h:commandLink
									action="#{userController.productController.selezionaProdottoDaMostrare(currentProduct)}"
									value="#{currentProduct.name}">
								</h:commandLink></td>
							<td>${currentProduct.price}</td>
						</tr>
					</c:forEach>
				</table>
			</h:form>
		</div>
	</f:view>
</body>
</html>