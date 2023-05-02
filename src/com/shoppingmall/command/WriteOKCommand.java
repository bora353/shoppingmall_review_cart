package com.shoppingmall.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shoppingmall.dao.ReviewDAO;
import com.shoppingmall.vo.ReviewVO;

public class WriteOKCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// String subject = req.getParameter("subject");

		// 파일을 저장할 위치 지정
		// String path = "c:/Mystudy/temp";
		String path = "C:/Mystudy/60_Web/shoppingmall/WebContent/img";
		// String path = this.getServletContext().getRealPath("/upload");
		// System.out.println("> path : " + path);

		MultipartRequest mr = new MultipartRequest(req, // 요청객체
				path, // 실제 파일을 저장할 경로(업로드 위치)
				10 * 1024 * 1024, // 업로드 파일의 최대크기 지정(byte 단위)
				"UTF-8", // 인코딩 형식
				new DefaultFileRenamePolicy());

		// 전달받은 데이터 VO에 저장 후 DB에 입력처리(DB 연동 작업)
		ReviewVO rvo = new ReviewVO();
		rvo.setSubject(mr.getParameter("subject"));
		rvo.setWriter(mr.getParameter("writer"));
		
		
		// 개행은 <br>로 DB에 저장되게
		String content = mr.getParameter("content");
		rvo.setContent(content.replace("\r\n","<br>"));
		
		
		
		
		rvo.setPwd(mr.getParameter("pwd"));
		rvo.setStar(Integer.parseInt(mr.getParameter("star")));

		// 첨부파일 데이터 처리
		if (mr.getFile("filename") == null) {
			// System.out.println(">> 첨부파일 없음");
			rvo.setFileName("noimg.png");
			rvo.setOriName("noimg.png");
		} else {
			// System.out.println(">> 첨부파일 있음");
			rvo.setFileName(mr.getFilesystemName("filename")); // 물리적으로 저장되는 파일명
			rvo.setOriName(mr.getOriginalFileName("filename")); // 물리적으로 저장되는 파일명
		}

		System.out.println("rvo : " + rvo);

		// DB에 입력(저장) 처리
		int result = ReviewDAO.insertReview(rvo);
		System.out.println("insert 결과 : " + result);

		req.getSession().setAttribute("vo_s", rvo);
		

		return "writeOK.jsp";

	}

}
