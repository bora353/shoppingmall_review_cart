package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.vo.ProductVO;

public class ProductUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String path = "C:/MyStudy/60_Web/shoppingmall/WebContent/temp";
		String path = "C:/MyStudy/60_Web/shoppingmall/WebContent/img";
		
		MultipartRequest mr = new MultipartRequest(
				request, path, (10 * 1024 * 1024), "UTF-8",
				new DefaultFileRenamePolicy());
		
		int pIdx = Integer.parseInt(mr.getParameter("pIdx"));
		
		ProductVO vo = new ProductVO();
		vo.setpIdx(pIdx);
		vo.setCategory(mr.getParameter("category"));
		vo.setProduct(mr.getParameter("product"));
		vo.setPrice(Integer.parseInt(mr.getParameter("price")));
		vo.setpId(mr.getParameter("pId"));
		vo.setpIntroduce(mr.getParameter("pIntroduce"));
		
		HttpSession  session = request.getSession();
		ProductVO sessionVO = (ProductVO)session.getAttribute("vo");
		if (mr.getFile("filename") == null) {
			vo.setReName(sessionVO.getReName());
			vo.setOriName(sessionVO.getOriName());
		} else {
			vo.setReName(mr.getFilesystemName("filename"));
			vo.setOriName(mr.getOriginalFileName("filename"));
		}
		
		System.out.println("OriName : " + vo.getOriName());
		System.out.println("ReName : " + vo.getReName());
		System.out.println("pIdx : " + vo.getpIdx());
		
		ProductDAO.setUpdate(vo);
		session.setAttribute("vo", vo);
		
		String nowPage = request.getParameter("nowPage");
		request.setAttribute("nowPage", nowPage);
		
		return "productView.jsp";
	}

}
