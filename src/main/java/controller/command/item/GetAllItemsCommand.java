package controller.command.item;

import dao.DaoFactory;
import entity.Item;
import service.ItemService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/allItems")
public class GetAllItemsCommand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ItemService itemService = new ItemService(DaoFactory.getDaoFactory());
        List<Item> items = itemService.getAllItems();

        HttpSession session = request.getSession();
        session.setAttribute("items", items);

//        System.out.println("items: ");
        System.out.println(items);

        String jspPage = "/WEB-INF/views/allItems.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String search = request.getParameter("search");
        String fromPriceStr = request.getParameter("fromPrice");
        String toPriceStr = request.getParameter("toPrice");
        String category = request.getParameter("category");
        String fromAge = request.getParameter("fromDate");
        String toAge = request.getParameter("toDate");

        System.out.println("search: " + search);


        ItemService itemService = new ItemService(DaoFactory.getDaoFactory());
        // empty list
        List<Item> items = itemService.searchItemByNameOrId(search);;

        // Filter items based on search parameters

        if (search != null && !search.isEmpty()) {
            items = itemService.searchItemByNameOrId(search);
        }

        // get items names
        System.out.println("items: "+ items.stream().map(Item::getName).collect(Collectors.toList()));
//
//        if ((fromPriceStr != null && !fromPriceStr.isEmpty() ) || (toPriceStr != null && !toPriceStr.isEmpty())) {
//            double fromPrice = Double.parseDouble(fromPriceStr);
//            double toPrice = Double.parseDouble(toPriceStr);
//
//            if(fromPriceStr == null) {
//               fromPrice = 0;
//            }
//            if(toPriceStr == null) {
//               toPrice = Double.MAX_VALUE;
//            }
//            items = itemService.filterByPrice(BigDecimal.valueOf(fromPrice),BigDecimal.valueOf(toPrice));
//        }
//
//        if(fromAge != null && !fromAge.isEmpty() && toAge != null && !toAge.isEmpty()) {
//            items = itemService.filterByAge(Integer.parseInt(fromAge), Integer.parseInt(toAge));
//        }

        HttpSession session = request.getSession();
        session.setAttribute("items", items);

        String jspPage = "/WEB-INF/views/allItems.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}
