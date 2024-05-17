package dao.jdbc;

import entity.LikedItem;

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
    private static final String CREATE = "";
    private static final String UPDATE = "";
    private static final String DELETE = "";


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

        } catch (SQLException e) {
            System.out.println("EXCEPTION: " + e);
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
        } catch (SQLException e) {
            System.out.println("EXCEPTION: " + e.getMessage());
            //LOGGER.error("JdbcCategoryDao getById error" + id, e);
            //throw new ServerException(e);
        }
        return likedItem;
    }

    public void create(LikedItem likedItem) {
        // TODO: implement
    }

    public void update(LikedItem likedItem) {
        // TODO: implement
    }

    public void delete(Integer id) {
        // TODO: implement
    }


    @Override
    public void close() {
        // TODO: implement
    }

    protected static LikedItem getLikedItemFromResultSet(ResultSet resultSet) throws SQLException {
        return new LikedItem.Builder()
                .setUser(JdbcUserDao.getUserFromResultSet(resultSet))
                .setItem(JdbcItemDao.getItemFromResultSet(resultSet))
                .build();
    }
}
