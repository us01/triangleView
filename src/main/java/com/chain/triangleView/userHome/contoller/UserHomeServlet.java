package com.chain.triangleView.userHome.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chain.triangleView.userHome.userHome.service.UserHomeService;
import com.chain.triangleView.userHome.userHome.vo.HomeMember;
import com.chain.triangleView.userHome.userHome.vo.HomeReview;

public class UserHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UserHomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("goUser");
		String meId = request.getParameter("goMe"); // 로그인을 하지 않을 경우 meId의 경우 null아닌 ""값으로 넘어옴
		
		HashMap<String, Object> userHome = new HashMap<String, Object>();
		
		HomeMember member = new UserHomeService().UserMemberSelect(userId, meId);
		
		if(member != null){
			userHome.put("member", member);
			
			ArrayList<HomeReview> reviews = new UserHomeService().UserReviewSelect(userId);
			
			userHome.put("reviews", reviews);
			
			request.setAttribute("userHome", userHome);
			request.getRequestDispatcher("/views/myPage/myHome.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "UserHome 회원 정보 조회 실패욘");
			request.getRequestDispatcher("/views/errorPage/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
