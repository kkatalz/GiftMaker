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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet("/createItemDetails")
@MultipartConfig
public class PostAddItemCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String jspPage = "/WEB-INF/views/createItemDetails.jsp";
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("currentUser");
            if(user != null && user.getRole().getValue().equals("administrator")) {
                List<Category> categories = CategoryService.getInstance().getAllCategories();
                session.setAttribute("categories", categories);

                RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
                dispatcher.forward(request, response);
                return;
            }
        }else {
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

        String jspPage = "";
        if(errors.isEmpty() && session != null) {
            User user = (User) session.getAttribute("currentUser");
            if(user != null && user.getRole().getValue().equals("administrator")) {
                System.out.println(dto);
                ItemService.getInstance().create(dto);
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

    private ItemDto getInput(HttpServletRequest request) throws ServletException, IOException {
        List<Part> parts = request.getParts().stream().filter(part -> part.getName().startsWith("file-") && part.getSize() > 0)
                .collect(Collectors.toList());

        CategoryService categoryService = CategoryService.getInstance();

        List<String> base64Images = parts.stream()
                .map(this::convertPartToBase64)
                .collect(Collectors.toList());
        Optional<Category> category = categoryService.getCategoryById(Integer.parseInt(request.getParameter("category")));
        return new ItemDto.Builder()
                .setCategory(category.orElse(null))
                .setName(request.getParameter("name"))
                .setPrice(request.getParameter("price"))
                .setDescription(request.getParameter("description"))
                .setAmount(request.getParameter("amount"))
                .setAage(request.getParameter("age"))
                .setBase64Image(base64Images)
                .setPart(parts)
                .build();
    }

    private String convertPartToBase64(Part part) {
        try (InputStream inputStream = part.getInputStream();
             ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            return Base64.getEncoder().encodeToString(byteArrayOutputStream.toByteArray());
        } catch (IOException e) {
            throw new RuntimeException("Error converting image to Base64", e);
        }
    }

    private List<String> validate(ItemDto dto) {
        return ItemDtoValidator.getInstance().validate(dto);
    }
}
