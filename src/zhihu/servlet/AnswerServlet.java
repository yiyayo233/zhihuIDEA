package zhihu.servlet;

import com.google.gson.Gson;
import zhihu.common.ProduceDatetime;
import zhihu.common.ProduceRandomNumder;
import zhihu.entity.AnswerEntity;
import zhihu.service.AnswerSercice;
import zhihu.service.SuperService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AnswerServlet")
public class AnswerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if ("addAnswer".equals(a)) {
            addAnswer(request, response, out);
        }else if ("answerItem".equals(a)) {
            selectAnswerItem(request, response, out);
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void addAnswer(HttpServletRequest request, HttpServletResponse response, PrintWriter out){
        ProduceRandomNumder ProduceRandomNumder = new ProduceRandomNumder();
        String randomNumder = ProduceRandomNumder.randomNumder(8);
        String answerID = request.getParameter("answerId");
        String UserId = request.getParameter("uId");
        String editTime = ProduceDatetime.Datetime();
        String commentId = "pl" + randomNumder;
        String content = request.getParameter("text");
        String publishTime = editTime;

        AnswerSercice AnswerSercice = new AnswerSercice();
        int result = AnswerSercice.addAnswer(answerID, UserId, 0,0, editTime, commentId, content, "", publishTime,0);
        System.out.println(result+"-----AnswerSercice.addAnswer");

        String questionId = request.getParameter("questionId");
        SuperService superService = new SuperService();
        result = superService.addSuper("questionanswer",questionId,answerID);
        System.out.println(result+"-----superService.addSuper");


    }

    private void selectAnswerItem(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
        String answerId= request.getParameter("answerId");
        AnswerSercice AnswerSercice = new AnswerSercice();
        AnswerEntity answerEntity = AnswerSercice.selectAnseerItem(answerId);

        Gson gson = new Gson();
        String json = gson.toJson(answerEntity);
        System.out.println(json);
        out.println(json);
    }
}
