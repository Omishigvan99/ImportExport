<%@page import="com.model.ReportedProductModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/components"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>
<%@ taglib prefix="meta" tagdir="/WEB-INF/tags/meta" %>

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
		<modal:edit_profile/>
	</header>
	<main class="h-100">
		<!-- floating sidebar -->
		<layout:consumer-floating-sidebar />

		<!-- sidebar -->
		<div class="d-flex flex-row h-100">
			<layout:consumer-sidebar />
			<div
				class="container-fluid flex-grow-1 mb-2 p-2 col-10 col-lg-9 overflow-auto">
				<div class="container-fluid px-4 py-3">
					<!-- Reported Products Header -->
					<div class="row mb-4">
						<div class="col">
							<div class="d-flex justify-content-between align-items-center">
								<h2 class="mb-0">Reported Products</h2>
							</div>
						</div>
					</div>

					<!-- Reports Cards -->
					<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
						<%
						@SuppressWarnings("unchecked")
						List<ReportedProductModel> reportedProductList = (List<ReportedProductModel>) request
								.getAttribute("reportedProductList");

						if (reportedProductList != null) {
							for (ReportedProductModel reportedProduct : reportedProductList) {
						%>

						<component:consumer_reported_product_card
							issue_type="<%=reportedProduct.getIssueType()%>"
							report_id="<%=reportedProduct.getReportId()%>"
							date="<%=reportedProduct.getDate().toString()%>"
							product_name="<%=reportedProduct.getProductName()%>" />
						<%
						}
						}
						%>
					</div>

					<!-- View Report Modal -->
					<modal:report_detail_modal />
				</div>
			</div>
		</div>
	</main>
	<footer>
		<!-- place footer here -->
	</footer>

    <meta:meta-scripts/>

	<script>
		let viewReportModal = document.getElementById('viewReportModal');

		viewReportModal
				.addEventListener(
						'show.bs.modal',
						function(event) {
							let button = event.relatedTarget;
							let reportId = button.getAttribute('data-bs-reportid');
							let productName = button.getAttribute('data-bs-productname');
							let issueType = button.getAttribute('data-bs-issuetype');
							let reportDate = button.getAttribute('data-bs-date');

							viewReportModal.querySelector('#report_id').textContent = reportId;
							viewReportModal.querySelector('#product_name').textContent = productName;
							viewReportModal.querySelector('#issue_type').textContent = issueType;
							viewReportModal.querySelector('#report_date').textContent = reportDate;
							viewReportModal.querySelector('#removeReportedProductLink').href = "RemoveReportedProductController?report_id="
									+ reportId;
						});
	</script>
</body>
</html>
