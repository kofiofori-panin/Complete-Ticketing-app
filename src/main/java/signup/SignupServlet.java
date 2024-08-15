package signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static util.PasswordUtils.hashPassword;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/register")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password"); // Changed to password to be hashed
		RequestDispatcher dispatcher = null;
		Connection con = null;

		try {
			// Hash the password
			String password_hash = hashPassword(password);

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","@Qwerty212");
			PreparedStatement pst = con
					.prepareStatement("insert into signup(first_name,last_name,email,username,password_hash) values(?,?,?,?,?)");
			pst.setString(1, first_name);
			pst.setString(2,last_name);
			pst.setString(3, email);
			pst.setString(4, username);
			pst.setString(5, password_hash); // Use the hashed password here

			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("signup.jsp");
			if (rowCount > 0) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
