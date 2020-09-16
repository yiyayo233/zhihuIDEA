package zhihu.servlet;

import zhihu.entity.*;
import zhihu.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PeopleServlet")
public class PeopleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if (a==null || a.equals("info")) {
            IntoPeople(request, response, out);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * 初始化用户页面
     * @param request
     * @param response
     * @param out
     * @throws ServletException
     * @throws IOException
     */
    public void IntoPeople(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {

        Cookie[] Cookies = request.getCookies();
        String uId = "";
        String uName = "";
        String uChatHead ="";
        boolean f = false;

        for (Cookie cookie: Cookies) {
            if (cookie.getName().equals("uId")){
                uId = cookie.getValue();
                f = true;
            }else if (cookie.getName().equals("uName")){
                uName = cookie.getValue();
                f = true;
            }else if(cookie.getName().equals("uChatHead")||cookie.getName().equals("user")){
                uChatHead = cookie.getValue();
                f = true;
            }
        }
        if (!f) {
            response.sendRedirect("html/signin.jsp");
            return;
        }else {
            System.out.println("jsp    uId:"+uId+"\tuName:"+uName+"\tuChatHead:"+uChatHead);
        }

        UserService userService = new UserService();
        UserEntity userEntity = userService.selecUserAndPersonaldItem(uId);

        request.setAttribute("userEntity",userEntity);


        List<BynamicContainerEntity> bynamicContainerEntityList = new ArrayList<>();
        BynamicService bynamicService = new BynamicService();
        List<BynamicEntity> bynamicEntityList = bynamicService.selectPeople(uId);
        if (bynamicEntityList.size() != 0) {
            for (BynamicEntity bynamicEntity: bynamicEntityList) {
                QuestionService QuestionService = new QuestionService();

                String byBynamicType = bynamicEntity.getByBynamicId().substring(0,2);
                String bynamicType = bynamicEntity.getBynamicType().substring(0,2);
                System.err.println(byBynamicType.equals("wt"));
                if (byBynamicType.equals("wt")){
                    QuestionEntity questionEntity = QuestionService.selectQuestionItem(bynamicEntity.getByBynamicId());
                    bynamicContainerEntityList.add(new BynamicContainerEntity(bynamicEntity,questionEntity));
                }else if (byBynamicType.equals("hd")){
                    AnswerSercice AnswerSercice = new AnswerSercice();
                    AnswerEntity AnswerEntity = AnswerSercice.selectAnseerItem(bynamicEntity.getByBynamicId());

                    SuperService SuperService = new SuperService();
                    SuperEntity SuperEntity = SuperService.selectSpperItem("questionanswer","",bynamicEntity.getByBynamicId());
                    QuestionEntity questionEntity = QuestionService.selectQuestionItem(SuperEntity.getId1());

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
                    HeaderPage headerPage = new HeaderPage(questionEntity,AnswerEntity,UserEntity,CommentNum);

                    bynamicContainerEntityList.add(new BynamicContainerEntity(bynamicEntity,headerPage));
                }

            }
        }

        request.setAttribute("bynamicContainerEntityList",bynamicContainerEntityList);



        request.getRequestDispatcher("html/people.jsp").forward(request,response);

    }
}
