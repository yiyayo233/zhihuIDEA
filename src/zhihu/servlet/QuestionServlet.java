package zhihu.servlet;

import zhihu.common.ProduceDatetime;
import zhihu.common.ProduceRandomNumder;
import zhihu.dao.SuperDao;
import zhihu.entity.*;
import zhihu.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "QuestionServlet")
public class QuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();
        String a = "info";
        a = request.getParameter("a");
        if (a==null || a.equals("info")){
            IntoQuestion(request,response,out);
        }else if(a.equals("addQuestion")){
            addQuestion(request,response,out);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * 初始化问题页面
     * @param request
     * @param response
     * @param out
     * @throws ServletException
     * @throws IOException
     */
    public void IntoQuestion(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        System.out.println("question");
        String questionId = request.getParameter("questionId");
        String answerId = request.getParameter("answerId");
        System.out.println("questionId"+questionId+"---answerId:"+answerId);

        QuestionService QuestionService = new QuestionService();
        QuestionEntity QuestionEntity = QuestionService.selectQuestionItem(questionId);
        int result = QuestionService.updatebrowseNum(questionId);
        System.out.println(result +"---updatebrowseNum");
        request.setAttribute("Question", QuestionEntity);

        SuperService SuperService = new SuperService();
        List<SuperEntity> superEntityList = SuperService.selectSpperby("questionanswer",QuestionEntity.getId(),"");

        List<QuestionPage> questionPageList = new ArrayList<>();
        if (superEntityList != null) {
            for (SuperEntity SuperEntity:
                    superEntityList) {
                AnswerSercice AnswerSercice = new AnswerSercice();
                AnswerEntity answerEntity = AnswerSercice.selectAnseerItem(SuperEntity.getId2());
                UserService UserService = new UserService();
                UserEntity userEntity = UserService.selecUserPersonalItem(answerEntity.getAuthorId());

                int CommentNum = 0;
                CommentService CommentService = new CommentService();
                List<CommentEntity> commentEntityList = CommentService.selectComment(answerEntity.getId());
                if (commentEntityList != null) {
                    for (CommentEntity commentEntity:commentEntityList) {
                        CommentNum++;
                        CommentReplyService CommentReplyService = new CommentReplyService();
                        List<CommentReplyEntity> commentReplyEntityList = CommentReplyService.selectCommentReply(commentEntity.getId());
                        CommentNum = CommentNum + commentReplyEntityList.size();
                    }
                }

                questionPageList.add(new QuestionPage(answerEntity,userEntity,CommentNum));
            }
        }


        request.setAttribute("questionPageList", questionPageList);
        //todo 话题、用户没加

        int CommentNum = 0;
        CommentService CommentService = new CommentService();
        List<CommentEntity> commentEntityList = CommentService.selectComment(QuestionEntity.getId());
        if (commentEntityList != null) {
            for (CommentEntity commentEntity:commentEntityList) {
                CommentNum++;
                CommentReplyService CommentReplyService = new CommentReplyService();
                List<CommentReplyEntity> commentReplyEntityList = CommentReplyService.selectCommentReply(commentEntity.getId());
                CommentNum = CommentNum + commentReplyEntityList.size();
            }
        }
        request.setAttribute("CommentNum", CommentNum);

        request.getRequestDispatcher("html/question.jsp").forward(request,response);

    }

    /**
     * 添加问题
     * @param request
     * @param response
     * @param out
     * @throws ServletException
     * @throws IOException
     */
    public void addQuestion(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        QuestionService QuestionService = new QuestionService();

        ProduceRandomNumder ProduceRandomNumder = new ProduceRandomNumder();
        String randomNumder = ProduceRandomNumder.randomNumder(8);
        String questionID = "wt" + randomNumder;
        String UserId = request.getParameter("uId");
        String questionTitle = request.getParameter("title");
        String questionIntro = request.getParameter("text");
        String commentId = "pl" + randomNumder;
        String publishTime = ProduceDatetime.Datetime();

        int result = QuestionService.addQuestion(questionID,UserId,questionTitle,questionIntro,0,0,0,commentId,publishTime);
        System.out.println(result+"-----QuestionService.addQuestion");

    }
}
