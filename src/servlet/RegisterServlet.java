package servlet;

import bean.User;
import dao.UserDAO;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

public class RegisterServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
        throws IOException{
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();

        String userId = request.getParameter("userId");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        System.out.println(password1 + password2);
        boolean flag = password1.equals(password2);
        System.out.println(flag);
        boolean flag1 = new UserDAO().getUser(userId);
        System.out.println(flag1);
            if (!password1.equals(password2)){
                System.out.println("error!");
                out.print("<script language='javascript'>alert('用户名不存在或者密码错误！');window.location.href='/registerpage';</script>");
            }
                Pattern pattern = Pattern.compile("^[1-9]\\d*$");
            if(!pattern.matcher(userId).matches()){
                out.print("<script language='javascript'>alert('账号必须为数字');window.location.href='registerpage';</script>");
            }
            if(new UserDAO().getUser(userId)){
                new UserDAO().insertUser(userId,password1);
                out.print("<script language='javascript'>alert('注册成功');window.location.href='loginpage';</script>");
            }
            else{
                out.print("<script language='javascript'>alert('已存在的用户');window.location.href='registerpage';</script>");
            }


    }
}
