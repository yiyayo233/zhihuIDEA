package zhihu.servlet;

import zhihu.service.PersonalDataService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PersonalDataServlet")
public class PersonalDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void addPersonalData(HttpServletRequest request, HttpServletResponse response,String id, String introduce, String sex,String address, String industry, String professionalExperience,String educationExperience, String personalCertificate,String personalExperience, String editTime){
        PersonalDataService PersonalDataService = new PersonalDataService();
        PersonalDataService.AddPersonalDataDao(id, introduce, sex, address, industry, professionalExperience, educationExperience, personalCertificate, personalExperience, editTime);
    }
}
