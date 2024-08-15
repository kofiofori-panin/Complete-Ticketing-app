package util;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import dao.TicketDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ticket;

@WebServlet("/ticket-image")
public class IdFrontViewImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 private TicketDAO ticketDAO;

	    @Override
		public void init() {
	        ticketDAO = new TicketDAO();
	    }


    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         try {
         String num = request.getParameter("num");
         Ticket existingTicket = ticketDAO.getTicketById(Integer.parseInt(num));

         byte[] decodedString = existingTicket.getImage();

         ByteArrayInputStream iStream = new ByteArrayInputStream(decodedString);
         int length = decodedString.length;
         response.setContentType("image/jpeg, image/jpg, image/png");
         response.setContentLength(length);
         ServletOutputStream oStream = response.getOutputStream();
         byte [] buffer = new byte[1024];
         int len;
         while ((len = iStream.read(buffer)) != -1) {
            oStream.write(buffer, 0, len);
         }
         iStream.close();
         oStream.flush();
         oStream.close();
    }catch(NullPointerException e) {
    	}
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
}
