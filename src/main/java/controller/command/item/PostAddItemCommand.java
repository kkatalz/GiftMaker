package controller.command.item;

import dto.ItemDto;
import entity.Category;
import entity.Item;
import entity.User;
import service.CategoryService;
import service.ItemService;
import validator.entity.ItemDtoValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/addItem")
@MultipartConfig
public class PostAddItemCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String jspPage = "/home";
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("currentUser");
            if(user != null && user.getRole().getValue().equals("administrator")) {
                session.setAttribute("categories", CategoryService.getInstance().getAllCategories());

                // TODO: add path
                jspPage = "/WEB-INF/views/createItemDetails.jsp";
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDto dto = getInput(request);
        List<String> errors = validate(dto);
        HttpSession session = request.getSession(false);

        String jspPage = "";
        if(errors.isEmpty() && session != null) {
            User user = (User) session.getAttribute("currentUser");
            if(user != null && user.getRole().getValue().equals("administrator")) {
                ItemService.getInstance().create(dto);
                List<Item> items = ItemService.getInstance().getAllItems();

                session.setAttribute("items", items);
                // TODO: add path to go after successful adding new item
                jspPage = "/items.jsp";
            }

            // unauthorized access
            else {
                // TODO: complete path in case of unauthorized access
                jspPage = "";
            }

        }
        else if(session != null){
            session.setAttribute("errors", errors);
            session.setAttribute("itemDto", dto);
            // TODO: add path to go after NOT successful adding new item
            jspPage = "";
        }

        // session is null
        else {
            // complete path, the same as unauthorized access
            jspPage = "";
        }

        String redirectURL = request.getContextPath() + jspPage;
        response.sendRedirect(redirectURL);
    }

    private ItemDto getInput(HttpServletRequest request) throws ServletException, IOException {
        List<Part> parts = request.getParts().stream().filter(part -> "files".equals(part.getName()) && part.getSize() > 0)
                .collect(Collectors.toList());
        return new ItemDto.Builder()
                .setCategory(new Category.Builder().setCategoryId(Integer.parseInt(request.getParameter("category"))).build())
                .setName(request.getParameter("name"))
                .setPrice(request.getParameter("price"))
                .setDescription(request.getParameter("description"))
                .setAmount(request.getParameter("amount"))
                .setAage(request.getParameter("age"))
                .setPart(parts)
                .build();
    }

    private List<String> validate(ItemDto dto) {
        return ItemDtoValidator.getInstance().validate(dto);
    }
}
