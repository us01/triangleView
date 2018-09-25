package com.chain.triangleView.notice.notice.service;

import static com.chain.triangleView.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.chain.triangleView.notice.notice.dao.NoticeDao;
import com.chain.triangleView.notice.notice.vo.notice.Notice;

public class NoticeService {

	public ArrayList<HashMap<String, Object>> selectAllNotice() {
		
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> noticeList = new NoticeDao().selectAllNotice(con);
		
		close(con);
		
		return noticeList;
		
	}

	public ArrayList<HashMap<String, Object>> selectCurrNotice() {
		
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> noticeList = new NoticeDao().selectCurrNotice(con);
		
		close(con);
		
		return noticeList;
	}

}
