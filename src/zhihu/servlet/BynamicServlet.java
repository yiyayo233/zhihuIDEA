package zhihu.servlet;

import zhihu.common.ProduceDatetime;
import zhihu.common.ProduceRandomNumder;
import zhihu.service.AnswerSercice;
import zhihu.service.BynamicService;
import zhihu.service.QuestionService;
import zhihu.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "BynamicServlet")
public class BynamicServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if ("del".equals(a)||"add".equals(a)) {
            addOrDelBynamic(request, response, out, a);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void addOrDelBynamic(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String a) {
        BynamicService BynamicService = new BynamicService();
        if ("add".equals(a)){
            String id = ProduceRandomNumder.randomNumder("dt",8);
            String uId = request.getParameter("uId");
            String byBynamicId = request.getParameter("byBynamicId");
            String bynamicTime = ProduceDatetime.Datetime();
            String bynamicType = request.getParameter("BynamicType");
            String authorId = "";

            String type = byBynamicId.substring(0,2);
            if (type.equals("hd")){
                AnswerSercice AnswerSercice = new AnswerSercice();
                authorId = AnswerSercice.selectAnseerItem(byBynamicId).getAuthorId();
            }else if (type.equals("wt")){
                QuestionService QuestionService = new QuestionService();
                authorId = QuestionService.selectQuestionItem(byBynamicId).getAuthorId();
            }else if (type.equals("yh")){
            }

            /// TODO: 2020/9/18 判断对象类型 

            int result = BynamicService.addBynamic(id,uId,byBynamicId,bynamicTime,bynamicType,authorId);
            System.out.println(result+"-----BynamicService.addBynamic");
        }else if ("del".equals(a)){
            String uId = request.getParameter("uId");
            String byBynamicId = request.getParameter("byBynamicId");
            String bynamicType = request.getParameter("BynamicType");

            int result = BynamicService.deleteBynamic(uId,byBynamicId,bynamicType);
            System.out.println(result+"-----BynamicService.deleteBynamic");
        }
    }
}
