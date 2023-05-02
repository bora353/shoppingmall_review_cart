package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.vo.ProductVO;


public class ProductSaveCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String path = "C:/MyStudy/60_Web/shoppingmall/WebContent/temp";
		String path = "C:/MyStudy/60_Web/shoppingmall/WebContent/img";
		
		MultipartRequest mr = new MultipartRequest(
				request, path, (10 * 1024 * 1024), "UTF-8",
				new DefaultFileRenamePolicy());
		
		ProductVO vo = new ProductVO();
		vo.setCategory(mr.getParameter("category"));
		vo.setProduct(mr.getParameter("product"));
		vo.setPrice(Integer.parseInt(mr.getParameter("price")));
		vo.setpId(mr.getParameter("pId"));
		vo.setReName(mr.getFilesystemName("filename"));
		vo.setOriName(mr.getOriginalFileName("filename"));
		vo.setpIntroduce(mr.getParameter("pIntroduce"));
		//System.out.println("vo.getpId() : " + vo.getpId());
		
		ProductDAO.setProduct(vo);
		return "controller?type=productList";
	}

}
