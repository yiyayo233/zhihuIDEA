package zhihu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import zhihu.entity.ColumnEntity;
import zhihu.entity.ColumnPage;
import zhihu.service.ColumnService;

public class ColumnServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ColumnServlet() {
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
		String name = request.getParameter("name");
		ColumnService cnser = new ColumnService();
		Gson gson = new Gson();
		
		
		if("1".equals(name)){
			List<ColumnEntity> cnList = cnser.select();
			String cnstr = gson.toJson(cnList);
			System.out.println(cnstr);
			out.print(cnstr);
		}else if("2".equals(name)){
			int curr=1;
			String currPage = request.getParameter("curr");
			if(currPage!=null){
				curr=Integer.parseInt(currPage);
			}
			int size=8;
			String pagesize =request.getParameter("size");
			if(pagesize!=null){
				size=Integer.parseInt(pagesize);
			}
			List<ColumnEntity> allList = cnser.selectLimit(curr,size);
			String allstr = gson.toJson(allList);
			System.out.println(allstr);
			out.print(allstr);
		}else if("3".equals(name)){
			int curr=1;
			String currPage = request.getParameter("curr");
			if(currPage!=null){
				curr=Integer.parseInt(currPage);
			}
			int size=8;
			String pagesize =request.getParameter("size");
			if(pagesize!=null){
				size=Integer.parseInt(pagesize);
			}
			List<ColumnEntity> allList = cnser.selectLimit(curr,size);
			//获取总的记录数
			int total = cnser.getCount();
			ColumnPage cp = new ColumnPage(curr, size, allList, total);
			String allstrcp = gson.toJson(cp);
			System.out.println(allstrcp);
			out.print(allstrcp);
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
