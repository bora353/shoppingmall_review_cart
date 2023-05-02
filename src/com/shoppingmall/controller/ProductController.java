package com.shoppingmall.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.command.Command;
import com.shoppingmall.command.ProductAddCommand;
import com.shoppingmall.command.ProductEditCommand;
import com.shoppingmall.command.ProductEditDeCommand;
import com.shoppingmall.command.ProductListCommand;
import com.shoppingmall.command.ProductMemberCommand;
import com.shoppingmall.command.ProductSaveCommand;
import com.shoppingmall.command.ProductUpdateCommand;
import com.shoppingmall.command.ProductViewCommand;

@WebServlet("/product/controller")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Command> commands = null;
	
	@Override
	public void init() throws ServletException {
		commands = new HashMap<String, Command>();
		// product
		commands.put("productMember", new ProductMemberCommand());
		commands.put("productList", new ProductListCommand());
		commands.put("productView", new ProductViewCommand());
		commands.put("productAdd", new ProductAddCommand());
		commands.put("productSave", new ProductSaveCommand());
		commands.put("productEdit", new ProductEditCommand());
		commands.put("productUpdate", new ProductUpdateCommand());
		commands.put("productEditDe", new ProductEditDeCommand());

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		//System.out.println("type: " + type);
		
		Command command = commands.get(type);
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
