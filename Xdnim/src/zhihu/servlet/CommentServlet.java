package zhihu.servlet;

import com.google.gson.Gson;
import zhihu.entity.*;
import zhihu.service.AnswerSercice;
import zhihu.service.CommentReplyService;
import zhihu.service.CommentService;
import zhihu.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CommentServlet")
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if ("Comment".equals(a)) {
            initComment(request, response, out);
        }else if ("comment".equals(a)||"commentReply".equals(a)){
            addComment(request, response, out, a);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * 初始化评论框
     * @param request
     * @param response
     * @param out
     * @throws ServletException
     * @throws IOException
     */
    public void initComment(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        String affiliationId = request.getParameter("affiliationId");

        List<CommentContainerEntity> commentContainerEntityList = new ArrayList<>();

        CommentService CommentService = new CommentService();
        List<CommentEntity> commentEntityList = CommentService.selectComment(affiliationId);
        if (commentEntityList != null) {
            for (CommentEntity commentEntity:commentEntityList) {
                UserService UserService = new UserService();
                UserEntity UserEntity = UserService.selecUserItem(commentEntity.getUserId());

                List<CommentReplyContainerEntity> commentReplyContainerEntityList = new ArrayList<>();

                CommentReplyService CommentReplyService = new CommentReplyService();
                List<CommentReplyEntity> commentReplyEntityList = CommentReplyService.selectCommentReply(commentEntity.getId());
                if (commentReplyEntityList != null) {
                    for (CommentReplyEntity commentReplyEntity:commentReplyEntityList) {
                        UserEntity userEntity = UserService.selecUserItem(commentReplyEntity.getUserId());
                        UserEntity replyUserEntity = UserService.selecUserItem(commentReplyEntity.getReplyuserId());
                        commentReplyContainerEntityList.add(new CommentReplyContainerEntity(commentReplyEntity,userEntity,replyUserEntity));
                    }
                }
                commentContainerEntityList.add(new CommentContainerEntity(commentEntity,UserEntity,commentReplyContainerEntityList));
            }
        }

        Gson gson = new Gson();
        String json = gson.toJson(commentContainerEntityList);
        System.out.println(json);
        out.println(json);
    }

    /**
     * 添加评论
     * @param request
     * @param response
     * @param out
     */
    public void addComment(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String a){
        if (a.equals("comment")){
            CommentService CommentService = new CommentService();
            String id = request.getParameter("commentId");
            String answerId = request.getParameter("answerId");
            String uid = request.getParameter("uid");
            String affiliationId = request.getParameter("affiliationId");
            String text = request.getParameter("text");
            int approveNum = Integer.parseInt(request.getParameter("approveNum"));
            String commentTime = request.getParameter("commentTime");
            int result = CommentService.addComment(id,answerId,uid,affiliationId,text,approveNum,commentTime);
            System.out.println(result+"----------CommentService");
        }else {
            CommentReplyService CommentReplyService = new CommentReplyService();
            String rid = request.getParameter("commentreplyRId");
            String id = request.getParameter("commentId");
            String uid = request.getParameter("uid");
            String ruid = request.getParameter("ruId");
            String text = request.getParameter("text");
            int approveNum = Integer.parseInt(request.getParameter("approveNum"));
            String commentTime = request.getParameter("commentTime");
            int result = CommentReplyService.addCommentReply(rid,id,uid,ruid,text,approveNum,commentTime);
            System.out.println(result+"----------CommentReplyService");
        }
    }

    /**
     * 获取对象评论总数
     * @param affiliationId
     * @return
     */
    public static int getCommentNum(String affiliationId){
        int CommentNum = 0;
        CommentService CommentService = new CommentService();
        List<CommentEntity> commentEntityList = CommentService.selectComment(affiliationId);
        if (commentEntityList.size() != 0) {
            for (CommentEntity commentEntity:commentEntityList) {
                CommentNum++;
                CommentReplyService CommentReplyService = new CommentReplyService();
                List<CommentReplyEntity> commentReplyEntityList = CommentReplyService.selectCommentReply(commentEntity.getId());
                CommentNum = CommentNum + commentReplyEntityList.size();
            }
        }
        return CommentNum;
    }

    public static int getCommentNumByTime(String uId, String CommentTime, String affiliationId){
        int CommentNum = 0;
        CommentService CommentService = new CommentService();
        List<CommentEntity> commentEntityList = CommentService.selectCommentByAll("","","",affiliationId,"",0,CommentTime);
        if (commentEntityList.size() != 0){
            for (CommentEntity commentEntity:commentEntityList) {
                String type = commentEntity.getAffiliationId().substring(0,2);
                if (type.equals("hd")){
                    AnswerSercice answerSercice = new AnswerSercice();
                    AnswerEntity answerEntity = answerSercice.selectAnseerItem(commentEntity.getAffiliationId());
                    if (answerEntity.getAuthorId().equals(uId)){
                        CommentNum++;
                        CommentReplyService CommentReplyService = new CommentReplyService();
                        List<CommentReplyEntity> commentReplyEntityList = CommentReplyService.selectCommentReplyByAll("",commentEntity.getId(),"","","",0,CommentTime);
                        CommentNum = CommentNum + commentReplyEntityList.size();
                    }
                }
            }
        }
        return CommentNum;
    }
}
