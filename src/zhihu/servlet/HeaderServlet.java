package zhihu.servlet;

import com.google.gson.Gson;
import zhihu.entity.*;
import zhihu.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

@WebServlet(name = "headerServlet")
public class HeaderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if ("init".equals(a)) {
            init(request, response, out);
        }else if ("userIndustry".equals(a)){
            userIndustry(request, response, out);
        }else if ("getAyerData".equals(a)){
            getAyerData(request, response, out);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * 初始化首页
     * @param request
     * @param response
     * @param out
     * @throws ServletException
     * @throws IOException
     */
    public void init(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        if (null == request.getCookies()) {
            System.out.println(12341);
            response.sendRedirect("/zhihuIDEA_war_exploded/html/signin.jsp");
            return;
//            request.getRequestDispatcher("html/signin.jsp").forward(request,response);
        }else {

        }

        List<HeaderPage> headerPageList = new ArrayList<>();

        SuperService SuperService = new SuperService();
        List<SuperEntity> superEntityList = SuperService.selectSpperDistinct("questionanswer");

        if (superEntityList.size() != 0) {
            for (SuperEntity superEntity:superEntityList) {
                SuperEntity SuperEntity = SuperService.selectSpperItem("questionanswer",superEntity.getId1(),"");

                QuestionService QuestionService = new QuestionService();
                QuestionEntity questionEntity = QuestionService.selectQuestionItem(SuperEntity.getId1());

                AnswerSercice AnswerSercice = new AnswerSercice();
                AnswerEntity AnswerEntity = AnswerSercice.selectAnseerItem(SuperEntity.getId2());

                UserService UserService = new UserService();
                UserEntity UserEntity = UserService.selecUserItem(AnswerEntity.getAuthorId());

                int CommentNum = 0;
                CommentService CommentService = new CommentService();
                List<CommentEntity> commentEntityList = CommentService.selectComment(AnswerEntity.getId());
                if (commentEntityList.size() != 0) {
                    for (CommentEntity commentEntity:commentEntityList) {
                        CommentNum++;
                        CommentReplyService CommentReplyService = new CommentReplyService();
                        List<CommentReplyEntity> commentReplyEntityList = CommentReplyService.selectCommentReply(commentEntity.getId());
                        CommentNum = CommentNum + commentReplyEntityList.size();
                    }
                }


                headerPageList.add(new HeaderPage(questionEntity,AnswerEntity,UserEntity,CommentNum));
            }
        }

        System.out.println(headerPageList.size());
        Gson gson = new Gson();
        String json = gson.toJson(headerPageList);
        System.out.println(json);
        out.println(json);
    }

    /**
     * 查询用户信息   industry
     * @param request
     * @param response
     * @param out
     * @throws ServletException
     * @throws IOException
     */
    public void userIndustry(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException{
        UserService UserService = new UserService();
        String id = request.getParameter("id");
        UserEntity UserEntity = UserService.selecUserPersonalItem(id);

        Gson gson = new Gson();
        String json = gson.toJson(UserEntity);
        System.out.println(json);
        out.println(json);
    }

    private void getAyerData(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
        String uId = request.getParameter("uId");
        Hashtable hashtable = analyticsServlet.getAyerData(request,response,out,uId);
        Gson gson = new Gson();
        String json = gson.toJson(hashtable);
        System.out.println(json);
        out.println(json);
    }
}
