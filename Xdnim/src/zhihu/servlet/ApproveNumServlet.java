package zhihu.servlet;

import zhihu.service.ApproveNumService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ApproveNumServlet")
public class ApproveNumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        setApproveNum(request,response,out);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void setApproveNum(HttpServletRequest request, HttpServletResponse response, PrintWriter out){

        ApproveNumService ApproveNumService = new ApproveNumService();
        int result = ApproveNumService.setApproveNum(request.getParameter("a"),request.getParameter("tableName"), request.getParameter("id"));
        System.out.println(result+"-------------ApproveNumService---"+request.getParameter("tableName"));
    }
}
