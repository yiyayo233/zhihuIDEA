package zhihu.servlet;

import com.google.gson.Gson;
import zhihu.common.ProduceDatetime;
import zhihu.entity.AnswerEntity;
import zhihu.entity.BrowseEntity;
import zhihu.entity.BynamicEntity;
import zhihu.service.AnswerSercice;
import zhihu.service.BrowseService;
import zhihu.service.BynamicService;

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
        }else if (a.equals("getDataTime") || a.equals("getDataObject")){
            getdata(request, response, out,a);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void Intoanalytics(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        String uId = Cookies(request, response, out);

        int objNum = 0;
        BynamicService BynamicService = new BynamicService();
        List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByAll("","","","","fb",uId);
        if (bynamicEntityList.size()> 0){
            for (BynamicEntity BynamicEntity:
                 bynamicEntityList) {
                if (BynamicEntity.getByBynamicId().substring(0,2).equals("hd")) {
                    objNum++;
                }
            }
        }
        request.setAttribute("objNum",objNum);
        objNum = 0;
        BrowseService BrowseService = new BrowseService();
        List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByAll("","","","",uId);
        if (browseEntityList.size()> 0){
            for (BrowseEntity BrowseEntity:
                    browseEntityList) {
                if (BrowseEntity.getObjectId().substring(0,2).equals("hd")) {
                    objNum++;
                }
            }
        }
        request.setAttribute("objLlNum",objNum);
        objNum = 0;
        bynamicEntityList = BynamicService.selectBynamicByAll("","","","","zt",uId);
        if (bynamicEntityList.size()> 0){
            for (BynamicEntity BynamicEntity:
                    bynamicEntityList) {
                if (BynamicEntity.getByBynamicId().substring(0,2).equals("hd")) {
                    objNum++;
                }
            }
        }
        request.setAttribute("objZtNum",objNum);


        getAyerData(request, response, out, uId);





        request.getRequestDispatcher("/html/analytics.jsp").forward(request,response);
    }

    /**
     * 获取data
     * @param request
     * @param response
     * @param out
     * @throws IOException
     */
    private void getdata(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String a) throws IOException {
        String uId = Cookies(request, response, out);
        int day = Integer.parseInt(request.getParameter("day"));
        String objectId = request.getParameter("objectId");
        BrowseService BrowseService = new BrowseService();
        BynamicService BynamicService = new BynamicService();
        //todo 通过循环获取时间
        Object str[][];
        List<String> strings = ProduceDatetime.Dates(day);
        if (a.equals("getDataTime")){
            str =new Object[day][6];
            if (objectId.equals("QQQ")){
                for (int i=0;i<str.length;i++){
                    str[i] [0] = strings.get(i);
                    List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByTime("","",strings.get(i),"",uId);
                    str[i] [1] = browseEntityList.size();
                    int CommentNum = CommentServlet.getCommentNumByTime(uId, strings.get(i),"");
                    str[i] [2] = CommentNum;
                    List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByTime("","","",strings.get(i),"zt",uId);
                    str[i] [3] = bynamicEntityList.size();
                    str[i] [4] = "--";
                    str[i] [5] = "--";
                }
            }else {
                for (int i=0;i<str.length;i++){
                    str[i] [0] = strings.get(i);
                    List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByTime("",objectId,strings.get(i),"",uId);
                    str[i] [1] = browseEntityList.size();
                    int CommentNum = CommentServlet.getCommentNumByTime(uId, strings.get(i),objectId);
                    str[i] [2] = CommentNum;
                    List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByTime("","",objectId,strings.get(i),"zt",uId);
                    str[i] [3] = bynamicEntityList.size();
                    str[i] [4] = "--";
                    str[i] [5] = "--";
                }
            }

            Gson gson = new Gson();
            String result = gson.toJson(str);
            out.println(result);
        }else {
            List<Object> objectList = new ArrayList<>();
            List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByAll("","","", String.valueOf(day),"fb",uId);
            if (bynamicEntityList.size() > 0){
                for (BynamicEntity bynamicEntity : bynamicEntityList) {
                    String type = bynamicEntity.getByBynamicId().substring(0,2);
                    if (type.equals("hd")){
                        Hashtable hashtable = new Hashtable();
                        AnswerSercice answerSercice = new AnswerSercice();
                        AnswerEntity answerEntity = answerSercice.selectAnseerItem(bynamicEntity.getByBynamicId());
                        hashtable.put("object",answerEntity);
                        List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByAll("",answerEntity.getId(),String.valueOf(day),"",uId);
                        hashtable.put("llNum",browseEntityList.size());
                        hashtable.put("commentNum",CommentServlet.getCommentNum(answerEntity.getId()));
                        bynamicEntityList = BynamicService.selectBynamicByAll("","",answerEntity.getId(),String.valueOf(day),"zt",uId);
                        hashtable.put("ztNum",bynamicEntityList.size());
                        hashtable.put("xhNum","--");
                        hashtable.put("scNum","--");
                        objectList.add(hashtable);
                    }
                }
            }

            Gson gson = new Gson();
            String result = gson.toJson(objectList);
            out.println(result);
        }

//        objectList.add();

    }

    public static String Cookies(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException {
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
        }else {
            System.out.println("jsp    uId:"+uId+"\tuName:"+uName+"\tuChatHead:"+uChatHead);
        }
        return uId;
    }

    /**
     * 获取昨日数据
     * @param request
     * @param response
     * @param out
     * @param uId
     * @return
     */
    static Hashtable getAyerData(HttpServletRequest request, HttpServletResponse response, PrintWriter out, String uId){
        BrowseService BrowseService = new BrowseService();

        int objLlNum1 = 0;
        List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByAll("", "", "-1", "", uId);
        if (browseEntityList.size()> 0){
            for (BrowseEntity BrowseEntity:
                    browseEntityList) {
                if (BrowseEntity.getObjectId().substring(0,2).equals("hd")) {
                    objLlNum1++;
                }
            }
        }
        request.setAttribute("objLlNum1",objLlNum1);
        int objLlNum2 = 0;
        browseEntityList = BrowseService.selectBrowseByAll("","","-2","",uId);
        if (browseEntityList.size()> 0){
            for (BrowseEntity BrowseEntity:
                    browseEntityList) {
                if (BrowseEntity.getObjectId().substring(0,2).equals("hd")) {
                    objLlNum2++;
                }
            }
        }
        int objLlNumUp = 0;
        System.out.println(objLlNum1+"-"+objLlNum2+":  objLlNum");
        if (objLlNum1 != 0 && objLlNum2 != 0){
            objLlNumUp = (objLlNum1-objLlNum2)/objLlNum2*100;
        }else if (objLlNum1 == 0 && objLlNum2 == 0){
        }else if ((objLlNum1-objLlNum2) == 0){
        }else if ((objLlNum1-objLlNum2) < 0){
            objLlNumUp = (objLlNum1-objLlNum2)/objLlNum2*100;
        }else if ((objLlNum1-objLlNum2) > 0 && objLlNum2 == 0){
            objLlNumUp = objLlNum1*100;
        }
        System.out.println(objLlNumUp);
        request.setAttribute("objLlNumUp",objLlNumUp);


        int objZtNum1 = 0;
        BynamicService BynamicService = new BynamicService();
        List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByAll("", "", "", "-1", "zt", uId);
        if (bynamicEntityList.size()> 0){
            for (BynamicEntity BynamicEntity:
                    bynamicEntityList) {
                if (BynamicEntity.getByBynamicId().substring(0,2).equals("hd")) {
                    objZtNum1++;
                }
            }
        }
        request.setAttribute("objZtNum1",objZtNum1);
        int objZtNum2 = 0;
        bynamicEntityList = BynamicService.selectBynamicByAll("","","","-2","zt",uId);
        if (bynamicEntityList.size()> 0){
            for (BynamicEntity BynamicEntity:
                    bynamicEntityList) {
                if (BynamicEntity.getByBynamicId().substring(0,2).equals("hd")) {
                    objZtNum2++;
                }
            }
        }
        int objZtNumUp = 0;
        System.out.println(objZtNum1+"-"+objZtNum2+":  objZtNum");
        if (objZtNum1 != 0 && objZtNum2 != 0){
            objZtNumUp = (objZtNum1-objZtNum2)/objZtNum2*100;
        }else if (objZtNum1 == 0 && objZtNum2 == 0){
        }else if ((objZtNum1-objZtNum2) == 0){
        }else if ((objZtNum1-objZtNum2) < 0){
            objZtNumUp = (objZtNum1-objZtNum2)/objZtNum2*100;
        }else if ((objZtNum1-objZtNum2) > 0 && objZtNum2 == 0){
            objZtNumUp = objZtNum1*100;
        }
        System.out.println(objZtNumUp);
        request.setAttribute("objZtNumUp",objZtNumUp);

        Hashtable hashtable = new Hashtable();
        hashtable.put("objLlNum1",objLlNum1);
        hashtable.put("objLlNumUp",objLlNumUp);
        hashtable.put("objZtNum1",objZtNum1);
        hashtable.put("objZtNumUp",objZtNumUp);
        return hashtable;

    }
}
