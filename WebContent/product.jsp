<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
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
			<div>Description: ${userController.productController.product.description}</div>
		</div>
	</f:view>
</body>
</html>