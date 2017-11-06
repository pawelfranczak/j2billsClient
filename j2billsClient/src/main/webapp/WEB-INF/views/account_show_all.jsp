<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored = "false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<h4>Konta</h4>
	</div>
	
	<BR>

	<div class="container"
		style="background-color: #C8C8C8; border: 1px solid #D8D8D8;">
		<div class="row">
			<div class="col-sm-2">
				Nazwa</a>
			</div>
			<div class="col-sm-2">Bilans</div>
			<div class="col-sm-7">Opis</div>
			<div class="col-sm-1">#</div>
		</div>
	</div>

	<BR>

	<c:forEach var="account" items="${accounts}">
		<div class="container"
			style="background-color: #f1f1f1; border: 1px solid #D8D8D8;">
			<div class="row">
				<div class="col-sm-2">
					<a href="${account.id}/1" data-toggle="tooltip"	title="Pokaż historię">${account.accountName}</a>
				</div>
				<div class="col-sm-2">${account.balance}</div>
				<div class="col-sm-7">${account.description}</div>
				<div class="col-sm-1">
					<a href="edit/${account.id}">Edytuj</a>
				</div>
			</div>
		</div>
		<BR>
	</c:forEach>

	<%@ include file="footer.jsp" %>


</body>
</html>
