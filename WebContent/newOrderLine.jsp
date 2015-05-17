<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>New Order Line</title>
</head>
<body>
<f:view>
<h:form>
    <div>Nome: ${prodottoSelezionato.name}</div>
    <div>Quantita': <h:inputText value="#{orderLineControllerBean.quantity}" 
                     required="true"
                     requiredMessage="Quantity is mandatory"
                     converterMessage="Quantity must be a number"
                     id="quantity"/> <h:message for="quantity" />
	</div>
	<div>
		<h:commandButton value="Inserisci altro prodotto"  action="#{orderLineControllerBean.createOrderLine}"/>
	</div>
	<div>
		<h:commandButton value="Termina inserimento"  action="#{orderLineControllerBean.createOrder}"/>
	</div> 
</h:form>
</f:view>
</body>
</html>