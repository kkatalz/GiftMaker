package controller.command.possibleItem;

import dto.ItemDto;
import entity.Category;
import entity.PossibleItem;
import entity.User;
import service.ItemService;
import service.PossibleItemService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * To approve offered gift (possible item) and add it to the database. Function available only for
 * administrator.
 */

@WebServlet("/approveItem")
public class ApprovePossibleItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        String jspPage;
        if(session == null) {
            jspPage = "/WEB-INF/views/login.jsp";
        }

        else { // session is not null
            User user = (User) session.getAttribute("currentUser");
            if(user != null && user.getRole().getValue().equals("administrator")) {
                int possibleItemId = Integer.parseInt(request.getParameter("possibleItemId"));
                PossibleItem possibleItem = PossibleItemService.getInstance().getPossibleItemById(possibleItemId).get();

                // creating an item from possible item and user's input
                ItemDto itemDto = getInput(request);
                itemDto.setName(possibleItem.getName());
                itemDto.setPrice(possibleItem.getPrice().toString());
                itemDto.setDescription(possibleItem.getDescription());
                itemDto.setAge(String.valueOf(possibleItem.getAge()));
                itemDto.setImageBytes(possibleItem.getImageBytes());


                // delete from the table Possible_Item
                PossibleItemService.getInstance().delete(possibleItemId);
                // add Item to the database (table Item)
                ItemService.getInstance().create(itemDto);

                session.setAttribute("possibleItems", PossibleItemService.getInstance().getAllPossibleItems());
                jspPage = "/WEB-INF/views/offeredGifts.jsp";


            }

            else {
                jspPage = "/WEB-INF/views/login.jsp";
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);

    }

    private ItemDto getInput(HttpServletRequest request) {
        return new ItemDto.Builder()
                .setCategory(new Category.Builder().setCategoryId(Integer.parseInt(request.getParameter("idCategory"))).build())
//                .setAmount(request.getParameter("amount"))
                .setAmount("1")
                .build();
    }
}