<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.Order"%>
<%@page import="java.util.List, com.model.OrderModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="components" tagdir="/WEB-INF/tags/components"%>
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
<style>
.progress-container {
	position: relative;
	width: 100%;
	margin-top: 40px;
}

.progress-bar-custom {
	position: absolute;
	top: 50%;
	left: 0;
	width: 0;
	height: 6px;
	background-color: lime;
	transition: width 0.5s ease-in-out;
	transform: translateY(-50%);
}

.progress-line {
	position: absolute;
	top: 50%;
	left: 0;
	width: 100%;
	height: 6px;
	background-color: #ddd;
	transform: translateY(-50%);
}

.status-steps {
	display: flex;
	justify-content: space-between;
	position: relative;
	width: 100%;
	padding: 0;
	margin: 0;
}

.status-step {
	position: relative;
	text-align: center;
	width: 25%;
}

.status-circle {
	width: 24px;
	height: 24px;
	border-radius: 50%;
	background-color: #ddd;
	color: white;
	font-size: 14px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	position: absolute;
	top: -20px;
	left: 50%;
	transform: translateX(-50%);
	transition: background-color 0.5s;
}

.active-step {
	background-color: lime;
}

.status-label {
	font-size: 14px;
	margin-top: 30px;
}
</style>
</head>

<body>
	<header>
		<!-- nav bar -->
		<layout:navbar />
		<!-- Update Profile Modal -->
		<modal:edit_profile></modal:edit_profile>
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

					<!-- Orders Table Card -->
					<div class="card shadow-sm">
						<div class="card-body">
							<!-- Orders Header -->
							<div class="row mb-4">
								<div class="col">
									<div class="d-flex justify-content-between align-items-center">
										<h2 class="mb-0">Your orders</h2>
									</div>
								</div>
							</div>
							<!-- Orders Table -->
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Order ID</th>
											<th>Customer ID</th>
											<th>Product Name</th>
											<th>Quantity</th>
											<th>Product price</th>
											<th>Order Cost</th>
											<th>Order Date</th>
											<th>Status</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<%
										@SuppressWarnings("unchecked")
										List<OrderModel> orders = (List<OrderModel>) request.getAttribute("orders");
										if (orders != null) {
											for (OrderModel order : orders) {
												String status = "";

												if (order.isOrderDelivered()) {
											status = "Delivered";
												} else if (order.isOrderOutForDelivery()) {
											status = "Out for Delivery";
												} else if (order.isOrderShipped()) {
											status = "Shipped";
												} else if (order.isOrderPlaced()) {
											status = "Order Placed";
												}
										%>
										<components:consumer_order_row status="<%=status%>"
											date="<%=order.getOrderDate().toString()%>"
											product_name="<%=order.getProductName()%>"
											quantity="<%=order.getQuantity()%>"
											cost="<%=order.getCost()%>"
											customer_port_id="<%=order.getConsumerId()%>"
											order_id="<%=order.getOrderId()%>"
											price="<%=order.getPrice()%>"
											product_id="<%=order.getProductId()%>"></components:consumer_order_row>
										<%
										}
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- Update Status Modal -->
					<modal:order-status />

					<!-- Confirm Modal-->
					<modal:confirm_modal />
					
					<!-- Report Order Modal -->
					<div class="modal fade" id="reportProductModal" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Report Product</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body">
									<form action="ReportProductController" method="get">
										<input id="product_id" type="hidden" name="product_id"
											value="">
										<div class="mb-3">
											<label class="form-label">Issue type</label> <select
												class="form-select" name="issue_type">
												<option value="damaged">Damaged</option>
												<option value="wrong">Wrong</option>
												<option value="delay">Delay</option>
												<option value="not received">Not received</option>
												<option value="missing">Missing</option>
											</select>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Report
												Product</button>
										</div>
									</form>
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
	<meta:meta-scripts/>
	<script>
		function updateProgress(status) {
			const statuses = [ "Order Placed", "Shipped", "Out for Delivery",
					"Delivered" ];

			// Find the index of the current status
			let currentStatusIndex = statuses.indexOf(status);

			if (currentStatusIndex !== -1) {
				let progressPercentage = ((currentStatusIndex + 1) / statuses.length) * 100;
				document.getElementById("progress-bar").style.width = progressPercentage
						+ "%";

				// Remove all active steps first
				for (let i = 0; i < statuses.length; i++) {
					document.getElementById("step-" + (i + 1)).classList
							.remove("active-step");
				}

				// Activate the correct steps
				for (let i = 0; i <= currentStatusIndex; i++) {
					document.getElementById("step-" + (i + 1)).classList
							.add("active-step");
				}
			}
		}

		// get report product modal
		let reportProductModal = document.getElementById('reportProductModal');

		// add event listener to show modal

		reportProductModal.addEventListener('show.bs.modal', function(event) {
			let button = event.relatedTarget;
			let productId = button.getAttribute('data-bs-productid');
			let modal = document.getElementById('reportProductModal');
			let productIdInput = modal
					.querySelector('input[name="product_id"]');
			productIdInput.value = productId;
		});
	</script>
</body>
</html>
