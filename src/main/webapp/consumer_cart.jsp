<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<%@ taglib prefix="modal" tagdir="/WEB-INF/tags/modal"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />

        <!-- icons link -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        />
        <!-- reset css -->
        <link rel="stylesheet" href="./reset.css" />
        <link rel="stylesheet" href="./layout.css" />
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
            <layout:consumer-floating-sidebar/>
            <!-- sidebar -->
            <div class="d-flex flex-row h-100">
                <layout:consumer-sidebar />
                <div
                    class="container-fluid flex-grow-1 mb-2 p-2 col-10 col-lg-9 overflow-auto"
                >
                    <div class="container-fluid py-4">
                        <!-- Cart Summary -->
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Cart Summary</h5>
                                        <div id="cartItems" class="row">
                                            <!-- Cart items will be dynamically loaded here -->
                                        </div>
                                        <div
                                            class="d-flex justify-content-between align-items-center mt-4"
                                        >
                                            <h6>
                                                Total: ₹<span id="cartTotal"
                                                    >0</span
                                                >
                                            </h6>
                                            
                                        </div>
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
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>

        <!-- layout event handler script -->
        <script src="./layout.js"></script>
        <script src="./consumer_cart.js"></script>

    </body>
</html>
