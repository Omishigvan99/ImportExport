<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/components"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>

<%@ page import="com.model.ProductModel, java.util.List"%>


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
		<!-- navbar -->
		<layout:navbar />

		<!-- Update Profile Modal -->
		<modal:edit_profile></modal:edit_profile>
	</header>
	<main class="h-100">
		<!-- floating sidebar -->
		<layout:consumer-floating-sidebar />

		<div class="d-flex flex-row h-100">
			<layout:consumer-sidebar />
			<div
				class="container-fluid flex-grow-1 mb-2 p-2 col-10 col-lg-9 overflow-auto">
				<!-- search component for the products -->
				<div class="container-fluid">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search..."
							aria-label="Search" />
						<button class="btn btn-secondary" type="button">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>

				<div class="container-fluid mt-3">
					<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
						<!-- product component -->
						<%
						@SuppressWarnings("unchecked")
						List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");

						if (products != null) {
							for (ProductModel product : products) {
						%>
						<div class="">
							<component:product p_id="<%=product.getProductId()%>"
								p_name="<%=product.getProductName()%>"
								p_price="<%=product.getProductPrice()%>"></component:product>
						</div>
						<%
						}
						}
						%>

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
