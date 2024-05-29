package controller.command.item;

import dto.ItemDto;
import entity.Category;
import entity.Item;
import service.ItemService;
import validator.entity.ItemDtoValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/admin/uploadItem")
@MultipartConfig
public class PostAddItemCommand extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDto dto = getInput(request);
        List<String> errors = validate(dto);

        if(errors.isEmpty()) {
            ItemService.getInstance().create(dto);

            List<Item> items = ItemService.getInstance().getAllItems();

            HttpSession session = request.getSession();
            session.setAttribute("items", items);
            // TODO: add path to go after successful adding new item
            String jspPage = "/items.jsp";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("errors", errors);
            session.setAttribute("itemDto", dto);
            // TODO: add path to go after NOT successful adding new item
            String jspPage = "";
            String redirectURL = request.getContextPath() + jspPage;
            response.sendRedirect(redirectURL);
        }

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
