package servlet;

import bean.User;
import dao.UserDAO;
import dao.RecordDAO;
//删除用户
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//            HttpSession session = request.getSession(false);
//            User user =(User) session.getAttribute("user");
            User user  = (User)request.getSession().getAttribute("user");
            new UserDAO().delUser(user.getUserId());
            new RecordDAO().DeleteRecord(user.getUserId());
            response.sendRedirect("/loginpage");
    }
}
