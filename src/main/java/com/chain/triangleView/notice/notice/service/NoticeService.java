package com.chain.triangleView.notice.notice.service;

import static com.chain.triangleView.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.chain.triangleView.notice.notice.dao.NoticeDao;
import com.chain.triangleView.notice.notice.vo.notice.Notice;

public class NoticeService {

	public ArrayList<Notice> selectAllNotice() {
		
		Connection con = getConnection();
		ArrayList<Notice> noticeList = new NoticeDao().selectAllNotice(con);
		
		close(con);
		
		return noticeList;
	}

}
