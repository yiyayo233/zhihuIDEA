package zhihu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zhihu.entity.PersonalDataEntity;
import zhihu.entity.QuestionEntity;
import zhihu.entity.RoundTableCompereContainerEntity;
import zhihu.entity.RoundtableContainerEntity;
import zhihu.entity.RoundtableEntity;
import zhihu.entity.SuperEntity;
import zhihu.entity.UserEntity;
import zhihu.service.QuestionService;
import zhihu.service.RoundTableService;
import zhihu.service.SuperService;
import zhihu.service.UserService;

import com.google.gson.Gson;

public class RoundCompereServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RoundCompereServlet() {
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
		String userId=null;
		if(request.getParameter("b").equals("compere")){
			SuperService superService = new SuperService();
			String roundtableId = request.getParameter("yzid");
			List<SuperEntity> superEntities = superService.selectSpperby("roundtablecompere", roundtableId, "");
			List<UserEntity> userEntityList = new ArrayList<UserEntity>();
			if(superEntities.size() != 0){
				for(SuperEntity superEntity : superEntities){
					UserService userService = new UserService();		
					UserEntity userEntity1 = userService.findCompere(superEntity.getId2());
					userEntityList.add(userEntity1);
					
				}
			}
			
			
			Gson gson = new Gson();
			String str = gson.toJson(userEntityList);
			System.out.println(str);
			out.print(str);
		}else if(request.getParameter("b").equals("gueste")){
			SuperService superService = new SuperService();
			String roundtableId = request.getParameter("yzid");
			List<SuperEntity> superEntities = superService.selectSpperby("roundtablegueste", roundtableId, "");
			List<UserEntity> userEntityList = new ArrayList<UserEntity>();
			if(superEntities.size() != 0){
				for(SuperEntity superEntity : superEntities){
					UserService userService = new UserService();
					UserEntity userEntity1 = userService.findCompere(superEntity.getId2());
					userEntityList.add(userEntity1);
				}
			}
			Gson gson = new Gson();
			String str = gson.toJson(userEntityList);
			System.out.println(str);
			out.print(str);
		}else if(request.getParameter("b").equals("findIntroduce")){
			SuperService superService = new SuperService();
			String roundtableId = request.getParameter("yzid");
			List<SuperEntity> superEntities = superService.selectSpperby("roundtablecompere", roundtableId, "");
			List<UserEntity> userEntityList = new ArrayList<UserEntity>();
			if(superEntities.size() != 0){
				for(SuperEntity superEntity : superEntities){
					UserService userService = new UserService();		
					UserEntity userEntity1 = userService.findCompere(superEntity.getId2());
					userEntityList.add(userEntity1);
					
				}
			}
			List<PersonalDataEntity> perDataEntityList = new ArrayList<PersonalDataEntity>();
			
			if(userEntityList.size() != 0){
				for (int i = 0; i < userEntityList.size(); i++) {
					userId= userEntityList.get(i).getId();
					if(userEntityList.size()>1){
						System.out.println("userId"+(i+1)+"="+userId);
						userId= userEntityList.get(i).getId();
					}else{
						System.out.println("userId="+userId);
					}
					UserService userService = new UserService();		
					PersonalDataEntity personalDataEntity = userService.findIntroduce(userId);
					perDataEntityList.add(personalDataEntity);
				}
			}
			
			Gson gson = new Gson();
			String str = gson.toJson(perDataEntityList);
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
	public static void Find(){
		
	}

}
