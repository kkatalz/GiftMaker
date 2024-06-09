package controller.command.item;
import dto.ItemDto;
import dto.PossibleItemDto;
import entity.Category;
import entity.Item;
import entity.PossibleItem;
import entity.User;
import service.CategoryService;
import service.ItemService;
import service.PossibleItemService;
import validator.entity.ItemDtoValidator;
import validator.entity.PossibleItemDtoValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet("/client/createItemDetails")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class PostAddItemCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String jspPage = "/WEB-INF/views/createItemDetails.jsp";
        HttpSession session = request.getSession(false);
        if (session != null) {
                List<Category> categories = CategoryService.getInstance().getAllCategories();
                session.setAttribute("categories", categories);

                RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
                dispatcher.forward(request, response);
        }else {
            response.sendRedirect(request.getContextPath() + "/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PossibleItemDto dto = getInput(request);
        List<String> errors = PossibleItemDtoValidator.getInstance().validate(dto);
        HttpSession session = request.getSession(false);
        CategoryService categoryService = CategoryService.getInstance();
        List<Category> categories = categoryService.getAllCategories();
        session.setAttribute("categories", categories);

        PossibleItemService possibleItemService = PossibleItemService.getInstance();

        String jspPage = "";
        System.out.println(errors);
        if(errors.isEmpty() && session != null) {
            User user = (User) session.getAttribute("currentUser");
            if(user != null && !user.getRole().getValue().equals("administrator")) {

                possibleItemService.create(dto);
                List<Item> items = ItemService.getInstance().getAllItems();
                session.setAttribute("items", items);
                jspPage = "/WEB-INF/views/allItems.jsp";
            } else {
                jspPage = "/WEB-INF/views/login.jsp";
            }
        } else if(session != null){
            session.setAttribute("errors", errors);
            session.setAttribute("itemDto", dto);
            jspPage = "/WEB-INF/views/createItemDetails.jsp";
        } else {
            jspPage = "/WEB-INF/views/login.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    private PossibleItemDto getInput(HttpServletRequest request) throws ServletException, IOException {
        List<Part> parts = request.getParts().stream().filter(part -> part.getName().startsWith("file") && part.getSize() > 0)
                .collect(Collectors.toList());

        System.out.println("Number of file parts: " + parts.size());

        for (Part part : parts) {
            System.out.println("File name: " + part.getSubmittedFileName() + ", size: " + part.getSize());
            // Add logic to save or process each file
        }

        System.out.println(request.getParts().size());

        System.out.println(request.getParameter("name"));
        System.out.println(request.getParameter("price"));
        System.out.println(request.getParameter("description"));
        System.out.println(request.getParameter("age"));

        return new PossibleItemDto.Builder()
                .setName(request.getParameter("name"))
                .setPrice(request.getParameter("price"))
                .setDescription(request.getParameter("description"))
                .setAge(request.getParameter("age"))
                .setParts(parts)
                .build();
    }

    private List<String> validate(ItemDto dto) {
        return ItemDtoValidator.getInstance().validate(dto);
    }
}
