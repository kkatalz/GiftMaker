package dao.jdbc;

import dao.PossibleItemDao;
import entity.PossibleItem;

import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static dao.jdbc.JdbcItemDao.getBase64ImageFromResultSet;

public class JdbcPossibleItemDao implements PossibleItemDao {

    private final static String ID = "possible_item_id";
    private final static String NAME = "item_name";
    private final static String PRICE = "item_price";
    private final static String DESCRIPTION = "description";
    private final static String AGE = "age";
    private final static String IMAGE = "image";

    private final static String GET_IMAGES_BY_ITEM_ID = "SELECT * FROM Possible_Item_Image WHERE possible_item_id=?";
    private final static String GET_IMAGE_BYTES_BY_ITEM_ID = "SELECT image FROM Possible_Item_Image WHERE possible_item_id=?";
    private final static  String CREATE_IMAGES = "INSERT INTO Possible_Item_Image(possible_item_id, image) VALUES(?, ?)";
    private final static String GET_ALL = "SELECT * FROM Possible_Item";
    private final static String GET_BY_ID = "SELECT * FROM Possible_Item WHERE possible_item_id=?";
    private final static String CREATE = "INSERT INTO Possible_Item (item_name, item_price, description, age) " +
            "VALUES(?, ?, ?, ?)";
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

            while(resultSet.next()) {
                PossibleItem possibleItem = getPossibleItemFromResultSet(resultSet);
                possibleItem.setBase64Image(getBase64ImagesByItemId(possibleItem.getId()));
                possibleItem.setImageBytes(getImageBytesByItemId(possibleItem.getId()));
                possibleItems.add(possibleItem);

            }
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

        possibleItem.ifPresent(value -> value.setBase64Image(getBase64ImagesByItemId(id)));
        possibleItem.ifPresent(value -> value.setImageBytes(getImageBytesByItemId(id)));
        return possibleItem;
    }

    @Override
    public void create(PossibleItem possibleItem) {
        try (PreparedStatement query = connection.prepareStatement(CREATE, Statement.RETURN_GENERATED_KEYS)) {
            query.setString(1, possibleItem.getName());
            query.setBigDecimal(2, possibleItem.getPrice());
            query.setString(3, possibleItem.getDescription());
            query.setInt(4, possibleItem.getAge());

            query.executeUpdate();

            ResultSet keys = query.getGeneratedKeys();
            if (keys.next())
                possibleItem.setId(keys.getInt(1));

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void saveImages(PossibleItem possibleItem) {
        List<Part> parts = possibleItem.getPart();

        try(PreparedStatement statement = connection.prepareStatement(CREATE_IMAGES, Statement.RETURN_GENERATED_KEYS)) {
            for(Part part : parts) {
                statement.setInt(1, possibleItem.getId());

                InputStream fileContent = part.getInputStream();
                byte[] imageBytes = readBytesFromInputStream(fileContent);

                statement.setBytes(2, imageBytes);
                statement.addBatch();
            }
            statement.executeBatch();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<String> getBase64ImagesByItemId(Integer possibleItemId) {
        List<String> images = new ArrayList<>();

        try(PreparedStatement query = connection.prepareStatement(GET_IMAGES_BY_ITEM_ID)) {
            query.setInt(1, possibleItemId);
            ResultSet resultSet = query.executeQuery();
            while (resultSet.next())
                images.add(getBase64ImageFromResultSet(resultSet));

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return images;

    }

    @Override
    public List<byte[]> getImageBytesByItemId(Integer itemId) {
        List<byte[]> bytes = new ArrayList<>();
        try(PreparedStatement statement = connection.prepareStatement(GET_IMAGE_BYTES_BY_ITEM_ID)) {
            statement.setInt(1, itemId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                bytes.add(resultSet.getBytes(IMAGE));

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bytes;
    }

    @Override
    public void update(PossibleItem possibleItem) {
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

    private byte[] readBytesFromInputStream(InputStream inputStream) throws Exception {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[16384];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }

    protected static PossibleItem getPossibleItemFromResultSet(ResultSet resultSet) throws SQLException {
        return new PossibleItem.Builder()
                .setId(resultSet.getInt(ID))
                .setName(resultSet.getString(NAME))
                .setPrice(resultSet.getBigDecimal(PRICE))
                .setDescription(resultSet.getString(DESCRIPTION))
                .setAge(resultSet.getInt(AGE))
                .build();
    }
}
