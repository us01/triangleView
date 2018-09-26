package com.chain.triangleView.notice.notice.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
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
	

	public ArrayList<HashMap<String, Object>> selectAllNotice(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectAllNotice");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();	
				hmap.put("noticecode", rset.getInt("noticecode"));
				hmap.put("noticetitle", rset.getString("noticetitle"));
				hmap.put("categorycode", rset.getInt("categorycode"));
				hmap.put("productarea", rset.getString("productarea"));
				hmap.put("noticeenddate", rset.getString("noticeenddate"));
				hmap.put("filename", rset.getString("filename"));
				hmap.put("filePath", "notice_upload");
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
    
		return list;
	}


	public ArrayList<HashMap<String, Object>> selectCurrNotice(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectThumNotice");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();	
				hmap.put("noticecode", rset.getInt("noticecode"));
				hmap.put("noticetitle", rset.getString("noticetitle"));
				hmap.put("categorycode", rset.getInt("categorycode"));
				hmap.put("noticeenddate", rset.getString("noticeenddate"));
				hmap.put("deadlineperson", rset.getInt("deadlineperson"));
				hmap.put("person", rset.getInt("person"));
				hmap.put("productarea", rset.getString("productarea"));
				hmap.put("filename", rset.getString("filename"));
				hmap.put("filePath", "notice_upload");
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
    
		return list;
	}

}
