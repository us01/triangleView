package com.chain.triangleView.review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chain.triangleView.notice.notice.service.NoticeService;
import com.chain.triangleView.notice.notice.vo.notice.Notice;
import com.chain.triangleView.review.review.service.ReviewService;
import com.chain.triangleView.review.review.vo.Review;

public class SearchReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchReviewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchHash = request.getParameter("searchHash");
		String searchData = request.getParameter("searchData");

		ArrayList<Review> searchReviewList = new ReviewService().searchHashSelect(searchHash);
		ArrayList<HashMap<String, Object>> noticeList = null;

		if(searchReviewList != null){
			noticeList = new NoticeService().selectAllNotice();

			if(noticeList != null) {
				request.setAttribute("selectAllNotice", noticeList);
				request.setAttribute("searchReviewList", searchReviewList);
				request.setAttribute("searchReviewData", searchData);
			}else {
				request.setAttribute("searchReviewList", searchReviewList);
				request.setAttribute("searchReviewData", searchData);
			}

			request.getRequestDispatcher("/views/main/loginMain/loginMain.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "검색한 리뷰 읽어오기 실패");
			request.getRequestDispatcher("/views/errorPage/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
