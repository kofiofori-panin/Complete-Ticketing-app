<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RealistWAYS - Services</title>
    <link rel="icon" href="images/hawk.png" type="image/x-icon" />
   
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

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
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}
.services-section {
    background: rgba(255, 255, 255, 0.9);
    padding: 20px;
    border-radius: 10px;
    margin-top: 50px;
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
                        <a class="nav-link" href="login.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="services.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contacts.jsp">Contacts</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container services-section">
        <div class="col-lg-8">
            <div class="services-content text-center">
                <header class="h3">Our Services</header>
                <p>At RealistWAYS, we offer a comprehensive range of services to ensure your complaints and issues are resolved efficiently and effectively. Our dedicated team is here to assist you with:</p>
                <ul class="list-group">
                    <li class="list-group-item">Customer Support</li>
                    <li class="list-group-item">Complaint Resolution</li>
                    <li class="list-group-item">Technical Assistance</li>
                    <li class="list-group-item">Service Inquiries</li>
                    <li class="list-group-item">Feedback Handling</li>
                </ul>
                <p>We strive to provide the highest quality service to meet your needs and ensure your satisfaction. Contact us today to learn more about how we can help you.</p>
            </div>
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
