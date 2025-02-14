<%@page import="com.model.ReportedProductModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/components"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>

<!DOCTYPE html>
<html lang="en">
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
		<layout:consumer-floating-sidebar />
		<!-- sidebar -->
		<div class="d-flex flex-row h-100">
			<layout:seller-sidebar />
			<div
				class="container-fluid flex-grow-1 mb-2 p-2 col-10 col-lg-9 overflow-auto">
				<div class="container-fluid px-4 py-3">
					<!-- Reported Products Header -->
					<div class="card">
						<div class="card-body">
							<div class="row mb-4">
								<div class="col">
									<div class="d-flex justify-content-between align-items-center">
										<h2 class="mb-0">Reported Products</h2>
										<div class="d-flex gap-2">
											<select class="form-select" style="width: 200px">
												<option>All Issues</option>
												<option>Quality Issues</option>
												<option>Delivery Issues</option>
												<option>Other Issues</option>
											</select>
										</div>
									</div>
								</div>
							</div>

							<!-- Reports Table -->
							<div class="table-responsive">
								<table class="table table-hover table-striped">
									<thead>
										<tr>
											<th>Report ID</th>
											<th>Customer ID</th>
											<th>Product ID</th>
											<th>Product Name</th>
											<th>Issue Type</th>
											<th>Report Date</th>
											<th>Solution</th>
										</tr>
									</thead>
									<tbody>
										<%
										@SuppressWarnings("unchecked")
										List<ReportedProductModel> reportedProductList = (List<ReportedProductModel>) request
												.getAttribute("reportedProductList");
										if (reportedProductList != null) {
											for (ReportedProductModel reportedProduct : reportedProductList) {
										%>
										<component:seller_reported_product_row
											solution="<%=reportedProduct.getSolution()%>"
											issue_type="<%=reportedProduct.getIssueType()%>"
											consumer_id="<%=reportedProduct.getConsumerPortId()%>"
											report_date="<%=reportedProduct.getDate().toString()%>"
											report_id="<%=reportedProduct.getReportId()%>"
											product_name="<%=reportedProduct.getProductName()%>"
											product_id="<%=reportedProduct.getProductId()%>"></component:seller_reported_product_row>

										<%
										}
										}
										%>
									</tbody>
								</table>
							</div>
						</div>

						<!-- Pagination -->
						<div
							class="container-fluid d-flex mt-4 justify-content-between align-items-center">
							<div>
								Showing <span class="fw-bold">1</span> to <span class="fw-bold">3</span>
								of <span class="fw-bold">9</span> entries
							</div>
							<nav aria-label="Page navigation">
								<ul class="pagination mb-0">
									<li class="page-item disabled"><a class="page-link"
										href="#">Previous</a></li>
									<li class="page-item active"><a class="page-link" href="#">1</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">2</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">3</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
							</nav>
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
