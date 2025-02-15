<%@page import="com.model.ProductModel"%>
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
		<modal:edit_profile/>
	</header>
	<main class="h-100">
		<!-- floating sidebar -->
		<layout:seller-floating-sidebar />

		<!-- sidebar -->
		<div class="d-flex flex-row h-100">
			<layout:seller-sidebar />
			<div
				class="container-fluid flex-grow-1 mb-2 p-2 col-10 col-lg-9 overflow-auto">
				<div class="container mt-4">
					<!-- Search and Add Product -->
					<div class="d-flex mb-3">
						<!-- <div class="input-group me-2" style="flex: 1">
							<input type="text" class="form-control"
								placeholder="Search products" />
							<button class="btn btn-outline-secondary">
								<i class="fa-solid fa-search"></i>
							</button>
						</div> -->

						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#addProductModal"
							data-bs-sellerid="<%=request.getAttribute("sellerId")%>">
							<i class="fa-solid fa-plus"></i>Add Product
						</button>
						<!-- <button class="btn btn-primary"><i class="fa-solid fa-plus"></i> Add Product</button> -->
					</div>

					<!-- Product Table -->
					<div class="card">
						<div class="card-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Product ID</th>
										<th>Name</th>
										<th>Quantity</th>
										<th>Price</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<%
									@SuppressWarnings("unchecked")
									List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");
									if (products != null) {
										for (ProductModel product : products) {
									%>
									<component:product_row price="<%=product.getProductPrice()%>"
										product_id="<%=product.getProductId()%>"
										product_name="<%=product.getProductName()%>"
										quantity="<%=product.getProductQuantity()%>" />
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>
					</div>

					<!-- Add Product Modal -->
					<modal:add_product />

					<!-- Edit Product Modal -->
					<modal:edit_product />
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

	<script>
		let addProductModal = document.getElementById('addProductModal');

		addProductModal.addEventListener('show.bs.modal', function(event) {
			let button = event.relatedTarget;
			let sellerId = button.getAttribute('data-bs-sellerid');
			let modal = document.getElementById('addProductModal');
			let sellerIdInput = modal.querySelector('input[name="sellerId"]');
			sellerIdInput.value = sellerId;
		});

		let editProductModal = document.getElementById('editProductModal');

		editProductModal.addEventListener('show.bs.modal',
				function(event) {
					let button = event.relatedTarget;
					let productId = button.getAttribute('data-bs-productid');
					let modal = document.getElementById('editProductModal');
					let productIdInput = modal
							.querySelector('input[name="productId"]');
					productIdInput.value = productId;

					// auto fill the form with the product details
					let productName = button
							.getAttribute('data-bs-productname');

					let productNameInput = modal
							.querySelector('input[name="pname"]');

					let productQuantity = button
							.getAttribute('data-bs-quantity');

					let productQuantityInput = modal
							.querySelector('input[name="pquantity"]');

					let productPrice = button.getAttribute('data-bs-price');

					let productPriceInput = modal
							.querySelector('input[name="pprice"]');
					productNameInput.value = productName;
					productQuantityInput.value = productQuantity;
					productPriceInput.value = productPrice;

				});
	</script>
</body>
</html>
