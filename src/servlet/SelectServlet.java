package servlet;

import bean.Record;
import bean.User;
import dao.RecordDAO;
import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SelectServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        HttpSession session = request.getSession(false);
        List<User> users = new UserDAO().getUsers(userId);
        request.getSession().setAttribute("users", users);
        //弃用方法
        /* List<Record> recordss = new RecordDAO().getRecord(userId);*/
       /* request.getSession().setAttribute("recordss",recordss);*/
        response.sendRedirect("/selectpage");
    }
}
