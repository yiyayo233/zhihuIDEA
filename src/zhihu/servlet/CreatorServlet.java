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
import java.util.*;

@WebServlet(name = "CreatorServlet")
public class CreatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if (a==null || a.equals("info")) {
            IntoCreator(request, response, out);
        }else if (a.equals("intoCreator")){
            intoCreator1(request, response, out);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void IntoCreator(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException, ServletException {
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

        intoCreatorHomeGeneralCard(request,response,out,uId);
        intoCreatorHomeAnalyticsData(request,response,out,uId);

        request.getRequestDispatcher("html/creator.jsp").forward(request,response);


    }

    private void intoCreator1(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {



    }

    /**
     * 初始化 总数统计
     * @param request
     * @param response
     * @param out
     * @param uId
     */
    public void intoCreatorHomeGeneralCard(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String uId){
        BrowseService BrowseService = new BrowseService();
        String objectId = request.getParameter("objectId");
        List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByAll("","","","",uId);
        int BrowseAllNum = browseEntityList.size();
        request.setAttribute("BrowseAllNum", BrowseAllNum);
        browseEntityList = BrowseService.selectBrowseByAll("","","-1","",uId);
        int BrowseAllUpNum = browseEntityList.size();
        request.setAttribute("BrowseAllUpNum", BrowseAllUpNum);


        BynamicService BynamicService = new BynamicService();
        List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByAll("","","","","zt",uId);
        int ztAllNum = bynamicEntityList.size();
        request.setAttribute("ztAllNum", ztAllNum);
        bynamicEntityList = BynamicService.selectBynamicByAll("","","","-1","zt",uId);
        int ztAllUpNum = bynamicEntityList.size();
        request.setAttribute("ztAllUpNum", ztAllUpNum);


        bynamicEntityList = BynamicService.selectBynamicByAll("","",uId,"","gz","");
        int gzAllNum = bynamicEntityList.size();
        request.setAttribute("ztAllNum", ztAllNum);
        bynamicEntityList = BynamicService.selectBynamicByAll("","",uId,"-1","gz","");
        int zgAllUpNum = bynamicEntityList.size();
        request.setAttribute("ztAllUpNum", ztAllUpNum);

        System.out.println("BrowseAllNum----"+BrowseAllNum+"-----BrowseAllUpNum----"+BrowseAllUpNum);
        System.out.println("ztAllNum----"+ztAllNum+"-----ztAllUpNum-----"+ztAllUpNum);
        System.out.println("gzAllNum----"+gzAllNum+"-----zgAllUpNum-----"+zgAllUpNum);
    }

    /**
     * 初始化 近期创作数据
     * @param request
     * @param response
     * @param out
     * @param uId
     */
    private void intoCreatorHomeAnalyticsData(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String uId) {
        BynamicService BynamicService = new BynamicService();
        BrowseService BrowseService = new BrowseService();
        AnswerSercice AnswerSercice = new AnswerSercice();
        SuperService SuperService = new SuperService();
        QuestionService QuestionService = new QuestionService();


        List<Object> CreatorHomeAnalyticsDataItems = new ArrayList<>();
        List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByAll("",uId,"","","fb","");
        if (bynamicEntityList.size()>0){
            // TODO: supHashtable
            for (BynamicEntity bynamicEntity: bynamicEntityList) {

                Hashtable<String, Object> objectMap = new Hashtable<String, Object>();
                String type = bynamicEntity.getByBynamicId().substring(0,2);
                if (type.equals("hd")){
                    AnswerEntity answerEntity = AnswerSercice.selectAnseerItem(bynamicEntity.getByBynamicId());
                    objectMap.put("object",answerEntity);

                    SuperEntity SuperEntity = SuperService.selectSpperItem("questionanswer","",answerEntity.getId());
                    QuestionEntity questionEntity = QuestionService.selectQuestionItem(SuperEntity.getId1());
                    objectMap.put("questionTitle",questionEntity.getQuestionTitle()
                    );
                }else if (type.equals("wt")){
                    objectMap.put("object",QuestionService.selectQuestionItem(bynamicEntity.getByBynamicId()));
                }else if (type.equals("yh")){
                }
                objectMap.put("type",type);
                List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByAll("",bynamicEntity.getByBynamicId(),"","","");
                objectMap.put("llNum",browseEntityList.size());

                objectMap.put("plNum",CommentServlet.getCommentNum(bynamicEntity.getByBynamicId()));
                List<BynamicEntity> bynamicEntityList1 = BynamicService.selectBynamicByAll("","",bynamicEntity.getByBynamicId(),"","zt","");
                objectMap.put("ztNum",bynamicEntityList1.size());
                CreatorHomeAnalyticsDataItems.add(objectMap);
            }
        }


        request.setAttribute("CreatorHomeAnalyticsDataItems",CreatorHomeAnalyticsDataItems);
    }
}
