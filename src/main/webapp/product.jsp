<%@page import="com.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>
<%@ taglib prefix="meta" tagdir="/WEB-INF/tags/meta" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Details</title>
    
    <!-- Meta Tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous" />

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <!-- Custom CSS -->
    <link rel="stylesheet" href="./reset.css" />
    <link rel="stylesheet" href="./layout.css" />
</head>

<body>
<header>
    <!-- Navbar -->
    <layout:navbar />
    <!-- Update Profile Modal -->
    <modal:edit_profile />
</header>

<main class="h-100">
    <!-- Floating Sidebar -->
    <layout:consumer-floating-sidebar />

    <div class="d-flex flex-row h-100">
        <!-- Sidebar -->
        <layout:consumer-sidebar />

        <div class="container-fluid flex-grow-1 mb-2 p-3 col-10 col-lg-9 overflow-auto">
            <div class="container mt-5">
                <div class="row row-cols-1 row-cols-md-2 g-4">

                    <!-- Product Details -->
                    <div class="col-md-6">
                        <%
                            ProductModel product = (ProductModel) request.getAttribute("product");
                        %>
                        <h2 class="fw-bold text-primary"><%=product.getProductName()%></h2>
                        <h4 class="text-success fw-semibold">$<%=product.getProductPrice()%></h4>

                        <div class="d-flex align-items-center my-3">
                            <%
                                int quantity = product.getProductQuantity();
                                String message = quantity > 0 ? "In Stock: " + quantity : "Out of Stock";
                            %>
                            <span class="badge bg-<%= quantity > 0 ? "success" : "danger" %> me-2">
                                <%= message %>
                            </span>
                            <span class="text-muted">Seller: <%= product.getSellerId() %></span>
                        </div>

                        <!-- Add to Cart Button -->
                        <button class="btn btn-primary w-100 d-flex align-items-center justify-content-center gap-2"
                                onclick="addToCart(event)"
                                data-bs-productid="<%=product.getProductId()%>"
                                data-bs-productname="<%=product.getProductName()%>"
                                data-bs-quantity="<%=product.getProductQuantity()%>"
                                data-bs-price="<%=product.getProductPrice()%>"
                                data-bs-sellerid="<%=product.getSellerId()%>"
                                data-bs-consumerid="<%=request.getSession().getAttribute("port_id")%>">
                            <i class="bi bi-cart-plus"></i> Add to Cart
                        </button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <!-- Footer Placeholder -->
</footer>

<!-- Meta Scripts -->
<meta:meta-scripts />

<script>
    function getCart() {
        let cart = localStorage.getItem("cart");
        return cart ? JSON.parse(cart) : []; 
    }

    function addToCart(event) {
        let button = event.target.closest("button"); // Ensure button click handling
        let productId = Number(button.getAttribute('data-bs-productid'));
        let productName = button.getAttribute('data-bs-productname');
        let price = Number(button.getAttribute('data-bs-price'));
        let sellerId = button.getAttribute('data-bs-sellerid');
        let consumerId = button.getAttribute('data-bs-consumerid');

        let cart = getCart();
        let existingProductIndex = cart.findIndex(item => item.productId === productId);

        if (existingProductIndex !== -1) {
            cart[existingProductIndex].quantity += 1;
        } else {
            cart.push({
                productId: productId,
                productName: productName,
                quantity: 1,
                price: price,
                sellerId: sellerId,
                consumerId: consumerId
            });
        }

        localStorage.setItem("cart", JSON.stringify(cart));
        console.log("Cart Updated:", cart);

        window.location.href = "consumer_cart.jsp";
    }
</script>

</body>
</html>
