package com.codecool.web.servlet;

import com.codecool.web.dao.WorkDao;
import com.codecool.web.dao.database.DatabaseWorkDao;
import com.codecool.web.model.User;
import com.codecool.web.model.Work;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


@WebServlet("/protected/workservlet")
public class WorkServlet extends AbstractServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection c = getConnection(req.getServletContext())) {
            WorkDao db = new DatabaseWorkDao(c);
            int id = ((User)req.getSession().getAttribute("user")).getId();
            List<Work> works = db.findWorksByPoet(id);

            resp.setContentType("application/json");
            sendMessage(resp, HttpServletResponse.SC_OK, works);

        } catch (SQLException e) {
            handleSqlError(resp, e);
        }
    }
}
