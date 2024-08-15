<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions - RealistWAYS</title>
    <link rel="icon" href="images/hawk.png" type="image/x-icon" />
   
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="CSS/stylesLS.css">
    
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
        .content-box {
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
    <button id="backToTop">
        <i class='bx bx-arrow-from-bottom'></i>
    </button>

    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="login.jsp"><img src="images/hawk.png" height="30" width="50" alt="logo" title="logo"> RealistWAYS.</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
        <div class="col-lg-8 content-box">
            <div class="text-center">
                <header class="h3">Terms & Conditions</header>
            </div>
            <section>
                <p>Welcome to RealistWAYS. By using our services, you agree to the following terms and conditions. Please read them carefully.</p>

                <h4>1. Acceptance of Terms</h4>
                <p>By accessing and using our services, you accept and agree to be bound by the terms and provisions of this agreement. In addition, when using these particular services, you shall be subject to any posted guidelines or rules applicable to such services.</p>

                <h4>2. Provision of Services</h4>
                <p>RealistWAYS is continually innovating in order to provide the best possible experience for its users. You acknowledge and agree that the form and nature of the services which RealistWAYS provides may change from time to time without prior notice to you.</p>

                <h4>3. Use of Services</h4>
                <p>You agree to use the services only for purposes that are permitted by (a) the Terms and (b) any applicable law, regulation, or generally accepted practices or guidelines in the relevant jurisdictions.</p>

                <h4>4. User Responsibilities</h4>
                <p>You agree to use the service in compliance with all applicable local, state, national, and international laws and regulations. You are solely responsible for any conduct related to the use of the service.</p>

                <h4>5. Privacy Policy</h4>
                <p>Your use of the service is also subject to RealistWAYS's Privacy Policy. By using our services, you agree to the terms and conditions of our Privacy Policy.</p>

                <h4>6. Termination</h4>
                <p>RealistWAYS may at any time, terminate its legal agreement with you if you have breached any provision of the Terms, if RealistWAYS is required to do so by law, or if RealistWAYS ceases to provide services.</p>

                <h4>7. Limitation of Liability</h4>
                <p>RealistWAYS shall not be liable for any direct, indirect, incidental, special, consequential, or exemplary damages.</p>

                <h4>8. Changes to the Terms</h4>
                <p>RealistWAYS may make changes to the Terms from time to time. When these changes are made, RealistWAYS will make a new copy of the Terms available on our website.</p>
                
                <p>For more information or if you have any questions about our Terms and Conditions, please <a href="contacts.jsp">Contact</a> us.<br><br>Back to <a href="signup.jsp">SignUp</a></p>
            </section>
        </div>
    </div>

    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="JS/backtotop.js"></script>

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
