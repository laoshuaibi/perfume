package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemsDao;
import entity.Cart;
import entity.Items;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/servlet/CartServlet")
public class CartServlet extends HttpServlet {
	private String action;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		if(request.getParameter("action")!=null) {
			this.action = request.getParameter("action");
			if(action.equals("add")) {
				addToCart(request, response);
				response.getWriter().print(getNum(request,response));
			}
			if(action.equals("show")) {
				request.getRequestDispatcher("/cart.jsp").forward(request, response);
			}
			if(action.equals("delete")) {
				deleteFormCart(request,response);
				response.getWriter().print(getNum(request,response));
			}
			if(action.equals("sum")) {
				response.getWriter().print(getNum(request,response));
			}
		}
	}

	private void deleteFormCart(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		Items item = ItemsDao.getItemsById(Integer.parseInt(id));
		cart.removeGoodsFromCart(item);
	}

	private boolean addToCart(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String  id = request.getParameter("id");
		String number = request.getParameter("num");
		Items item = ItemsDao.getItemsById(Integer.parseInt(id));
		if(request.getSession().getAttribute("cart")==null) {
			Cart cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart.addGoodsInCart(item, Integer.parseInt(number))) {
			return true;
		}
		else {
			return false;
		}
	}
	private int getNum(HttpServletRequest request, HttpServletResponse response) {
		int num = 0;
		if(request.getSession().getAttribute("cart")!=null) {
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			num = cart.getNum();
		}
		return num;
	}
}
