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

function calcsum(checkboxElem) {
  var checkBoxValue = checkboxElem.value
  var sum = document.getElementById("sum");
  var newsum = 0
  if (checkboxElem.checked) {
    newsum = +parseFloat(sum.textContent) + +checkBoxValue;
  } else {
    newsum = +parseFloat(sum.textContent) - +checkBoxValue;    
  }
  newsum = newsum.toFixed(2)
  document.getElementById("sum").textContent = newsum 
}

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
			<div class="col-sm-1">#</div>
			<div class="col-sm-2">
				Nazwa</a>
			</div>
			<div class="col-sm-2">Bilans</div>
			<div class="col-sm-6">Opis</div>
			<div class="col-sm-1">#</div>
		</div>
	</div>

	<BR>

	<c:forEach var="account" items="${accounts}">
		<div class="container"
			style="background-color: #f1f1f1; border: 1px solid #D8D8D8;">
			<div class="row">
				<div class="col-sm-1"><input type="checkbox" name=${account.id} value=${account.balance} onchange="calcsum(this)"><br></div>
				<div class="col-sm-2">
					<a href="${account.id}/1" data-toggle="tooltip"	title="Pokaż historię">${account.accountName}</a>
				</div>
				<div class="col-sm-2">${account.balance}</div>
				<div class="col-sm-6">${account.description}</div>
				<div class="col-sm-1">
					<a href="edit/${account.id}">Edytuj</a>
				</div>
			</div>
		</div>
		<BR>
	</c:forEach>

	<%@ include file="footer.jsp" %>

	<div class="container"
		style="background-color: #C8C8C8; border: 1px solid #D8D8D8;">
		<div class="row">
			<div class="col-sm-12" id="sum">0</div>
		</div>
	</div>


</body>
</html>
