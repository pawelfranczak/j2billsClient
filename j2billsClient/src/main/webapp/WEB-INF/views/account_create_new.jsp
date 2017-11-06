<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored = "false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>

<html> 
<body>

<%@ include file="menu.jsp" %>

	<div class="container">
	<h4>Utwórz nowe konto</h4>
	</div>

	<BR>
	
	<div class="container">
		<form:form method="POST" modelAttribute="account">
			<div class="input-group">
		    <span class="input-group-addon">Nazwa Konta</span>
		    <form:input path="accountName" id="accountName" type="text" class="form-control" placeholder="Jak konto ma się nazywać?"/>
		 	</div>
		 	<BR>
		 	<div class="input-group">
		    <span class="input-group-addon">Opis</span>
		    <form:input path="description" id="description" type="text" class="form-control" placeholder="Krótki opis?"/>
		 	</div>
		 	<BR>
		 	<div class="input-group">
		    <span class="input-group-addon">Bilans otwarcia</span>
		    <form:input path="balance" step="0.01" id="balance" type="number" class="form-control" placeholder="Ile jest na nim pieniędzy?"/>
		 	</div>
		 	<BR>
		 	<button type="submit" class="btn btn-default">Submit</button>
		</form:form>
	</div>

<%@ include file="footer.jsp" %>


</body>
</html>
