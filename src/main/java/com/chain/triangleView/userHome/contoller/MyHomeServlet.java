package com.chain.triangleView.userHome.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.userHome.userHome.service.UserHomeService;
import com.chain.triangleView.userHome.userHome.vo.HomeMember;
import com.chain.triangleView.userHome.userHome.vo.HomeReview;

public class MyHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyHomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String, Object> userHome = new HashMap<String, Object>();
		
		HomeMember member = new UserHomeService().UserMemberSelect(((Member)(request.getSession().getAttribute("loginUser"))).getUserId(), ((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
		
		if(member != null){
			userHome.put("member", member);
			
			ArrayList<HomeReview> reviews = new UserHomeService().UserReviewSelect(((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
			
			userHome.put("reviews", reviews);
			
			request.setAttribute("userHome", userHome);
			request.getRequestDispatcher("/views/myPage/myHome.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "UserHome 회원 정보 조회 실패욘");
			request.getRequestDispatcher("/views/errorPage/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
