<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management - RealistWAYS</title>
<link rel="icon" href="images/hawk.png" type="image/x-icon">

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet" href="CSS/styles1.css">

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
      <br><br><br>
      <a href="dash.jsp">Home</a>
      <a href="user-list.jsp">User Management</a>
      <a href="ticket-list.jsp">Ticket Management</a>
    </div>

<div id="content">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="navbar-brand logo">
            <img src="images/hawk.png" height="30" width="50" alt="logo" title="logo">
        </div>
        <div class="container-fluid">
            <a class="navbar-brand" href="user.jsp">User Management</a>
            	<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/userlist"
					class="nav-link">Users</a></li>
			</ul>
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
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
                                aria-expanded="false">
                            Profile
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
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
    
	<br>
	
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="userupdate" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="userinsert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
            		</c:if>
						<c:if test="${user == null}">
            			Add New User
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>
                <hr>
				<fieldset class="form-group">
					<label>Username</label> <input type="text"
						value="<c:out value='${user.username}' />" class="form-control"
						name="username" placeholder="enter username" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Password</label> <input type="password"
						value="<c:out value='${user.passwordHash}' />" class="form-control"
						name="password" placeholder="enter your password" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Email</label> <input type="email"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" placeholder="enter your email" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Full Name</label> <input type="text"
						value="<c:out value='${user.fullName}' />" class="form-control"
						name="fullName" placeholder="enter your full name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Created At</label> <input type="date"
						value="<c:out value='${user.createdAt}' />" class="form-control"
						name="createdAt" required="required">
				</fieldset>
				<br>

				<button type="submit" class="btn btn-success">Save</button>
				
			</div>
		</div>
	</div>
	
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
        
<script src="JS/backtotop.js"></script>
    
    <script src="JS/sidebar.js"></script>

</body>
</html>
