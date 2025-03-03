<%@ tag language="java" pageEncoding="UTF-8"%>

<div class="floating-sidebar" id="floating-sidebar">
	<div class="d-flex flex-column">
		<div class="p-2 side-nav-item d-flex justify-content-end">
			<button id="sidebar-close" class="btn text-white">
				<i class="bi bi-x-lg"></i>
			</button>
		</div>
		<div class="p-2 side-nav-item">
			<a href="./seller_dashboard.jsp" class="text-white btn"><i class="fa-solid fa-gauge"></i> Dashboard</a>
		</div>
		<div class="p-2 side-nav-item">
			<a href="OrdersShowController" class="text-white btn"><i class="fa-solid fa-bag-shopping"></i> Orders</a>
		</div>
		<div class="p-2 side-nav-item">
			<a href="ReportedProductsShowController" class="text-white btn"><i class="fa-solid fa-triangle-exclamation"></i> Reported
				Products</a>
		</div>
		<div class="p-2 side-nav-item">
			<a href="ProductsShowController" class="text-white btn"><i class="fa-brands fa-product-hunt"></i> Product
				Management</a>
		</div>
	</div>
</div>