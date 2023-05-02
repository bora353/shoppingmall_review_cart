package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.vo.ProductMemberVO;


public class ProductMemberCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		try {
			ProductMemberVO vo = ProductDAO.getmember(id);
			if (vo.getPassword().equals(pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				return "controller?type=productList";
			}
		} catch (NullPointerException ne) {}
		return "productFail.jsp";
	}
}
