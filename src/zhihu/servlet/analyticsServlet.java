package zhihu.servlet;

import com.google.gson.Gson;
import zhihu.common.ProduceDatetime;
import zhihu.entity.BrowseEntity;
import zhihu.entity.BynamicEntity;
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
        }else if (a.equals("getDataTime")||a.equals("getDataObject")){
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
        int objLlNum1 = 0;
        browseEntityList = BrowseService.selectBrowseByAll("","","-1","",uId);
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
        System.out.println(objLlNum1+"-"+objLlNum2+":  ");
        if (objLlNum2 != 0){
            System.out.println((objLlNum1-objLlNum2)/objLlNum2*100);
            request.setAttribute("objLlNumUp",(objLlNum1-objLlNum2)/objLlNum2*100);
        }else {

            request.setAttribute("objLlNumUp",0);
        }
        System.out.println((objLlNum1-objLlNum2)/objLlNum2*100);
        request.setAttribute("objLlNumUp",(objLlNum1-objLlNum2)/objLlNum2*100);

        int objZtNum1 = 0;
        bynamicEntityList = BynamicService.selectBynamicByAll("","","","-1","zt",uId);
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
        System.out.println(objZtNum1+"-"+objZtNum2+":  ");
        if (objZtNum2 != 0){
            System.out.println((objZtNum1-objZtNum2)/objZtNum2*100);
            request.setAttribute("objZtNumUp",(objZtNum1-objZtNum2)/objZtNum2*100);
        }else {

            request.setAttribute("objZtNumUp",0);
        }





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
        BrowseService BrowseService = new BrowseService();
        BynamicService BynamicService = new BynamicService();
        //todo 通过循环获取时间
        Object str[][];
        List<String> strings = ProduceDatetime.Dates(day);
        if (a.equals("getDataTime")){
            str =new Object[day][6];
            for (int i=0;i<str.length;i++){
                str[i] [0] = strings.get(i);
                List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByTime("","",strings.get(i),"",uId);
                str[i] [1] = browseEntityList.size();
                int CommentNum = CommentServlet.getCommentNumByTime(uId, strings.get(i));
                str[i] [2] = CommentNum;
                List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByTime("","","",strings.get(i),"zt",uId);
                str[i] [3] = bynamicEntityList.size();
                str[i] [4] = "--";
                str[i] [5] = "--";
            }
        }else {
            str =new Object[day][7];
            String objectId = request.getParameter("objectId");
            for (int i=0;i<str.length;i++){
                str[i] [0] = strings.get(i);
                List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByTime("",objectId,strings.get(i),"",uId);
                str[i] [1] = browseEntityList.size();
                int CommentNum = CommentServlet.getCommentNumByTime(uId, strings.get(i));
                str[i] [2] = CommentNum;
                List<BynamicEntity> bynamicEntityList = BynamicService.selectBynamicByTime("","",objectId,strings.get(i),"zt",uId);
                str[i] [3] = bynamicEntityList.size();
                str[i] [4] = "--";
                str[i] [5] = "--";
            }
        }

//        objectList.add();

        Gson gson = new Gson();
        String result = gson.toJson(str);
        out.println(result);
    }

    private String Cookies(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException {
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
}
