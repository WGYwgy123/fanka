package servlet;
//管理员删除
import dao.UserDAO;
import dao.RecordDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AdmDelServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("Id");
//        PrintWriter out = response.getWriter();
        new UserDAO().delUser(userId);
        new RecordDAO().DeleteRecord(userId);
//        out.println("<script language='javascript'> alert('删除用户成功！');window.location.href='/selectpage';</script>");
        response.sendRedirect("/select");
    }
}
