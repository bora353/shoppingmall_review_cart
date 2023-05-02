package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.vo.ProductVO;

public class ProductEditDeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pIdx = ((ProductVO)session.getAttribute("vo")).getpIdx();
		//System.out.println("pIdx : " + pIdx);
		ProductDAO.setDelete(pIdx);
		return "controller?type=productList";
	}

}
