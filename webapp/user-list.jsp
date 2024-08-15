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
            <a class="navbar-brand" href="user-list.jsp">User Management</a>
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

    <div class="row">
        <div class="container">
            <h3 class="text-center">List of Users</h3>
            <hr>
            <div class="container text-left">
                <a href="<%=request.getContextPath()%>/usernew" class="btn btn-success"><i class="bi bi-people"></i> Add
                    New User</a>
            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${listUser}">
                    <tr>
                        <td><c:out value="${user.id}"/></td>
                        <td><c:out value="${user.username}"/></td>
                        <td><c:out value="${user.email}"/></td>
                        <td><c:out value="${user.fullName}"/></td>
                        <td><c:out value="${user.createdAt}"/></td>
                        <td><c:out value="${user.updatedAt}"/></td>
                        <td><a href="useredit?id=<c:out value='${user.id}'/>"><button class="btn btn-primary"><i class="bi bi-pencil-square" title="edit"></i></button></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="userdelete?id=<c:out value='${user.id}'/>"><button class="btn btn-danger"><i class="bi bi-trash" title="delete"></i></button></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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
