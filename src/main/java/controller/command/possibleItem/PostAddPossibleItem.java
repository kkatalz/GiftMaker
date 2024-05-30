package controller.command.possibleItem;

import dto.PossibleItemDto;
import entity.User;
import service.PossibleItemService;
import validator.entity.PossibleItemDtoValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Get user's input and add PossibleItem to the database.
 */

@WebServlet("/addPossibleItem")
public class PostAddPossibleItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if (session == null) {
            // TODO: unauthorized access
            jspPage = "";
        } else {
            User user = (User) session.getAttribute("currentUser");
            if (user != null && user.getRole().getValue().equals("client")) {
                PossibleItemDto dto = getInput(request);
                List<String> errors = validate(dto);

                // correct input
                if (errors.isEmpty()) {
                    PossibleItemService.getInstance().create(dto);
                    // TODO: successful result after adding possibleItem
                    jspPage = "";

                } else { // not correct input
                    session.setAttribute("errors", errors);
                    session.setAttribute("possibleItemDto", dto);
                    // TODO: link to the same form for adding possible item
                    jspPage = "";
                }

            } else {
                // TODO: unauthorized access
                jspPage = "";
            }
        }

        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }

    private PossibleItemDto getInput(HttpServletRequest request) throws ServletException, IOException {
        List<Part> parts = request.getParts().stream().filter(part -> "files".equals(part.getName()) && part.getSize() > 0)
                .collect(Collectors.toList());
        return new PossibleItemDto.Builder()
                .setName(request.getParameter("name"))
                .setPrice(request.getParameter("price"))
                .setDescription(request.getParameter("description"))
                .setAge(request.getParameter("age"))
                .setParts(parts)
                .build();
    }

    private List<String> validate(PossibleItemDto dto) {
        return PossibleItemDtoValidator.getInstance().validate(dto);
    }
}
