package com.codecool.web.dao.database;

import com.codecool.web.dao.UserDao;
import com.codecool.web.dao.WorkDao;
import com.codecool.web.model.User;
import com.codecool.web.model.Work;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseWorkDao extends AbstractDao implements WorkDao {

    public DatabaseWorkDao(Connection connection) {
        super(connection);
    }

    public List<Work> findWorksByPoet(int id) throws SQLException {
        String sql = "SELECT id, title, content, written FROM works WHERE poet_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeQuery();
            ResultSet rs = ps.executeQuery();
            List<Work> works = new ArrayList<>();
            while (rs.next()) {
                works.add(fetchWork(rs));
            }
            return works;
        }
    }

    private Work fetchWork(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String title = resultSet.getString("title");
        String content = resultSet.getString("content");
        String written = resultSet.getString("written");
        return new Work(id, title, content, written);
    }
}
