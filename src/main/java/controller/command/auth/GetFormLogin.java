package controller.command.auth;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Go to page of logging in.
 */

@WebServlet("/formLogin")
public class GetFormLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // TODO: add path to go to the form of logging in
        String jspPage = "/login.jsp";
        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }
}
