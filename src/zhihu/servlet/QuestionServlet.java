package zhihu.servlet;

import com.google.gson.Gson;
import zhihu.common.ProduceDatetime;
import zhihu.common.ProduceRandomNumder;
import zhihu.dao.BynamicDao;
import zhihu.dao.SuperDao;
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
import java.util.Hashtable;
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
        }else if (a.equals("select")){
            selectAll(request,response,out);
        }else if (a.equals("updateIsFold")){
            updateIsFold(request,response,out,a);
        }else if ("AllQuestion".equals(a)){
            AllQuestion(request,response,out);
        }
    }

    private void AllQuestion(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        QuestionService ser = new QuestionService();
        List<QuestionEntity> list = ser.selectQuestion("","",0);
        List list1 = new ArrayList();
        for (QuestionEntity QuestionEntity:list) {
            Hashtable hashtable = new Hashtable();
            hashtable.put("object",QuestionEntity);
            SuperService superService = new SuperService();
            hashtable.put("answerNum",superService.selectSpperby("questionanswer",QuestionEntity.getId(),"").size());
            BynamicService bynamicService = new BynamicService();
            hashtable.put("gzNum",bynamicService.selectBynamicByAll("","",QuestionEntity.getId(),"","gz","").size());
            BrowseService browseService = new BrowseService();
            hashtable.put("llNum",browseService.selectBrowseByAll("",QuestionEntity.getId(),"","","").size());
            list1.add(hashtable);
        }
        request.setAttribute("qtwLt", list1);
        request.getRequestDispatcher("html/questionWaiting.jsp").forward(request, response);
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

        System.out.println("question");
        String questionId = request.getParameter("questionId");
        String answerId = request.getParameter("answerId");
        System.out.println("questionId"+questionId+"---answerId:"+answerId);

        QuestionService QuestionService = new QuestionService();
        QuestionEntity QuestionEntity = QuestionService.selectQuestionItem(questionId,0);
        int result = QuestionService.updatebrowseNum(questionId);
        System.out.println(result +"---updatebrowseNum");

        BrowseService browseService = new BrowseService();
        String id = ProduceRandomNumder.randomNumder("ll",8);
        if (browseService.selectBrowseByAll("",questionId,"1","","").size() < 5){
            String browseTime = ProduceDatetime.Datetime();
            String objectType = questionId.substring(0,2);
            result = browseService.addBrowse(id,uId,questionId,browseTime,objectType,QuestionEntity.getAuthorId());
            System.out.println(result +"---bynamicService.addBynamic");
        }


        request.setAttribute("llNum",browseService.selectBrowseByAll("",questionId,"","","").size());

        request.setAttribute("gzNum",new BynamicService().selectBynamicByAll("","",questionId,"","","").size());

        request.setAttribute("Question", QuestionEntity);
        SuperService SuperService = new SuperService();
        List<SuperEntity> superEntityList = SuperService.selectSpperby("questionanswer",QuestionEntity.getId(),"");

        List<QuestionPage> questionPageList = new ArrayList<>();
        if (superEntityList != null) {
            for (SuperEntity SuperEntity:
                    superEntityList) {
                AnswerSercice AnswerSercice = new AnswerSercice();
                AnswerEntity answerEntity = AnswerSercice.selectAnseerItem(SuperEntity.getId2());
                String getDeAnswerId = answerEntity.getId();
                if (browseService.selectBrowseByAll("",getDeAnswerId,"1","","").size() < 5){
                    String browseTime = ProduceDatetime.Datetime();
                    String objectType = getDeAnswerId.substring(0,2);
                    id = ProduceRandomNumder.randomNumder("ll",8);
                    result = browseService.addBrowse(id,uId,getDeAnswerId,browseTime,objectType,answerEntity.getAuthorId());
                    System.out.println(result +"--answerEntity--bynamicService.addBynamic");
                }

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

        BynamicService bynamicService = new BynamicService();
        List<BynamicEntity> bynamicEntityList = bynamicService.selectBynamic(uId,questionId,"gz");
        int qwe = 0;
        if (bynamicEntityList.size() > 0){
            qwe = 1;
        }
        request.setAttribute("isFollowQuestion", qwe);
        bynamicEntityList = bynamicService.selectBynamic(uId,questionId,"zt");
        qwe = 0;
        if (bynamicEntityList.size() > 0){
            qwe = 1;
        }
        request.setAttribute("isApproveQuestion", qwe);
        //todo 话题没加

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

        int result = QuestionService.addQuestion(questionID,UserId,questionTitle,questionIntro,0,0,0,commentId,publishTime,0);
        System.out.println(result+"-----QuestionService.addQuestion");

        BynamicServlet.addOrDelBynamic(request,response,out,"add",UserId,questionID,"fb");
        BynamicServlet.addOrDelBynamic(request,response,out,"add",UserId,questionID,"gz");

        out.println(questionID);
    }

    private void selectAll(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        QuestionService questionService = new QuestionService();
        System.out.println("X");
        String id = request.getParameter("id");
        String minTime = request.getParameter("minTime");
        String maxTime = request.getParameter("maxTime");
        String isFond = request.getParameter("isFond");
        String curr = request.getParameter("curr");
        if (id== null){
            id = "";
        }
        if (minTime == null){
            minTime = "";
        }
        if (maxTime == null){
            maxTime = "";
        }
        if (isFond == null){
            isFond = "-1";
        }
        if (curr == null){
            curr = "1";
        }

        List<QuestionEntity> questionEntityList = questionService.SelectQuestionByAdminAll(id,minTime,maxTime, Integer.parseInt(isFond), Integer.parseInt(curr),10);

        Hashtable hashtable1 = new Hashtable();
        List list = new ArrayList();
        if(questionEntityList.size() > 0){
            for (QuestionEntity QuestionEntity : questionEntityList) {
                Hashtable hashtable = new Hashtable();
                hashtable.put("object",QuestionEntity);
                BrowseService browseService = new BrowseService();
                BynamicService bynamicService = new BynamicService();
                hashtable.put("ztNum",bynamicService.selectBynamicByAll("","",QuestionEntity.getId(),"","zt","").size());
                hashtable.put("llNum",browseService.selectBrowseByAll("",QuestionEntity.getId(),"","","").size());
                hashtable.put("gzNum",bynamicService.selectBynamicByAll("","",QuestionEntity.getId(),"","gz","").size());
                list.add(hashtable);
            }
        }
        request.setAttribute("questionEntityList",list);
        hashtable1.put("questionEntityList",list);
        request.setAttribute("curr",curr);
        int perv = Integer.parseInt(curr)-1==0?1:Integer.parseInt(curr)-1;
        int total = questionService.SelectQuestionByAdminAll(id,minTime,maxTime, Integer.parseInt(isFond), -1,10).size();
        int last = total%10==0?total/10:total/10+1;
        int next = Integer.parseInt(curr)+1>last?last:Integer.parseInt(curr)+1;
        request.setAttribute("perv",perv);
        request.setAttribute("total",total);
        System.out.println(total);
        request.setAttribute("last",last);
        request.setAttribute("next",next);
        hashtable1.put("curr",curr);
        hashtable1.put("perv",perv);
        hashtable1.put("total",total);
        hashtable1.put("last",last);
        hashtable1.put("next",next);

        Gson gson = new Gson();
        String srt = gson.toJson(hashtable1);
        out.println(srt);
//        request.getRequestDispatcher("order-list.jsp").forward(request,response);
    }

    private void updateIsFold(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String a) {
        String id = request.getParameter("id");
        String is = request.getParameter("is");
        QuestionService QuestionService = new QuestionService();
        int result = QuestionService.updateFold(id,is);
        System.out.println(result+"----"+"QuestionService.updateFold("+id+","+is+")");
    }
}
