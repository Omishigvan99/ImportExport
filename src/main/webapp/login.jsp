<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login Form</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />

<style>
body {
	background:
		url("https://i.pinimg.com/736x/fc/ec/61/fcec6176b3525d4d5c2d4b850f31c3a7.jpg")
		no-repeat center center/cover;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
}

/* Overlay to lighten the background */
body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(106, 105, 105, 0.5);
	z-index: 1;
}

.login-container {
	background-color: white;
	padding: 2rem;
	border-radius: 12px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 350px;
	text-align: center;
	position: relative;
	z-index: 2;
}
</style>
</head>
<body>
	<div class="login-container">
		<h3>Welcome Back!!</h3>
		<p>Enter your credentials to access your account.</p>
		<form id="loginForm" method="post" action="LoginController">
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="portId" name="port_id"
					placeholder="Enter Port ID" required /> <label for="portId">Enter
					Port ID</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password" name="password"
					placeholder="Enter Password" required /> <label for="password">Enter
					Password</label>
			</div>
			<div class="form-floating mb-3">
				<select class="form-select" id="role" name="role">
					<option selected value="consumer">consumer</option>
					<option value="seller">seller</option>
				</select> <label for="role">Select Role</label>
			</div>
			<button type="submit" id="redirectLink" class="btn btn-primary w-100">Log
				In</button>
			<a href="register.jsp" class="link">Not a user? register here</a>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
