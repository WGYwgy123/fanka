package servlet;

import bean.Record;
import com.google.gson.Gson;
import dao.RecordDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class AdmRecServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws SecurityException, IOException, ServletException {

        String userId = request.getParameter("userId");
        System.out.println(userId);
        /* String userId = (String) request.getAttribute("userId");*/
        HttpSession session = request.getSession(false);
        List<Record> recordss1 = new RecordDAO().getRecord(userId);
        Gson gson = new Gson();
        String json = gson.toJson(recordss1);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.append(json);
    }

}
