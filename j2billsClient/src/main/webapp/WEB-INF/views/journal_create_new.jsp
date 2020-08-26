<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>j2bills - Dashboard</title>

<!-- Custom fonts for this template-->
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/sb-admin-2.min.css" />"
	rel="stylesheet">


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="menu.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Utwórz nowy wpis w
							dzienniku</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>

					<div class="container">
						<form:form method="POST" modelAttribute="journal">
							<BR>
							<div class="input-group">
								<span class="input-group-addon">Opis</span>
								<form:input path="description" id="description" type="text"
									class="form-control" placeholder="Krótki opis" />
							</div>
							<BR>
							<div class="input-group">
								<span class="input-group-addon">Wartość</span>
								<form:input path="value" id="value" type="number" step="0.01"
									class="form-control" placeholder="Wartość" />
							</div>
							<BR>
							<form:select path="accountId" class="form-control">
								<form:option value="0" label="Wybierz konto"></form:option>
								<c:forEach var="account" items="${accounts}">
									<form:option path="accountId" name="accountId"
										value="${account.id}">${account.accountName}</form:option>
								</c:forEach>
							</form:select>

							<BR>Osoba dokonująca wpisu: 
							<c:forEach var="person" items="${persons}">
								<label class="radio-inline"> <form:radiobutton
										path="personId" name="person" value="${person.id}" />${person.firstName}
									${person.lastName}
								</label>
							</c:forEach>
							<BR>
							<BR>
							<button type="submit" class="btn btn-default">Submit</button>
						</form:form>
					</div>
					
					<div class="container">
						<c:if test="${not empty succes}">
							<div class="alert alert-success">
								<strong>${succes}</strong>
							</div>
						</c:if>
						<c:if test="${not empty error}">
							<div class="alert alert-danger">
								<strong>${error}</strong>
							</div>

						</c:if>
					</div>

				</div>
				<!-- End of Main Content -->

				<%@ include file="footer.jsp"%>

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">Ã</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value="/resources/js/sb-admin-2.min.js" />"></script>

	<!-- Page level plugins -->
	<script src="<c:url value="/resources/vendor/chart.js/Chart.min.js" />"></script>

	<!-- Page level custom scripts -->
	<script src="<c:url value="/resources/js/demo/chart-area-demo.js" />"></script>
	<script src="<c:url value="/resources/js/demo/chart-pie-demo.js" />"></script>
</body>

</html>
