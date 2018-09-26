package com.chain.triangleView.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import com.chain.triangleView.NLP.NLPfiltering;
import com.chain.triangleView.crolling.Crolling;
import com.chain.triangleView.member.member.service.MemberService;
import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.hottag.Service.HotTagService;
import com.chain.triangleView.review.review.service.ReviewService;
import com.chain.triangleView.review.review.vo.Review;
import com.google.cloud.language.v1.Sentiment;

import twitter4j.Status;

public class ReSearchReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReSearchReviewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchHash = request.getParameter("searchHash");
		String searchData = request.getParameter("searchData");
		
		ArrayList<Review> searchReviewList = new ReviewService().searchHashSelect(searchHash);

		if(((Member)request.getSession().getAttribute("loginUser")) != null){
			Member followCountMember = new MemberService().followCountSelect(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
			request.setAttribute("followCountMember", followCountMember);
		}
		
		new HotTagService().countTag(searchData); 
    
		if(searchReviewList != null){
			request.setAttribute("searchReviewList", searchReviewList);
			request.setAttribute("searchReviewData", searchData);
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
