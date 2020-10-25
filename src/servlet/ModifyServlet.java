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
import java.io.PrintWriter;
import java.util.regex.Pattern;

public class ModifyServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
//        response.setHeader("");
        PrintWriter out=response.getWriter();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if(user.getPower()==-1){
            out.print("<script language='javascript'>alert('该卡已挂失 禁止修改密码');window.location.href='index';</script>");
            return;
        }

        //获取post的记录
        String oldpsd = request.getParameter("oldpsd");
        String newpsd = request.getParameter("newpsd");
        String copsd = request.getParameter("copsd");
        if (!new UserDAO().getUser1(user.getUserId(),oldpsd)){
            out.print("<script language='javascript'>alert('两次密码不同');window.location.href='index';</script>");
        }
        if (!newpsd.equals(copsd)){
            out.print("<script language='javascript'>alert('两次密码不同');window.location.href='index';</script>");
        }
        else {
            request.getSession().setAttribute("user",user);
            new UserDAO().updataUser(user.getUserId(),newpsd);
            out.print("<script language='javascript'>alert('修改成功');window.location.href='index';</script>");
        }
    }
}
