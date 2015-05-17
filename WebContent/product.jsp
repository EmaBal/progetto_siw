<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Product</title>
</head>
<body>
<div>${consultaListinoController.id}</div>
<f:view>
<h1>${consultaListinoController.productController.product.name}</h1>
<h2>Details</h2>
<div>Code: ${consultaListinoController.productController.product.code}</div>
<div>Price: ${consultaListinoController.productController.product.price}</div>
<div>Description: ${consultaListinoController.productController.product.description}</div>
</f:view>
</body>
</html>