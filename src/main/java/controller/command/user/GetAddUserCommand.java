package controller.command.user;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Go to the form of adding a new user (registration form).
 */

@WebServlet("/addClient")
public class GetAddUserCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // TODO: add path
        String jspPage = "";
        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);    }
}
