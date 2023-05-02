package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.vo.ProductVO;

public class ProductViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pIdx = Integer.parseInt(request.getParameter("pIdx")); //제품번호
		//System.out.println("pIdx : " + pIdx);
		int nowPage = Integer.parseInt(request.getParameter("nowPage")); //현재페이지
		
		ProductVO vo = ProductDAO.getProductOne(pIdx); //제품번호로 제품정보검색(결과 1개)
		
		HttpSession session = request.getSession();
		
		session.setAttribute("vo", vo); //제품데이터 저장
		session.setAttribute("productVo", vo); //제품데이터 저장
		session.setAttribute("nPage", nowPage); //현재페이지 저장
		
		//return "productView.jsp";
		return "cartIndex.jsp";
	}
}
