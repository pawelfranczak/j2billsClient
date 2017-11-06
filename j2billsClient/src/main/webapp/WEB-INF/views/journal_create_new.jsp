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
	<h4>Utwórz nowy wpis w dzienniku</h4>
	</div>

	
	<div class="container">
		<form:form method="POST" modelAttribute="journal">
		 	<BR>
		 	<div class="input-group">
		    <span class="input-group-addon">Opis</span>
		    <form:input path="description" id="description" type="text" class="form-control" placeholder="Krótki opis"/>
		 	</div>
		 	<BR>
		 	<div class="input-group">
		    <span class="input-group-addon">Wartość</span>
		    <form:input path="value" id="value" type="number" class="form-control" placeholder="Wartość"/>
		 	</div>
		 	<BR>
			<form:select path="accountId" class="form-control">
			<form:option value="0" label="Wybierz konto"></form:option>
			<c:forEach var="account" items="${accounts}">
				<form:option path="accountId" name="accountId" value="${account.id}">${account.accountName}</form:option>
			</c:forEach>
			</form:select>
			
			<BR>Osoba dokonująca wpisu: 
			<c:forEach var="person" items="${persons}">
				<label class="radio-inline"> <form:radiobutton path="personId" name="person" value="${person.id}"/>${person.firstName} ${person.lastName}</label>
			</c:forEach>
			<BR><BR><button type="submit" class="btn btn-default">Submit</button>
		</form:form>
	</div>
	
	<BR><BR>
	
	<div class="container">
		<c:if test="${not empty succes}" >
		<div class="alert alert-success">
  			<strong>${succes}</strong>
		</div>
		</c:if>
		<c:if test="${not empty error}" >
		<div class="alert alert-danger">
	  		<strong>${error}</strong>
		</div>
			
		</c:if>
	</div>
	
<%@ include file="footer.jsp" %>


</body>
</html>
