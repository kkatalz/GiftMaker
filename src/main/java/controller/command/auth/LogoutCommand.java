package controller.command.auth;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if(session != null) {
            session.removeAttribute("currentUser");
            session.invalidate();
        }

        String jspPage = "/login";
        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }
}
