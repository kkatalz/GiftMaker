package dao.jdbc;

import entity.LikedItem;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class JdbcLikedItemDao implements AutoCloseable {

    private static final String GET_ALL = "SELECT * FROM Liked_Item " +
            "INNER JOIN User USING(id_user) " +
            "INNER JOIN Item USING(id_item) " +
            "INNER JOIN Category USING(id_category)";
    private static final String GET_BY_ID = "SELECT * FROM Liked_Item " +
            "INNER JOIN User USING(id_user) " +
            "INNER JOIN Item USING(id_item) " +
            "INNER JOIN Category USING(id_category) " +
            "WHERE id_user=? AND id_item=?";

    private static final String GET_BY_USER_ID = "SELECT * FROM Liked_Item " +
            "INNER JOIN User USING(id_user) " +
            "INNER JOIN Item USING(id_item) " +
            "INNER JOIN Category USING(id_category) " +
            "WHERE id_user=?";
    private static final String CREATE = "INSERT INTO Liked_Item VALUES (?, ?)";
    private static final String DELETE = "DELETE FROM Liked_Item WHERE id_user=? AND id_item=?";


    private Connection connection;
    private boolean connectionShouldBeClosed;

    public JdbcLikedItemDao(Connection connection) {
        this.connection = connection;
        connectionShouldBeClosed = false;
    }


    public JdbcLikedItemDao(Connection connection, boolean connectionShouldBeClosed) {
        this.connection = connection;
        this.connectionShouldBeClosed = connectionShouldBeClosed;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public List<LikedItem> getAll() {
        List<LikedItem> likedItems = new ArrayList<>();
        try (Statement query = connection.createStatement();
             ResultSet resultSet = query.executeQuery(GET_ALL)) {

            while (resultSet.next())
                likedItems.add(getLikedItemFromResultSet(resultSet));

        } catch (SQLException | IOException e ) {
            e.printStackTrace();
            // LOGGER.error("JdbcCategoryDao getAll error", e);
            return new ArrayList<>();
        }
        return likedItems;
    }

    public Optional<LikedItem> getById(Integer idUser, Integer idItem) {
        Optional<LikedItem> likedItem = Optional.empty();

        try (PreparedStatement statement = connection.prepareStatement(GET_BY_ID)) {
            statement.setInt(1, idUser);
            statement.setInt(2, idItem);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                likedItem = Optional.of(getLikedItemFromResultSet(resultSet));
            }
        } catch (SQLException | IOException e ) {
            e.printStackTrace();
            //LOGGER.error("JdbcCategoryDao getById error" + id, e);
            //throw new ServerException(e);
        }
        return likedItem;
    }

    public List<LikedItem> getByUserId(Integer userId) {
        List<LikedItem> likedItems = new ArrayList<>();
        try(PreparedStatement statement = connection.prepareStatement(GET_BY_USER_ID)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                likedItems.add(getLikedItemFromResultSet(resultSet));

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return likedItems;
    }


    public void create(LikedItem likedItem) {
        try(PreparedStatement statement = connection.prepareStatement(CREATE)) {
            statement.setInt(1, likedItem.getUser().getId());
            statement.setInt(2, likedItem.getItem().getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void delete(Integer idUser, Integer idItem) {
        try (PreparedStatement query = connection.prepareStatement(DELETE)) {
            query.setInt(1, idUser);
            query.setInt(2, idItem);

            query.executeUpdate();
        } catch (SQLException e) {
           e.printStackTrace();
            //LOGGER.error("JdbcCategoryDao delete error" + category_number, e);
            //throw new ServerException(e);
        }
    }


    @Override
    public void close() {
        if (connectionShouldBeClosed) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                //LOGGER.error("JdbcCategoryDao close error", e);
                //throw new ServerException(e);
            }
        }
    }

    protected static LikedItem getLikedItemFromResultSet(ResultSet resultSet) throws SQLException, IOException {
        return new LikedItem.Builder()
                .setUser(JdbcUserDao.getUserFromResultSet(resultSet))
                .setItem(JdbcItemDao.getItemFromResultSet(resultSet))
                .build();
    }
}
