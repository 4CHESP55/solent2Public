package org.solent.com504.oodd.cart.spring.web;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.solent.com504.oodd.cart.model.service.ShoppingService;
import org.solent.com504.oodd.cart.model.service.ShoppingCart;
import org.solent.com504.oodd.cart.model.dto.ShoppingItem;
import org.solent.com504.oodd.cart.web.WebObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class MVCController {

    // this redirects calls to the root of our application to index.html 
    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String index(Model model) {
        return "redirect:/index.html";
    }

    /**
     * This just throws a runtime exception to show error handler working
     * @return 
     */
    @RequestMapping(value = "/xxxhome", method = {RequestMethod.GET, RequestMethod.POST})
    public String xxxCart(
            Model model,
            HttpSession session) {

        if (true) {
            throw new RuntimeException("error caused by request to /xxxhome");
        }
        return "home";
    }
    
    // now provides the business logic and a model to the jspexample3d.jsp when /userlist is requested 
    @RequestMapping(value = "/home", method = {RequestMethod.GET, RequestMethod.POST})
    public String home(@RequestParam(name = "action", required = false) String action,
            @RequestParam(name = "itemName", required = false) String itemName,
            @RequestParam(name = "itemUUID", required = false) String itemUuid,
            Model model,
            HttpSession session) {

        String message = "";

        ShoppingService shoppingService = WebObjectFactory.getShoppingService();

        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        if (shoppingCart == null) {
            shoppingCart = WebObjectFactory.getNewShoppingCart();
            session.setAttribute("shoppingCart", shoppingCart);
        }

        if ("addItemToCart".equals(action)) {
            message = "adding " + itemName + " to cart";
            ShoppingItem shoppingItem = shoppingService.getNewItemByName(itemName);
            shoppingCart.addItemToCart(shoppingItem);
        } else if ("removeItemFromCart".equals(action)) {
            message = "removing " + itemName + " from cart";
            shoppingCart.removeItemFromCart(itemUuid);
        } else if ("reduceItemFromCart".equals(action)) {
            message = "reducing  " + itemName + " in cart";
            shoppingCart.reduceItemFromCart(itemUuid);
        } else if ("increaseItemFromCart".equals(action)) {
            message = "increasing " + itemName + " in cart";
            shoppingCart.increaseItemFromCart(itemUuid);
        } else {
            message = "action=" + action;
        }
        
        model.addAttribute("shoppingService", shoppingService);
        
        return "home";
    }

    // this simply calls the jspexample3d-modify.jsp page (without any modifications) when /userlist-modify is requested 
    @RequestMapping(value = "/userlist-modify", method = {RequestMethod.GET, RequestMethod.POST})
    public String jspexample3dModify(@RequestParam(name = "action", required = false) String action,
            @RequestParam(name = "userName", required = false) String name,
            @RequestParam(name = "userAddress", required = false) String address,
            @RequestParam(name = "index", required = false) String index,
            Model model,
            HttpSession session) {
        
        // retrieve the stored users list from the session
        List<User> users = (List<User>) session.getAttribute("usersList");
        if (users == null) {
            users = new ArrayList<User>();
            session.setAttribute("usersList", users);
        }
        
        int i = Integer.parseInt(index);
        User user = users.get(i);
    
        if ("modifyUser".equals(action)) {
        user.setAddress(address);
        user.setName(name);
        }
        
        model.addAttribute("user", user);
        model.addAttribute("index", index);
        
        return "jspexample3d-modify";
    }
    

    /*
     * Default exception handler, catches all exceptions, redirects to friendly
     * error page. Does not catch request mapping errors
     */
    @ExceptionHandler(Exception.class)
    public String myExceptionHandler(final Exception e, Model model, HttpServletRequest request) {
        final StringWriter sw = new StringWriter();
        final PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        final String strStackTrace = sw.toString(); // stack trace as a string
        String urlStr = "not defined";
        if (request != null) {
            StringBuffer url = request.getRequestURL();
            urlStr = url.toString();
        }
        model.addAttribute("requestUrl", urlStr);
        model.addAttribute("strStackTrace", strStackTrace);
        model.addAttribute("exception", e);
        //logger.error(strStackTrace); // send to logger first
        return "error"; // default friendly exception message for user
    }

}
