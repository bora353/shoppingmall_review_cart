package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shoppingmall.dao.ReviewDAO;
import com.shoppingmall.vo.ReviewVO;

import sun.java2d.pipe.SpanClipRenderer;

public class UpdateOKCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("updateOK Command");
	
		int reviewIdx = Integer.parseInt((String) req.getSession().getAttribute("reviewIdx"));

		//파일을 저장할 위치 지정
		String path =  "C:/Mystudy/60_Web/shoppingmall/WebContent/img";
		//String path = this.getServletContext().getRealPath("/upload");
		//System.out.println("> path : " + path);

		MultipartRequest mr = new MultipartRequest(
				req, //요청객체
				path, //실제 파일을 저장할 경로(업로드 위치)
				10 * 1024 * 1024, //업로드 파일의 최대크기 지정(byte 단위)
				"UTF-8", //인코딩 형식
				new DefaultFileRenamePolicy());
		
		// 전달받은 데이터 VO에 저장 후 DB에 입력처리(DB 연동 작업)
		ReviewVO rvo = new ReviewVO();
		rvo.setSubject(mr.getParameter("subject"));
		rvo.setContent(mr.getParameter("content"));
		rvo.setPwd(mr.getParameter("pwd"));
		rvo.setStar(Integer.parseInt(mr.getParameter("star")));
		rvo.setReviewIdx(reviewIdx);

		// 첨부파일 데이터 처리
		if (mr.getFile("filename") == null){
			//System.out.println(">> 첨부파일 없음");
			rvo.setFileName("noimg.png");
			rvo.setOriName("noimg.png");
		} else {
			//System.out.println(">> 첨부파일 있음");
			rvo.setFileName(mr.getFilesystemName("filename")); //물리적으로 저장되는 파일명
			rvo.setOriName(mr.getOriginalFileName("filename")); //물리적으로 저장되는 파일명
		}
		
		System.out.println("rvo : "+ rvo);
		
		
		//비밀번호 맞는지 확인 후 업데이트해야함
				ReviewVO vo_s = (ReviewVO)req.getSession().getAttribute("vo_s");
				
				System.out.println("update_ok.jsp의 vo_s.getPwd() : "+ vo_s.getPwd());
				System.out.println("update_ok.jsp의 pwd : "+ rvo.getPwd());
				
				if (!vo_s.getPwd().equals(rvo.getPwd())) {
					System.out.println(">>암호불일치~~");
					req.setAttribute("vo_s", rvo);
					return "update.jsp";
				}
		
		
		// DB에 입력(저장) 처리
		int result = ReviewDAO.updateReview(rvo);
		System.out.println("update 결과 : " + result);
		
		req.getSession().setAttribute("vo_s", rvo);
		
		
		return "updateOK.jsp";
	}

}
