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
 * Servlet implementation class insertWrite2Servlet
 */
public class insertWrite2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertWrite2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rwTitle = request.getParameter("title");
		int categoryType = Integer.parseInt(request.getParameter("categoryCheck"));
		String rwContent = request.getParameter("edit");
		String rwHash = request.getParameter("hash");
		String rwComment = request.getParameter("introduce");
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		int userNo = loginUser.getUserNo();
		double rwGrade2 = Double.parseDouble(request.getParameter("rwGrade"));
		double rwGrade = rwGrade2 / 2;
		
		
		Review rw = new Review();
		rw.setRwTitle(rwTitle);
		rw.setCategoryType(categoryType);
		rw.setRwContent(rwContent);
		rw.setRwHash(rwHash);
		rw.setRwComment(rwComment);
		rw.setRwGrade(rwGrade);
		
		Member m = new Member();
		m.setUserNo(userNo);
		
		int result = new ReviewService().write2Review(rw,m);
		
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
