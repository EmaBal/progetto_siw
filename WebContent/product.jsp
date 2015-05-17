<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Product</title>
</head>
<body>

<f:view>
<h2>Details</h2>
<div>Name :<h1>${consultaListinoController.product.name}</h1></div>
<div>Code: ${consultaListinoController.product.code}</div>
<div>Price: ${consultaListinoController.product.price}</div>
<div>Description: ${consultaListinoController.product.description}</div>
</f:view>
</body>
</html>