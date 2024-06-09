package controller.command.item;

import dto.ItemDto;
import dto.PossibleItemDto;
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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet("/administrator/createItemDetails")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class PostAddItemAdminCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String jspPage = "/WEB-INF/views/createItemDetailsAdmin.jsp";
        HttpSession session = request.getSession(false);
        if (session != null) {
            List<Category> categories = CategoryService.getInstance().getAllCategories();
            session.setAttribute("categories", categories);

            RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDto dto = getInput(request);
        List<String> errors = new ArrayList<>();
        HttpSession session = request.getSession(false);
        CategoryService categoryService = CategoryService.getInstance();
        List<Category> categories = categoryService.getAllCategories();
        session.setAttribute("categories", categories);

        ItemService itemService = ItemService.getInstance();

        String jspPage = "";
        System.out.println(errors);
        if (errors.isEmpty() && session != null) {
            User user = (User) session.getAttribute("currentUser");
            if (user != null && user.getRole().getValue().equals("administrator")) {

                itemService.create(dto);
                List<Item> items = ItemService.getInstance().getAllItems();
                session.setAttribute("items", items);
                jspPage = "/WEB-INF/views/allItems.jsp";
            } else {
                jspPage = "/WEB-INF/views/login.jsp";
            }
        } else if (session != null) {
            session.setAttribute("errors", errors);
            session.setAttribute("itemDto", dto);
            jspPage = "/WEB-INF/views/createItemDetailsAdmin.jsp";
        } else {
            jspPage = "/WEB-INF/views/login.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    private ItemDto getInput(HttpServletRequest request) throws ServletException, IOException {
        List<Part> parts = request.getParts().stream().filter(part -> part.getName().startsWith("file") && part.getSize() > 0)
                .collect(Collectors.toList());

        System.out.println("Number of file parts: " + parts.size());

        for (Part part : parts) {
            System.out.println("File name: " + part.getSubmittedFileName() + ", size: " + part.getSize());
        }

        System.out.println(request.getParts().size());

        System.out.println(request.getParameter("name"));
        System.out.println(request.getParameter("price"));
        System.out.println(request.getParameter("description"));
        System.out.println(request.getParameter("age"));
        System.out.println("id category " + request.getParameter("selectedCategory"));
        System.out.println("category" + new Category.Builder().setCategoryId(Integer.parseInt(request.getParameter("selectedCategory"))).build());

        return new ItemDto.Builder()
                .setName(request.getParameter("name"))
                .setPrice(request.getParameter("price"))
                .setDescription(request.getParameter("description"))
                .setAage(request.getParameter("age"))
                .setCategory(new Category.Builder().setCategoryId(Integer.parseInt(request.getParameter("selectedCategory"))).build())
                .setAmount(request.getParameter("amount"))
                .setPart(parts)
                .build();
    }

}