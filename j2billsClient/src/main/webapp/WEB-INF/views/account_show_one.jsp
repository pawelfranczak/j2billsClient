<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored = "false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<html> 
<body>

<%@ include file="menu.jsp" %>

	<div class="container">
	<h4>Konto</h4>
	</div>
	
	<BR>
	
	<div class="container" style="background-color: #C8C8C8;  border: 1px solid #D8D8D8;">
		<div class="row">
		    <div class="col-sm-2">Nazwa</a></div>
		    <div class="col-sm-2">Bilans</div> 
		    <div class="col-sm-7">Opis</div>
		    <div class="col-sm-1">#</div>
	  </div>
	</div>
	
	<BR>

    <div class="container" style="background-color: #f1f1f1;  border: 1px solid #D8D8D8;">
	  <div class="row">
	    <div class="col-sm-2">${account.accountName}</div>
	    <div class="col-sm-2">${account.balance}</div> 
	    <div class="col-sm-7">${account.description}</div>
	    <div class="col-sm-1"><a href="edit/${account.id}">Edytuj</a></div>
	  </div>
	</div>
	
	<BR>
	
	<div class="container">
	<h4>Historia</h4>
	</div>
	
	<BR>
	
	<div class="container" style="background-color: #C8C8C8;  border: 1px solid #D8D8D8;">
		<div class="row">
		    <div class="col-sm-2">Osoba</a></div>
		    <div class="col-sm-2">Wartość</div> 
		    <div class="col-sm-6">Opis</div>
		    <div class="col-sm-2">Data</div>
	  </div>
	</div>
	
	<BR>
	
	<c:forEach var="journal" items="${journals}">
    <div class="container" style="background-color: #f1f1f1;  border: 1px solid #D8D8D8;">
	  <div class="row">
	 	<c:set var="personId" value="${journal.personId}"/>
	    <div class="col-sm-2">${persons[personId].firstName}</div>
	    <div class="col-sm-2">${journal.value}</div> 
	    <div class="col-sm-6">${journal.description}</div>
	    <div class="col-sm-2">${journal.timestamp}</div>
	  </div>
	</div>
	<BR>
	</c:forEach>

	<div class="container">
		<ul class="pagination">
			<c:forEach begin="1" end="${howManySites}" varStatus="loop">
				<li><a href="${loop.index}">${loop.index}</a></li>
			</c:forEach>
		</ul>
	</div>
	
	<%@ include file="footer.jsp" %>

</body>
</html>
