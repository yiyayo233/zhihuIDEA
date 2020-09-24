package zhihu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import zhihu.entity.ColumnAuthorContainerEntity;
import zhihu.entity.ColumnEntity;
import zhihu.entity.ColumnPContainerEntity;
import zhihu.entity.PEntity;
import zhihu.entity.SuperEntity;
import zhihu.entity.UserEntity;
import zhihu.service.ColumnService;
import zhihu.service.PService;
import zhihu.service.SuperService;
import zhihu.service.UserService;

public class ColumnByIdServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ColumnByIdServlet() {
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
		String p = request.getParameter("p");
		String zlId = request.getParameter("zlId");
		if(p.equals("ColumnAuthor")){
			SuperService superService = new SuperService();
			
			List<SuperEntity> superEntities = superService.selectSpperby("columnauthor", zlId, "");
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
		}else if(p.equals("ColumnP")){
			
			List<ColumnPContainerEntity> columnpContainerEntities = new ArrayList<ColumnPContainerEntity>();
			SuperService superService = new SuperService();
			List<SuperEntity> superEntities = superService.selectSpperby("columnp", zlId, "");
			if(superEntities.size()!=0){
				for (SuperEntity superEntity : superEntities) {
					SuperService superService1 = new SuperService();
					List<SuperEntity> superEntitiyList = superService.selectSpperby("columnp", zlId, "");
					ColumnService columnService = new ColumnService();
					ColumnEntity columnEntity;
					if(superEntitiyList.size()!=0){
						columnEntity = columnService.selectById(superEntitiyList.get(0).getId1());
						List<PEntity> pList = new ArrayList<PEntity>();
						for (SuperEntity superEntity2 : superEntitiyList) {
							PService pService = new PService();
							PEntity pEntity = pService.selectById(superEntity2.getId2());
							pList.add(pEntity);
						}
						columnpContainerEntities.add(new ColumnPContainerEntity(columnEntity,pList));
					}
					
					
				}
			}
			Gson gson = new Gson();
			String str = gson.toJson(columnpContainerEntities);
			System.out.println(str);
			out.print(str);
		}else{
			
			String AuthorId = request.getParameter("AuthorId");
			UserService userService = new UserService();
			List<UserEntity> userEntityList = new ArrayList<UserEntity>();
			for (UserEntity userEntity2 : userEntityList) {
				UserEntity userEntites = userService.findCompere(AuthorId);
				userEntityList.add(userEntites);
			}
			Gson gson = new Gson();
			String str = gson.toJson(userEntityList);
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
