package controller.command.auth;

import entity.User;
import org.mindrot.jbcrypt.BCrypt;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/register")
public class GetFormRegistrationCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String jspPage = "/WEB-INF/views/registration.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/register");
    }

//    private Optional<User> getInput(HttpServletRequest request) {
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//
//
//        return UserService.getInstance().createUser();
//    }
}
