package com.chain.triangleView.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chain.triangleView.member.member.service.MemberService;
import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.service.ReviewService;
import com.chain.triangleView.review.review.vo.Review;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
	
		Member loginUser = new MemberService().loginCheck(userId, userPwd);
		
		if(loginUser != null){
			
			ArrayList<Review> reviewList = new ReviewService().selectInterestReview(loginUser.getUserNo());
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			request.setAttribute("reviewList", reviewList);
			request.getRequestDispatcher("/views/main/loginMain/loginMain.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "로그인 정보가 조회되지 않았어요");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
