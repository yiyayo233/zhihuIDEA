package zhihu.servlet;

import zhihu.common.ProduceDatetime;
import zhihu.common.ProduceRandomNumder;
import zhihu.entity.AnswerEntity;
import zhihu.entity.BrowseEntity;
import zhihu.service.AnswerSercice;
import zhihu.service.BrowseService;
import zhihu.service.SuperService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "BrowseServlet")
//@WebServlet(name = "BrowseServlet",urlPatterns = {"/qqq"})

public class BrowseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charter=utf-8");
        PrintWriter out = response.getWriter();

        String a = request.getParameter("a");
        if ("addBrowse".equals(a)) {
            addBrowse(request, response, out);
        }else if ("BrowseItem".equals(a)) {
            selectBrowseItem(request, response, out);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void addBrowse(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
        BrowseService BrowseService = new BrowseService();
        String uId = request.getParameter("uId");
        String objectId = request.getParameter("objectId");
        List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByTime(uId,objectId,"1","","");
        System.out.println("browseEntityList.size()----"+browseEntityList.size());

        if (browseEntityList.size() < 5){
            ProduceRandomNumder ProduceRandomNumder = new ProduceRandomNumder();
            String id = ProduceRandomNumder.randomNumder("ll",8);
            String browseTime = ProduceDatetime.Datetime();
            String objectType = request.getParameter("objectType");

            AnswerSercice AnswerSercice = new AnswerSercice();
            AnswerEntity AnswerEntity = AnswerSercice.selectAnseerItem(objectId);


            int result = BrowseService.addBrowse(id, uId, objectId, browseTime, objectType, AnswerEntity.getAuthorId());
            System.out.println(result+"-----BrowseService.addAnswer");
        }


    }

    private void selectBrowseItem(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
        BrowseService BrowseService = new BrowseService();
        String uId = request.getParameter("uId");
        String objectId = request.getParameter("objectId");
        List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByTime(uId,objectId,"1","","");

    }
}
