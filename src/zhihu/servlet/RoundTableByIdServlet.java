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

import zhihu.entity.PEntity;
import zhihu.entity.QuestionEntity;
import zhihu.entity.RoundTableCompereContainerEntity;
import zhihu.entity.RoundtableContainerEntity;
import zhihu.entity.RoundtableEntity;
import zhihu.entity.SuperEntity;
import zhihu.entity.UserEntity;
import zhihu.service.PService;
import zhihu.service.QuestionService;
import zhihu.service.RoundTableService;
import zhihu.service.SuperService;
import zhihu.service.UserService;

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
		request.setAttribute("Allrt", roundtable);
		
		
		/*PService pser = new PService();
		List<PEntity> pList = pser.selectById(id);
		request.setAttribute("pList", pList);
		SuperService superService = new SuperService();
		List<RoundTableCompereContainerEntity> roundTableCompereContainerEntities = new ArrayList<RoundTableCompereContainerEntity>();
		List<SuperEntity> superEntities2 = superService.selectSpper("roundtablecompere");
		for (SuperEntity superEntity : superEntities2) {
			RoundTableService roundTableService = new RoundTableService();
			RoundtableEntity roundtableEntity = roundTableService.select(superEntity.getId1());
			
			UserService userService = new UserService();
			List<UserEntity> userEntityList = userService.findCompere(superEntity.getId2());
			roundTableCompereContainerEntities.add(new RoundTableCompereContainerEntity(roundtableEntity,userEntityList));
		}
		HttpSession se = request.getSession();
		se.setAttribute("CompereList", roundTableCompereContainerEntities);
		//设置10秒有效 秒为单位
		se.setMaxInactiveInterval(999999);
		Gson gson = new Gson();
		String str = gson.toJson(roundTableCompereContainerEntities);
		System.out.println(str);
		out.print(str);*/

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
