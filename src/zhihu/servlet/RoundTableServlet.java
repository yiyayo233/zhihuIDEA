package zhihu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import zhihu.entity.QuestionEntity;
import zhihu.entity.RoundtableContainerEntity;
import zhihu.entity.RoundtableEntity;
import zhihu.entity.SuperEntity;
import zhihu.service.*;

public class RoundTableServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RoundTableServlet() {
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
		
		
		if(request.getParameter("a").equals("shou")){
			List<RoundtableContainerEntity> roundtableContainerEntities = new ArrayList<RoundtableContainerEntity>();

			SuperService superService = new SuperService();
			String roundtableId = request.getParameter("yzid");
			List<SuperEntity> superEntities = superService.selectSpperDistinct2("roundtablequestion");
			
			if(superEntities.size() != 0){
				for(SuperEntity superEntity : superEntities){
					SuperService superService1 = new SuperService();
					List<SuperEntity> superEntityList= superService1.selectSpperby("roundtablequestion", superEntity.getId1(), "");

					RoundTableService roundTableService  =new RoundTableService();
					RoundtableEntity roundtableEntity;
					if(superEntityList.size() != 0){ 
						roundtableEntity= roundTableService.select(superEntityList.get(0).getId1());
						BynamicService bynamicService = new BynamicService();
						roundtableEntity.setFollowNum(bynamicService.selectBynamicByAll("","",roundtableEntity.getId(),"","gz","").size());
						List<QuestionEntity> questionEntityList = new ArrayList<QuestionEntity>();
						List list1 = new ArrayList();
						for (SuperEntity superEntity1 : superEntityList) {
							Hashtable hashtable = new Hashtable();
							QuestionService questionService = new QuestionService();
							QuestionEntity questionEntity1 = questionService.selectQuestionItem(superEntity1.getId2());
							questionEntityList.add(questionEntity1);
							hashtable.put("questionEntity",questionEntity1);
							hashtable.put("questionEntity1FollowNum",bynamicService.selectBynamicByAll("","",questionEntity1.getId(),"","gz","").size());
							list1.add(hashtable);
						}
						String uId = analyticsServlet.Cookies(request, response, out);
						int isfollok = bynamicService.selectBynamicByAll("",uId,roundtableEntity.getId(),"","gz","").size();
						roundtableContainerEntities.add(new RoundtableContainerEntity(roundtableEntity,list1, isfollok));
					}
				}
			}
			Gson gson = new Gson();
			String str = gson.toJson(roundtableContainerEntities);
			System.out.println(str);
			out.print(str);
		}else {
			List<RoundtableContainerEntity> roundtableContainerEntities = new ArrayList<RoundtableContainerEntity>();

			SuperService superService = new SuperService();
			String roundtableId = request.getParameter("yzid");
			List<SuperEntity> superEntities = superService.selectSpperby("roundtablequestion", roundtableId, "");
			
			if(superEntities.size() != 0){
				for(SuperEntity superEntity : superEntities){
					SuperService superService1 = new SuperService();
					List<SuperEntity> superEntityList= superService1.selectSpperby("roundtablequestion", superEntity.getId1(), "");

					RoundTableService roundTableService  =new RoundTableService();
					RoundtableEntity roundtableEntity;
					if(superEntityList.size() != 0){ 
						roundtableEntity= roundTableService.select(superEntityList.get(0).getId1());
						List<QuestionEntity> questionEntityList = new ArrayList<QuestionEntity>();
						List list1 = new ArrayList();
						for (SuperEntity superEntity1 : superEntityList) {
							Hashtable hashtable = new Hashtable();
							QuestionService questionService = new QuestionService();
							QuestionEntity questionEntity1 = questionService.selectQuestionItem(superEntity1.getId2());
							questionEntityList.add(questionEntity1);
							hashtable.put("questionEntity",questionEntity1);
							BynamicService bynamicService = new BynamicService();
							hashtable.put("questionEntity1FollowNum",bynamicService.selectBynamicByAll("","",questionEntity1.getId(),"","gz","").size());
							list1.add(hashtable);
						}
						String uId = analyticsServlet.Cookies(request, response, out);
						BynamicService bynamicService = new BynamicService();
						int isfollok = bynamicService.selectBynamicByAll("",uId,roundtableEntity.getId(),"","gz","").size();
						roundtableContainerEntities.add(new RoundtableContainerEntity(roundtableEntity,questionEntityList, isfollok));
						
					}
				}
			}
			Gson gson = new Gson();
			String str = gson.toJson(roundtableContainerEntities);
			System.out.println(str);
			out.print(str);
		}
		
			
		
		
		
		
		
		
		
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
