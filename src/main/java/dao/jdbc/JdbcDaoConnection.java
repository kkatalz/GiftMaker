package dao.jdbc;

import dao.DaoConnection;

import java.sql.Connection;
import java.sql.SQLException;

public class JdbcDaoConnection implements DaoConnection {
    //private static final Logger LOGGER = LogManager.getLogger(JdbcDaoConnection.class);

    private final Connection connection;
    private boolean inTransaction = false;

    public JdbcDaoConnection(Connection connection) {
        this.connection = connection;
    }


    public Connection getConnection() {
        return connection;
    }

    @Override
    public void begin() {
        try {
            connection.setAutoCommit(false);
            inTransaction = true;
        } catch (SQLException e) {
            e.printStackTrace();
           /* LOGGER.error("JdbcDaoConnection begin error", e);
            throw new ServerException(e);*/
        }
    }

    @Override
    public void commit() {
        try {
            connection.commit();
            inTransaction = false;
        } catch (SQLException e) {
            e.printStackTrace();
           /* LOGGER.error("JdbcDaoConnection commit error", e);
            throw new ServerException(e);*/
        }
    }

    @Override
    public void rollback() {
        try {
            connection.rollback();
            inTransaction = false;
        } catch (SQLException e) {
            e.printStackTrace();
           /* LOGGER.error("JdbcDaoConnection rollback error", e);
            throw new ServerException(e);*/
        }
    }

    @Override
    public void close() {
        if(inTransaction)
            rollback();
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            /*LOGGER.error("JdbcDaoConnection close error", e);
            throw new ServerException(e);*/
        }
    }
}