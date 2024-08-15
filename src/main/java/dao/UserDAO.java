package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import model.User;
import util.DbUtil;

public class UserDAO {

    public List<User> listAllUsers() {
        List<User> listUser = new ArrayList<>();
        String sql = "SELECT * FROM users";

        try (Connection connection = DbUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String passwordHash = resultSet.getString("passwordHash");
                String email = resultSet.getString("email");
                String fullName = resultSet.getString("fullName");

                LocalDateTime createdAt = null;
                if (resultSet.getTimestamp("created_at") != null) {
                    createdAt = resultSet.getTimestamp("created_at").toLocalDateTime();
                }

                LocalDateTime updatedAt = null;
                if (resultSet.getTimestamp("updated_at") != null) {
                    updatedAt = resultSet.getTimestamp("updated_at").toLocalDateTime();
                }

                User user = new User(id, username, passwordHash, email, fullName, createdAt, updatedAt);
                listUser.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listUser;
    }

    public void insertUser(User user) {
        String sql = "INSERT INTO users (username, passwordHash, email, fullName, created_at) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DbUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPasswordHash());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getFullName());
            statement.setTimestamp(5, java.sql.Timestamp.valueOf(user.getCreatedAt()));

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE users SET username = ?, passwordHash = ?, email = ?, fullName = ?, updated_at = ? WHERE id = ?";

        try (Connection connection = DbUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPasswordHash());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getFullName());
            statement.setTimestamp(5, java.sql.Timestamp.valueOf(user.getUpdatedAt()));
            statement.setInt(6, user.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id = ?";

        try (Connection connection = DbUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection connection = DbUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String username = resultSet.getString("username");
                    String passwordHash = resultSet.getString("passwordHash");
                    String email = resultSet.getString("email");
                    String fullName = resultSet.getString("fullName");

                    LocalDateTime createdAt = null;
                    if (resultSet.getTimestamp("created_at") != null) {
                        createdAt = resultSet.getTimestamp("created_at").toLocalDateTime();
                    }

                    LocalDateTime updatedAt = null;
                    if (resultSet.getTimestamp("updated_at") != null) {
                        updatedAt = resultSet.getTimestamp("updated_at").toLocalDateTime();
                    }

                    user = new User(id, username, passwordHash, email, fullName, createdAt, updatedAt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
