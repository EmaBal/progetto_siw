<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Product</title>
</head>
<body>

<f:view>
<div>Name :${consultaListinoController.product.name}</div>
<h2>Details</h2>
<div>Code: ${consultaListinoController.product.code}</div>
<div>Price: ${consultaListinoController.product.price}</div>
<div>Description: ${consultaListinoController.product.description}</div>
</f:view>
</body>
</html>