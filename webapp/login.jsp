<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>RealistWAYS</title>
		<link rel="icon" href="images/hawk.png" type="image/x-icon" />

		<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="CSS/stylesLS.css">
		<link rel="stylesheet" href="alert/dist/sweetalert.css">

		<style>
			body {
				background: url("images/handshake.jpg") no-repeat center center fixed;
				background-size: cover;
			}

			.navbar-brand {
				flex-grow: 1;
			}

			.navbar-nav {
				margin-left: auto;
			}

			.form-box {
				background: rgba(255, 255, 255, 0.9);
				padding: 20px;
				border-radius: 10px;
			}

			.container {
				display: flex;
				justify-content: center;
				align-items: center;
				min-height: 100vh;
			}
		</style>

	</head>

	<body>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	
		<button id="backToTop">
			<i class='bx bx-arrow-from-bottom'></i>
		</button>

		<nav class="navbar navbar-expand-lg navbar-light bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="login.jsp"><img src="images/hawk.png" height="30" width="50" alt="logo"
						title="logo"> RealistWAYS.</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="login.jsp">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="services.jsp">Services</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="contacts.jsp">Contacts</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container">
			<div class="col-lg-6 form-box">
				<div class="top text-center">
					<header class="h3"><img src="images/hawk.png" alt="logo" title="logo" height="30px" width="50px"></header>
					<header class="h3">Login</header>
				</div>
				<div class="login-container" id="login" style="display: block;">
					<form action="login" method="post" id="loginForm">
						<div class="input-wrapper mb-3">
							<i class='bx bx-user'></i>
							<input type="text" class="input-field form-control" name="username" placeholder="Username"
								autocomplete="given-name" required>
						</div>
						<div class="input-wrapper mb-3">
							<i class='bx bx-lock-alt'></i>
							<input type="password" class="input-field form-control" name="password" placeholder="Password" minlength="8"
								maxlength="20" id="password" required>
							<i class="bi bi-eye" title="view" id="togglePassword"></i>
						</div>
						<div class="form-check d-flex justify-content-between mb-3">
							<label><input type="checkbox" id="register-check"> Remember me</label>
							<a href="forgotpass.jsp">Forgot Password?</a>
						</div>
						<button type="submit" class="btn btn-primary w-100">Login</button>
					</form>
					<div class="already mt-3 text-center">
						<p>Don't have an account?
							<a href="signup.jsp">Sign Up</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="container about-section">
			<div class="col-lg-8 form-box">
				<div class="about-content text-center">
					<header class="h3">About Us</header>
					<p>RealistWAYS is a leading ticketing company dedicated to addressing customer complaints and
						ensuring their resolution in a timely manner. Our mission is to provide exceptional customer
						service and support, making sure every concern is handled with the utmost care and
						professionalism. Join us and experience a seamless complaint resolution process.</p>
				</div>
			</div>
		</div>

		  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="JS/passwordL.js"></script>
    <script src="JS/backtotop.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if (status === "failed") {
            swal("Oops...", "Invalid Username or Password", "error");
        }
    </script>
	

		<footer>
			<div class="footer-bottom">
				<p>
					Copyright &copy; 2024 RealistWAYS. Designed by
					<span>Norbus Technology (NT)</span>
				</p>
			</div>
		</footer>
	</body>

	</html>