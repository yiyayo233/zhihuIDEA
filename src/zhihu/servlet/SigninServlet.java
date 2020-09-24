package zhihu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpCookie;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import zhihu.common.ProduceRandomNumder;
import zhihu.entity.UserEntity;
import zhihu.service.UserService;

public class SigninServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SigninServlet() {
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

		String phoneOrEmail = request.getParameter("userName");
		String pass = request.getParameter("userpass");
		String passZ = request.getParameter("userpassZ");
		String a = request.getParameter("a");
		if ("exit".equals(a)){
			exit(request, response, out);
			return;
		}

		UserService userService = new UserService();
		ProduceRandomNumder produceRandomNumder = new ProduceRandomNumder();

		if(null == passZ){
			login(request, response, out, userService, pass, phoneOrEmail);
		}else {
			enroll(request, response, out, produceRandomNumder, userService, pass, phoneOrEmail);
		}
	}

	/**
	 * 退出
	 * @param request
	 * @param response
	 * @param out
	 * @throws IOException
	 */
	private void exit(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException {
		Cookie[] cookies = request.getCookies();
		boolean f = false;
		for (Cookie cookie:
				cookies) {
			if (cookie.getName().equals("uId")){
				cookie.setMaxAge(0);
				f = true;
			}
			if (cookie.getName().equals("uName")){
				cookie.setMaxAge(0);
				f = true;
			}
			if (cookie.getName().equals("uChatHead")){
				cookie.setMaxAge(0);
				f = true;
			}
		}
		if (f){
			response.sendRedirect("html/signin.jsp");
			return;
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


	/**
	 * 登录
	 * @param request
	 * @param response
	 * @param userService
	 * @param pass
	 * @param phoneOrEmail
	 */
	public void login(HttpServletRequest request, HttpServletResponse response, PrintWriter out, UserService userService, String pass, String phoneOrEmail) throws IOException {
		UserEntity UserEntity;
		if (phoneOrEmail.indexOf("@") == -1){
			UserEntity = userService.login(pass, phoneOrEmail, "");
		}else {
			UserEntity = userService.login(pass, "", phoneOrEmail);
		}
		if (null != UserEntity){
			String uId = UserEntity.getId();
			Cookie uIdC = new Cookie("uId",uId);
			String uName = UserEntity.getName();
			Cookie uNameC = new Cookie("uName",uName);
			String uChatHead = UserEntity.getChatHead();
			Cookie uChatHeadC = new Cookie("uChatHead",uChatHead);
			System.out.println("uId:"+uId+"\tuName:"+uName+"\tuChatHead:"+uChatHead);

			uIdC.setMaxAge(60*60*24*31);
			response.addCookie(uIdC);
			uNameC.setMaxAge(60*60*24*31);
			response.addCookie(uNameC);
			uChatHeadC.setMaxAge(60*60*24*31);
			response.addCookie(uChatHeadC);
			out.println("loginTrue");
		}else {
			out.println("loginFalse");
		}
	}

	/**
	 * 注册
	 * @param request
	 * @param response
	 * @param produceRandomNumder
	 * @param userService
	 * @param pass
	 * @param phoneOrEmail
	 */
	public void enroll(HttpServletRequest request, HttpServletResponse response, PrintWriter out, ProduceRandomNumder produceRandomNumder, UserService userService, String pass, String phoneOrEmail) throws UnsupportedEncodingException {
		String id = "yh" + produceRandomNumder.randomNumder(8);
		//todo 用户名乱码
		String name = "知乎用户" + id.substring(6);
		String chatHead = "da8e974dc_is.jpg";

		System.out.println(name);
		int result;
		if (phoneOrEmail.indexOf("@") == -1){
			result = userService.addUser(id, name, pass, chatHead, phoneOrEmail, "");
		}else {
			result = userService.addUser(id, name, pass, chatHead, "", phoneOrEmail);
		}
		if (result > 0){
			out.println("enrollTrue");
		}else {
			out.println("enrollFalse");
		}
	}


}
