package web;

import static util.PasswordUtils.hashPassword;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import dao.TicketDAO;
import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Ticket;
import model.User;

@WebServlet("/")
@MultipartConfig
public class Servlets extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketDAO ticketDAO;
    private UserDAO userDAO;


    @Override
	public void init() {
        ticketDAO = new TicketDAO();
        userDAO = new UserDAO();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/ticketnew":
                    showNewForm(request, response);
                    break;
                case "/ticketinsert":
                    insertTicket(request, response);
                    break;
                case "/ticketdelete":
                    deleteTicket(request, response);
                    break;
                case "/ticketedit":
                    TicketshowEditForm(request, response);
                    break;
                case "/ticketupdate":
                    updateTicket(request, response);
                    break;
                case "/ticketlist":
                	listTicket(request, response);
                    break;
                case "/usernew":
                    UsershowNewForm(request, response);
                    break;
                case "/userinsert":
                    insertUser(request, response);
                    break;
                case "/userdelete":
                    deleteUser(request, response);
                    break;
                case "/useredit":
                    UsershowEditForm(request, response);
                    break;
                case "/userupdate":
                    updateUser(request, response);
                    break;
                case "/userlist":
                    listUser(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listTicket(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Ticket> listTicket = ticketDAO.listAllTickets();
        request.setAttribute("listTicket", listTicket);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ticket-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ticket-form.jsp");
        dispatcher.forward(request, response);
    }

    private void TicketshowEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String numParam = request.getParameter("num");
	    int num = 0;
	    if (numParam != null && !numParam.isEmpty()) {
	        num = Integer.parseInt(numParam);
	    }
        Ticket existingTicket = ticketDAO.getTicketById(num);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ticket-form.jsp");
        request.setAttribute("ticket", existingTicket);
        dispatcher.forward(request, response);
    }

    private void insertTicket(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

    	  String userIdParam = request.getParameter("userId");
    	    int userId = 0;
    	    if (userIdParam != null && !userIdParam.isEmpty()) {
    	        userId = Integer.parseInt(userIdParam);
    	    }
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");
        String status = request.getParameter("status");
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        InputStream inputStream = null;
        byte[] fimage = null;

        Part frontPhoto = request.getPart("image");

        if (frontPhoto != null && frontPhoto.getSize() > 0) {

            inputStream = frontPhoto.getInputStream();

            fimage = toByteArray(inputStream);

        }



        Ticket newTicket = new Ticket(userId, description, priority, status, createdAt, null,fimage);
        ticketDAO.insertTicket(newTicket);
        response.sendRedirect(request.getContextPath() + "/ticketlist");
    }

    private void updateTicket(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
    	String numParam = request.getParameter("num");
	    int num = 0;
	    if (numParam != null && !numParam.isEmpty()) {
	        num = Integer.parseInt(numParam);
	    }
	    String userIdParam = request.getParameter("userId");
	    int userId = 0;
	    if (userIdParam != null && !userIdParam.isEmpty()) {
	        userId = Integer.parseInt(userIdParam);
	    }
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");
        String status = request.getParameter("status");
        Timestamp updatedAt = new Timestamp(System.currentTimeMillis());

        InputStream inputStream = null;
        byte[] fimage = null;

        Part frontPhoto = request.getPart("image");

        if (frontPhoto != null && frontPhoto.getSize() > 0) {

            inputStream = frontPhoto.getInputStream();

            fimage = toByteArray(inputStream);

        }

        Ticket ticket = new Ticket(num, userId, description, priority, status, null, updatedAt,fimage);
        ticketDAO.updateTicket(ticket);
        response.sendRedirect(request.getContextPath() + "/ticketlist");
    }

    private void deleteTicket(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    	 String numParam = request.getParameter("num");
    	    int num = 0;
    	    if (numParam != null && !numParam.isEmpty()) {
    	        num = Integer.parseInt(numParam);
    	    }
        ticketDAO.deleteTicket(num);
        response.sendRedirect(request.getContextPath() + "/ticketlist");
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> listUser = userDAO.listAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
        dispatcher.forward(request, response);
    }

    private void UsershowNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request, response);
    }

    private void UsershowEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.getUserById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Get the plaintext password
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        LocalDateTime createdAt = LocalDateTime.now();

        // Hash the password
        String hashedPassword = hashPassword(password);

        // Create a User object with the hashed password
        User newUser = new User(username, hashedPassword, email, fullName, createdAt);
        userDAO.insertUser(newUser);
        response.sendRedirect(request.getContextPath() + "/userlist");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Get the plaintext password
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        LocalDateTime updatedAt = LocalDateTime.now();

        // Hash the password if it's not empty
        String hashedPassword = password.isEmpty() ? userDAO.getUserById(id).getPasswordHash() : hashPassword(password);

        User user = new User(id, username, hashedPassword, email, fullName, null, updatedAt);
        userDAO.updateUser(user);
        response.sendRedirect(request.getContextPath() + "/userlist");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        response.sendRedirect(request.getContextPath() + "/userlist");
    }

    public static byte[] toByteArray(InputStream in) throws IOException
    {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        while ((len = in.read(buffer)) != -1)
        {
            os.write(buffer, 0, len);
        }
        return os.toByteArray();
    }

}