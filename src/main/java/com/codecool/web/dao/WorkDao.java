package com.codecool.web.dao;

import com.codecool.web.model.Work;

import java.sql.SQLException;
import java.util.List;

public interface WorkDao {

    List<Work> findWorksByPoet(int id) throws SQLException;


}
