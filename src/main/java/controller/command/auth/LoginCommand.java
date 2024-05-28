package controller.command.auth;

import entity.User;
import org.mindrot.jbcrypt.BCrypt;
import service.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

/**
 * To login, check username and password. In case of successful logging in, the user will be saved in current
 * session.
 */

@WebServlet("/login")
public class LoginCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Optional<User> user = getInput(request);

        // successful logging in
        if(user.isPresent()) {
            HttpSession session = request.getSession(true);
            session.setAttribute("currentUser", user.get());

            // TODO: add path to go after successful logging in
            String jspPage = "";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }

        // not successful logging in
        else {
            // TODO: add path to go after NOT successful logging in
            String jspPage = "/index.jsp";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }
    }

    private Optional<User> getInput(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Optional<User> potentialUser = UserService.getInstance().getUserByUsername(username);

        if(potentialUser.isPresent()) {
            if(BCrypt.checkpw(password, potentialUser.get().getEncryptedPassword())) {
                return potentialUser;
            }
        }
        return Optional.empty();
    }
}
