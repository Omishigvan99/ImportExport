<%@page import="com.model.OrderModel"%>
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
				<div class="container-fluid px-4 py-3">
					<!-- Orders Header -->
					<div class="row mb-4">
						<div class="col">
							<div class="d-flex justify-content-between align-items-center">
								<h2 class="mb-0">Orders Management</h2>
							</div>
						</div>
					</div>

					<!-- Orders Table Card -->
					<div class="card shadow-sm">
						<div class="card-body">
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
										<tr>
											<component:seller_order_row status="<%=status%>"
												date="<%=order.getOrderDate().toString()%>"
												price="<%=order.getPrice()%>"
												product_name="<%=order.getProductName()%>"
												quantity="<%=order.getQuantity()%>"
												cost="<%=order.getCost()%>"
												customer_port_id="<%=order.getConsumerId()%>"
												order_id="<%=order.getOrderId()%>"></component:seller_order_row>
										</tr>
										<%
										}
										}
										%>
										<tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- Update Status Modal -->
					<div class="modal fade" id="updateStatusModal" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Update Order Status</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body">
									<form action="OrderStatusController" method="get">
										<input id="order_id" type="hidden" name="order_id" value="">
										<div class="mb-3">
											<label class="form-label">Order Status</label> <select
												class="form-select" name="status">
												<option value="shipped">Shipped</option>
												<option value="outfordelivery">Out for Delivery</option>
												<option value="delivered">Delivered</option>
											</select>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Update
												Status</button>
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
	
	<meta:meta-scripts/>
	
	<script>
		let updateStatusModal = document.getElementById('updateStatusModal');
		updateStatusModal.addEventListener('show.bs.modal', function(event) {
			let button = event.relatedTarget;
			let orderId = button.getAttribute('data-bs-orderid');
			let modal = this;
			modal.querySelector('#order_id').value = orderId;
		});
	</script>
</body>
</html>
