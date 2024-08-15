<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Ticket Management - RealistWAYS</title>
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
            <a class="navbar-brand" href="ticket-list.jsp">Ticket Management</a>
            	<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/ticketlist"
					class="nav-link">Tickets</a></li>
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
				<c:if test="${ticket != null}">
					<form action="ticketupdate" method="post"  enctype="multipart/form-data">
				</c:if>
				<c:if test="${ticket == null}">
					<form action="ticketinsert" method="post"  enctype="multipart/form-data">
				</c:if>

				<caption>
					<h2>
						<c:if test="${ticket != null}">
            			Edit Ticket
            		</c:if>
						<c:if test="${ticket == null}">
            			Add New Ticket
            		</c:if>
					</h2>
				</caption>

				<c:if test="${ticket != null}">
					<input type="hidden" name="id" value="<c:out value='${ticket.num}' />" />
				</c:if>
        
        <hr>

    <input type="hidden" name="num" value="${ticket.num}"/>
    <div class="mb-3">
        <label for="userId" class="form-label">User ID:</label>
        <input type="text" placeholder="Enter id of user" class="form-control" id="userId" name="userId" value="${ticket.userId}" required>
    </div>
    <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <input type="text" class="form-control" id="description" name="description" value="${ticket.description}" required>
    </div>
    <div class="mb-3">
        <label for="priority" class="form-label">Priority:</label>
        <select class="form-control" id="priority" name="priority" required>
            <option value="Low" ${ticket.priority == 'Low' ? 'selected' : ''}>Low</option>
            <option value="Medium" ${ticket.priority == 'Medium' ? 'selected' : ''}>Medium</option>
            <option value="High" ${ticket.priority == 'High' ? 'selected' : ''}>High</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="status" class="form-label">Status:</label>
        <select class="form-control" id="status" name="status" required>
            <option value="Open" ${ticket.status == 'Open' ? 'selected' : ''}>Open</option>
            <option value="In Progress" ${ticket.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
            <option value="Closed" ${ticket.status == 'Closed' ? 'selected' : ''}>Closed</option>
        </select>
    </div>
    <div class="mb-3">
		<label for="createdAt" class="form-label">Created At</label> 
		<input type="date" value="<c:out value='${ticket.createdAt}' />" class="form-control" id="CreatedAt" name="createdAt" required="required">
	</div>
	 <div class="mb-3">
                <label for="image" class="form-label">Upload Image:</label>
           <input type="file" class="form-control" id="image" name="image">
     </div>
    
    <div class="mb-3 text-center">
        <button type="submit" class="btn btn-primary"><i class="bi bi-save" title="save"></i> Save</button>
        <a href="<%=request.getContextPath()%>/ticketlist" class="btn btn-secondary"><i class="bi bi-x" title="cancel"></i> Cancel</a>
    </div>


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
