package com.chain.triangleView.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.service.ReviewService;
import com.chain.triangleView.review.review.vo.Review;

/**
 * Servlet implementation class insertWrite3Servlet
 */
public class insertWrite3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertWrite3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rwTitle = request.getParameter("title");
		int categoryType = Integer.parseInt(request.getParameter("categoryCheck"));
		String data = request.getParameter("videoUpload");
		String dataRoot ="";
		if(!data.contains("embed")){
			if(!data.contains("youtu.be")){
				String[] cut = data.split("=");
				dataRoot = "https://www.youtube.com/embed/" + cut[1];
				
			}else{
				String[] cut = data.split("be/");
				dataRoot = "https://www.youtube.com/embed/" + cut[1];
			}
		}else{
			dataRoot = data;
		}
	
		
		String rwHash = request.getParameter("hash");
		String rwComment = request.getParameter("introduce");
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		int userNo = loginUser.getUserNo();
		
		
		Review rw = new Review();
		rw.setRwTitle(rwTitle);
		rw.setCategoryType(categoryType);
		rw.setRwHash(rwHash);
		rw.setRwComment(rwComment);
		
		rw.setRwContent(dataRoot);
		
		Member m = new Member();
		m.setUserNo(userNo);
		
		int result = new ReviewService().write3Review(rw,m);
		
		if(result > 0){
			System.out.println("굿");
		}else{
			System.out.println("다시");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
