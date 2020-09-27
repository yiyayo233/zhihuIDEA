package zhihu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import zhihu.common.ProduceDatetime;
import zhihu.common.ProduceRandomNumder;
import zhihu.entity.*;
import zhihu.service.*;

public class RoundTableByIdServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RoundTableByIdServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 *
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 *
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("rtId");
		RoundTableService ser = new RoundTableService();
		RoundtableEntity roundtable = ser.select(id);
		BrowseService BrowseService = new BrowseService();
		BynamicService BynamicService = new BynamicService();

		String uId = analyticsServlet.Cookies(request,response,out);
		List<BrowseEntity> browseEntityList = BrowseService.selectBrowseByAll(uId,roundtable.getId(),"1","","");
		System.out.println("browseEntityList.size()----"+browseEntityList.size());

		if (browseEntityList.size() < 5){
			ProduceRandomNumder ProduceRandomNumder = new ProduceRandomNumder();
			String id1 = ProduceRandomNumder.randomNumder("ll",8);
			String browseTime = ProduceDatetime.Datetime();
			int result = BrowseService.addBrowse(id1, uId, roundtable.getId(), browseTime, "yz", "");
			System.out.println(result+"-----BrowseService.addAnswer");
		}

		roundtable.setBrowseNum(BrowseService.selectBrowseByAll("",roundtable.getId(),"","","").size());
		roundtable.setFollowNum(BynamicService.selectBynamicByAll("","",roundtable.getId(),"","gz","").size());

		request.setAttribute("Allrt", roundtable);
		request.setAttribute("isFollow", BynamicService.selectBynamicByAll("",uId,roundtable.getId(),"","gz","").size());

		request.getRequestDispatcher("html/round.jsp").forward(request, response);

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
