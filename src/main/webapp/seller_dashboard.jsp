<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>

<!DOCTYPE html>
<jsp lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />

<!-- icons link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<!-- reset css -->
<link rel="stylesheet" href="./reset.css" />
<link rel="stylesheet" href="./layout.css" />
</head>

<body>
	<header>
		<!-- nav bar -->
		<layout:navbar />
		<!-- Update Profile Modal -->
		<modal:edit_profile />
	</header>
	<main class="h-100">
		<!-- floating sidebar -->
		<layout:seller-floating-sidebar />

		<!-- sidebar -->
		<div class="d-flex flex-row h-100">
			<layout:seller-sidebar />
			<div
				class="container-fluid flex-grow-1 mb-2 p-2 col-10 col-lg-9 overflow-auto">
				<div class="container-fluid py-4">
					<!-- Header Section -->
					<div class="row mb-4">
						<div class="col-12">
							<h2 class="mb-3">Sales Analysis</h2>
							<div class="card">
								<div class="card-body">
									<form id="reportForm" action="SalesReportController"
										method="get" class="row g-3">
										<div class="col-md-3">
											<label class="form-label">Report Type</label> <select
												class="form-select" id="reportType" name="report_type">
												<option value="monthly">Monthly</option>
												<option value="annual">Annual</option>
											</select>
										</div>
										<div class="col-md-3">
											<label class="form-label">Year</label> <select
												class="form-select" id="year" name="year">
												<option value="2025">2025</option>
												<option value="2024">2024</option>
												<option value="2023">2023</option>
											</select>
										</div>
										<div class="col-md-3" id="monthContainer">
											<label class="form-label">Month</label> <select
												class="form-select" id="month" name="month">
												<option value="1">January</option>
												<option value="2">February</option>
												<option value="3">March</option>
												<option value="4">April</option>
												<option value="5">May</option>
												<option value="6">June</option>
												<option value="7">July</option>
												<option value="8">August</option>
												<option value="9">September</option>
												<option value="10">October</option>
												<option value="11">November</option>
												<option value="12">December</option>
											</select>
										</div>
										<div class="col-md-3 d-flex align-items-end">
											<button type="submit" class="btn btn-primary">
												Generate Report</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Stats Cards -->
					<div class="row mb-4">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title text-muted mb-2">Total Sales</h5>
									<%
									double totalSales = request.getAttribute("totalsales") !=null ? (double) request.getAttribute("totalsales") : 0;
									double totalOrders = request.getAttribute("totalorders") !=null ? (double) request.getAttribute("totalorders") : 0;
									%>
									<h2 class="mb-0">
										₹<%=totalSales %></h2>
									<p class="text-success mt-2 mb-0"></p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title text-muted mb-2">Total Orders</h5>
									<h2 class="mb-0"><%=totalOrders%></h2>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<!-- place footer here -->
	</footer>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

	<!-- layout event handler script -->
	<script src="./layout.js"></script>
</body>
</html>