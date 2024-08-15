package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.Ticket;

public class TicketDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/mydb?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "@Qwerty212";

    private static final String INSERT_TICKETS_SQL = "INSERT INTO tickets (user_id, description, priority, status, created_at, image) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_TICKET_BY_ID = "SELECT num, user_id, description, priority, status, created_at, updated_at, image = ? FROM tickets WHERE num = ?";
    private static final String SELECT_ALL_TICKETS = "SELECT * FROM tickets";
    private static final String DELETE_TICKETS_SQL = "DELETE FROM tickets WHERE num = ?";
    private static final String UPDATE_TICKETS_SQL = "UPDATE tickets SET user_id = ?, description = ?, priority = ?, status = ?, updated_at = ?, image = ? WHERE num = ?";

    public TicketDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertTicket(Ticket ticket) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TICKETS_SQL)) {
            preparedStatement.setInt(1, ticket.getUserId());
            preparedStatement.setString(2, ticket.getDescription());
            preparedStatement.setString(3, ticket.getPriority());
            preparedStatement.setString(4, ticket.getStatus());
            preparedStatement.setTimestamp(5, ticket.getCreatedAt());
            preparedStatement.setBytes(6, ticket.getImage());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Ticket getTicketById(int num) {
        Ticket ticket = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TICKET_BY_ID)) {
            preparedStatement.setInt(1, num);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                String description = resultSet.getString("description");
                String priority = resultSet.getString("priority");
                String status = resultSet.getString("status");
                Timestamp createdAt = resultSet.getTimestamp("created_at");
                Timestamp updatedAt = resultSet.getTimestamp("updated_at");
                byte[] image = resultSet.getBytes("image");
                ticket = new Ticket(num, userId, description, priority, status, createdAt, updatedAt, image);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ticket;
    }

    public List<Ticket> listAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TICKETS)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int num = resultSet.getInt("num");
                int userId = resultSet.getInt("user_id");
                String description = resultSet.getString("description");
                String priority = resultSet.getString("priority");
                String status = resultSet.getString("status");
                Timestamp createdAt = resultSet.getTimestamp("created_at");
                Timestamp updatedAt = resultSet.getTimestamp("updated_at");
                tickets.add(new Ticket(num, userId, description, priority, status, createdAt, updatedAt));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tickets;
    }

    public boolean updateTicket(Ticket ticket) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TICKETS_SQL)) {
            preparedStatement.setInt(1, ticket.getUserId());
            preparedStatement.setString(2, ticket.getDescription());
            preparedStatement.setString(3, ticket.getPriority());
            preparedStatement.setString(4, ticket.getStatus());
            preparedStatement.setTimestamp(5, ticket.getUpdatedAt());
            preparedStatement.setInt(6, ticket.getNum());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdated;
    }

    public boolean deleteTicket(int num) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TICKETS_SQL)) {
            preparedStatement.setInt(1, num);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}