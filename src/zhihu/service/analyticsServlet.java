package zhihu.service;

import zhihu.entity.BynamicEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "analyticsServlet",urlPatterns = {"/creator/analytics"})
public class analyticsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if (a==null || a.equals("info")) {
            Intoanalytics(request, response, out);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void Intoanalytics(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {

        BynamicService BynamicService = new BynamicService();
        BynamicService.selectBynamicByAll("","","","","","");





        request.getRequestDispatcher("/html/analytics.jsp").forward(request,response);
    }
}
