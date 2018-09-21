package com.chain.triangleView.notice.notice.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.chain.triangleView.common.JDBCTemplate.*;

import com.chain.triangleView.member.member.memberDao.MemberDao;
import com.chain.triangleView.notice.notice.vo.notice.Notice;

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String fileName = MemberDao.class.getResource("/resources/notice/notice-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Notice> selectAllNotice(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Notice> noticeList = null;
		String query = prop.getProperty("selectAllNotice");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			noticeList = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice notice = new Notice();
				
				notice.setNoticeCode(rset.getInt("noticecode"));
				notice.setNoticeTitle(rset.getString("noticetitle"));
				notice.setCategoryCode(rset.getInt("categorycode"));
				notice.setProductArea(rset.getString("productarea"));
				notice.setNoticeEndDate(rset.getDate("noticeenddate"));
				
				noticeList.add(notice);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(stmt);
		}
		return noticeList;
	}

}
