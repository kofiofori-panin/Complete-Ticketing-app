package web;

import static util.PasswordUtils.hashPassword; // Import the hashPassword method

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/userold")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
	public void init() {
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
            case "/usernew":
                showNewForm(request, response);
                break;
            case "/userinsert":
                insertUser(request, response);
                break;
            case "/userdelete":
                deleteUser(request, response);
                break;
            case "/useredit":
                showEditForm(request, response);
                break;
            case "/userupdate":
                updateUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> listUser = userDAO.listAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
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
}

