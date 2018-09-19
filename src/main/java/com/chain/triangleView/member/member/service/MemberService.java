package com.chain.triangleView.member.member.service;


import static com.chain.triangleView.common.JDBCTemplate.*;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;

import com.chain.triangleView.member.member.memberDao.MemberDao;
import com.chain.triangleView.member.member.vo.Attachment;
import com.chain.triangleView.member.member.vo.Member;


public class MemberService {

	public Member loginCheck(String userId, String userPwd) {
		Connection con = getConnection();
		System.out.println("서비스 전 : " + userId);
		System.out.println("userPwd : " + userPwd);
		Member member = new MemberDao().loginCheck(con, userId, userPwd);
		System.out.println("서비스 후 : "  +member.getUserId());
		close(con);
		
		return member;
	}

	public int modifyUserPwd(String userId, String userPwd) {
		Connection con = getConnection();
		
		int result = new MemberDao().modifyUserPwd(con,userId, userPwd);
		
		close(con);
		
		return result;
	}

	public int insertMember(Member m, ArrayList<Attachment> fileList) {
			Connection con = getConnection();
			int result = 0;
			int result1 = new MemberDao().insertMember(con,m,fileList);
			
			//멤버 번호를 받아오자
			if(result1 >0){
				Member member = new MemberDao().userNoCheck(con, m);
				for(int i =0; i < fileList.size(); i++){
					fileList.get(i).setUserId(member.getUserNo());
				}
			}
			
			//첨부파일테이블에 넣기
			int result2 = new MemberDao().insertAttachment(con,fileList,m);
			
			if(result1 > 0 && result2 > 0){
				commit(con);
				result = 1;
			}else{
				rollback(con);
			}
			
			

			close(con);

			return result;

	}
	
	public int insertCompanyMember(Member m, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		int result1 = new MemberDao().insertCompanyMember(con,m,fileList);
		
		//멤버 번호를 받아오자
		if(result1 >0){
			Member member = new MemberDao().userNoCheck(con, m);
			for(int i =0; i < fileList.size(); i++){
				fileList.get(i).setUserId(member.getUserNo());
			}
			/*	int fid = new MemberDao().selectCurrval(con);
			for(int i =0; i < fileList.size(); i++){
				fileList.get(i).setUserId(fid);
			}*/
		}
		
		//첨부파일테이블에 넣기
		int result2 = new MemberDao().insertAttachment(con,fileList,m);
		
		if(result1 > 0 && result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		

		close(con);

		return result;
		
	}

	public int NickCheck(String nick) {
		Connection con = getConnection();
		int result=new MemberDao().NickCheck(con,nick);
		
		
		close(con);
		
		return result;

	}


	public Member userNoCheck(Member m) {
		Connection con = getConnection();
		
		
		Member member = new MemberDao().userNoCheck(con,m);
		
		close(con);
		
		return member;
	}

	public int insertCategory1(Member userNoCheck) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertCategory1(con,userNoCheck);
		close(con);
		
		
		return result;
	}

	public Member findId(Member m) {
		Connection con = getConnection();
		
		Member find = new MemberDao().findId(con,m);
		close(con);
		
		return find;
	}

	public int checkMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().checkMember(con, m);
		close(con);
		
		
		return result;
	}




	

}
