package com.shoppingmall.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.vo.ProductVO;

public class ProductCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProductVO> list = ProductDAO.getProductAll(); //전체 리스트
		request.setAttribute("list", list); //전체 리스트 저장
		return "productList.jsp";
		
		/* 페이징 처리 정한 이후 다시
		ProductPaging pg = new ProductPaging();
		pg.setTotalProduct(ProductDAO.getCountAll()); //제품전체 갯수
		
		String nowPage = request.getParameter("nowPage"); //현재페이지
		if (nowPage != null) {
			pg.setNowPage(Integer.parseInt(nowPage));
		} else {
			pg.setNowPage(1);
		}
		pg.setEnd(); //제품 끝번호
		pg.setBegin(); //제품 시작번호
		
		pg.setTotalPage(); //전체페이지 갯수
		
		List<ProductVO> list = ProductDAO.getPageList(pg.getBegin(), pg.getEnd()); //선택페이지 리스트
		
		//선택페이지 리스트 저장
		request.setAttribute("list", list);
		//페이지 데이터 저장
		request.setAttribute("vo", pg);
		
		return "productList.jsp";
		*/
	}

}
