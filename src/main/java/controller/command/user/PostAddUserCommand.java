package controller.command.user;

import dto.UserDto;
import entity.Role;
import service.UserService;
import validator.entity.UserDtoValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

/**
 * To add new user (client).
 */

@WebServlet("/sendNewClient")
public class PostAddUserCommand extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDto dto = getInput(request);
        List<String> errors = validateInput(dto);
        HttpSession session = request.getSession();

        // success
        if(errors.isEmpty()) {
            try {
                UserService.getInstance().createUser(dto);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            // TODO: add path to go after successful adding new client
            String jspPage = "";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }


        else {
            // TODO: add path to go after NOT successful adding new client
            // failure scenario
            session.setAttribute("errors", errors);
            session.setAttribute("userDto", dto);
            String jspPage = "";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }

    }

    private UserDto getInput(HttpServletRequest request) {
        return new UserDto.Builder()
                .setName(request.getParameter("name"))
                .setSurname(request.getParameter("surname"))
                .setDateOfBirth(request.getParameter("dateOfBirth"))
                .setRole(Role.forValue("client"))
                .setUsername(request.getParameter("username"))
                .setPassword(request.getParameter("password"))
                .build();
    }

    private List<String> validateInput(UserDto dto) {
        return UserDtoValidator.getInstance().validate(dto);
    }
}
