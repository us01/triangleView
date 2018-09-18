package com.chain.triangleView.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chain.triangleView.review.review.service.ReviewService;
import com.chain.triangleView.review.review.vo.Review;

public class ReSearchReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReSearchReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchHash = request.getParameter("searchHash");
		
		System.out.println("searchHash : " + searchHash);
	
		ArrayList<Review> searchReviewList = new ReviewService().searchHashSelect(searchHash);
		
		if(searchReviewList != null){
			request.setAttribute("searchReviewList", searchReviewList);
			request.getRequestDispatcher("/views/searchReviewList/searchReviewList.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "검색한 리뷰 읽어오기 실패");
			request.getRequestDispatcher("/views/errorPage/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
