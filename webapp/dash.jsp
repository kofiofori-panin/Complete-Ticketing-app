<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
    if(session.getAttribute("username")==null){
    	response.sendRedirect("login.jsp");
    }


%>    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link
      href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery JS -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <title>Home - RealistWAYS</title>
    <link rel="icon" href="images/hawk.png" type="image/x-icon" >
    <link rel="stylesheet" href="CSS/dashboard.css" >
  </head>

  <body>
    <button id="backToTop" class="btn btn-primary">
      <i class="bi bi-arrow-up"></i>
    </button>

    <button id="toggleSidebar" class="btn btn-primary">
      <i class="bi bi-list"></i>
    </button>

    <div id="sidebar">
      <a class="navbar-brand" href="dash.jsp"><img src="images/hawk.png" height="30" width="50" alt="logo" title="logo"> RealistWAYS.</a>
      <br><br><br><br> 
      <a><p style="font-size: 28px; font-family: cursive; color: yellow; font-style: italic; transition: none;">Hello, <%=session.getAttribute("username")  %> </p></a><br>
      <a href="dash.jsp">Dashboard</a>
      <a href="user-list.jsp">User Management</a>
      <a href="ticket-list.jsp">Tickets Management</a>
    </div>

    <div id="content">
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="navbar-brand logo" href="#">
          <img src="images/hawk.png" height="30" width="50" alt="logo" title="logo" />
        </div>
        <div class="container-fluid">
          <a class="navbar-brand" href="dash.jsp">Home</a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="profileDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  Profile
                </a>
                <ul
                  class="dropdown-menu dropdown-menu-end"
                  aria-labelledby="profileDropdown"
                >
                  <li>
                    <a class="dropdown-item" href="#">Account Settings</a>
                  </li>
                  
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li>
                    <a class="dropdown-item" href="logout">Log Out</a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="container mt-4">
        <h2>Dashboard</h2>
        <div class="row">
          <div class="col-md-4 mb-4">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Ticket Status</h5>
                <canvas id="pieChart"></canvas>
              </div>
            </div>
          </div>
          
          <div class="col-md-6 mb-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Tickets Created</h5>
                <canvas id="barChart"></canvas>
              </div>
            
            </div>
          </div>
          <div class="row">
          <div class="col-md-10 mb-4">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Number of Users</h5>
                <canvas id="areaChart"></canvas>
              </div>
            </div>
            </div>
          </div>
        </div>
      </div>
      <br /><br />
      <footer>
        <div class="footer-bottom">
          <p>
            Copyright &copy; 2024 RealistWAYS. Designed by
            <span>Norbus Technology (NT)</span>
          </p>
        </div>
      </footer>
    </div>

    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="JS/charts.js"></script>
    <script src="JS/backtotop.js"></script>
  </body>
</html>
