package com.chain.triangleView.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.service.ReviewService;
import com.chain.triangleView.review.review.vo.Review;

public class LoginMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		ArrayList<Review> interestReviewList = new ReviewService().selectInterestReview(userNo);
		if(interestReviewList != null){
			request.setAttribute("interestReviewList", interestReviewList);
			request.getRequestDispatcher("/views/main/loginMain/loginMain.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "관심 정보가 조회되지 않았어요");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}