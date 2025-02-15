<%@page import="com.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>
<%@ page import="com.model.ProductModel"%>

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


		<div class="d-flex flex-row h-100">
			<!-- sidebar -->
			<layout:consumer-sidebar />
			<div
				class="container-fluid flex-grow-1 mb-2 p-2 col-10 col-lg-9 overflow-auto">
				<div class="container mt-5">
					<div class="row row-cols-1 row-cols-md-2 g-4">
						<!-- Product Image -->
						<div class="col-md-6 text-center">
							<img src="https://placehold.co/600x400/png"
								class="img-fluid rounded shadow" alt="Product Image" />
						</div>

						<!-- Product Details -->
						<div class="col-md-6">
							<%
							ProductModel product = (ProductModel) request.getAttribute("product");
							%>
							<h2 class="fw-bold"><%=product.getProductName()%></h2>
							<h4 class="text-success">
								$<%=product.getProductPrice()%></h4>

							<!-- Quantity Selector -->
							<div class="d-flex align-items-center my-3">
								<% 
									int quantity = product.getProductQuantity();
									String message = quantity > 0 ? "In Stock : "+quantity : "Out of Stock";
								%>
								<span class="me-2"><%=message%></span>
							</div>

							<!-- Add to Cart Button -->
							<button class="btn btn-primary w-100" onclick="addToCart()"
								data-bs-productid="<%=product.getProductId()%>"
								data-bs-productname="<%=product.getProductName()%>"
								data-bs-quantity="<%=product.getProductQuantity()%>"
								data-bs-price="<%=product.getProductPrice()%>"
								data-bs-sellerid="<%=product.getSellerId()%>"
								data-bs-consumerid=<%=request.getSession().getAttribute("port_id")%>>🛒
								Add to Cart</button>
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

	<script>
	function getCart() {
	    let cart = localStorage.getItem("cart");
	    return cart ? JSON.parse(cart) : [];  // Ensure it returns an array instead of null
	}
		
		function addToCart() {
			let button = event.target;
			let productId = Number(button.getAttribute('data-bs-productid'));
			let productName = button.getAttribute('data-bs-productname');
			let price = Number(button.getAttribute('data-bs-price'));
			let sellerId = button.getAttribute('data-bs-sellerid');
			let consumerId = button.getAttribute('data-bs-consumerid');

			let product = {
				productId : productId,
				productName : productName,
				quantity : 1,
				price : price,
				sellerId : sellerId,
				consumerId: consumerId
			};
			
		    let cart = getCart();

		    // Check if the product already exists in the cart
		    const existingProduct = cart.find(item => item.id === product.id);

		    if (existingProduct) {
		        // If the product exists, update its quantity
		        existingProduct.quantity += 1;
		    } else {
		        // If the product does not exist, add it to the cart with quantity 1
		        cart.push(product);
		    }

		    // Save the updated cart to local storage
		    localStorage.setItem("cart", JSON.stringify(cart));


		}
	</script>
</body>
</html>
