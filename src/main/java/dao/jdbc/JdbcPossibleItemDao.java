package dao.jdbc;

import dao.PossibleItemDao;
import entity.PossibleItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class JdbcPossibleItemDao implements PossibleItemDao {

    private final static String ID = "possible_item_id";
    private final static String NAME = "item_name";
    private final static String PRICE = "item_price";
    private final static String DESCRIPTION = "description";
    private final static String AGE = "age";
    private final static String IMAGE = "image";
    private final static String GET_ALL = "SELECT * FROM Possible_Item";
    private final static String GET_BY_ID = "SELECT * FROM Possible_Item WHERE possible_item_id=?";
    private final static String CREATE = "INSERT INTO Possible_Item (item_name, item_price, description, age, image) " +
            "VALUES(?, ?, ?, ?, ?)";
    private final static String UPDATE = ""; // TODO: is this needed?
    private final static String DELETE = "DELETE FROM Possible_Item WHERE possible_item_id=?";


    private Connection connection;
    private boolean connectionShouldBeClosed;

    public JdbcPossibleItemDao(Connection connection) {
        this.connection = connection;
        connectionShouldBeClosed = false;
    }


    public JdbcPossibleItemDao(Connection connection, boolean connectionShouldBeClosed) {
        this.connection = connection;
        this.connectionShouldBeClosed = connectionShouldBeClosed;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<PossibleItem> getAll() {
        List<PossibleItem> possibleItems = new ArrayList<>();
        try(Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ALL)) {

            while(resultSet.next())
                possibleItems.add(getPossibleItemFromResultSet(resultSet));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return possibleItems;
    }

    @Override
    public Optional<PossibleItem> getById(Integer id) {
        Optional<PossibleItem> possibleItem = Optional.empty();

        try (PreparedStatement statement = connection.prepareStatement(GET_BY_ID)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
                possibleItem = Optional.of(getPossibleItemFromResultSet(resultSet));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return possibleItem;
    }

    @Override
    public void create(PossibleItem possibleItemDao) {
        // TODO: implement
    }

    @Override
    public void update(PossibleItem possibleItemDao) {
        // TODO: implement
    }

    @Override
    public void delete(Integer id) {
        try (PreparedStatement statement = connection.prepareStatement(DELETE)) {
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void close() {
        if (connectionShouldBeClosed) {
            try {
                connection.close();
            } catch (SQLException e) {
                //LOGGER.error("JdbcItemDao close error", e);
                //throw new ServerException(e);
                e.printStackTrace();
            }
        }
    }

    protected static PossibleItem getPossibleItemFromResultSet(ResultSet resultSet) throws SQLException {
        // TODO: finish and add to the PossibleItem image
        return new PossibleItem.Builder()
                .setId(resultSet.getInt(ID))
                .setName(resultSet.getString(NAME))
                .setPrice(resultSet.getBigDecimal(PRICE))
                .setDescription(resultSet.getString(DESCRIPTION))
                .setAge(resultSet.getInt(AGE))
                .build();
    }
}
