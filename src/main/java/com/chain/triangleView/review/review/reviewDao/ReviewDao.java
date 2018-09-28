package com.chain.triangleView.review.review.reviewDao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.chain.triangleView.member.member.vo.Attachment;
import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.vo.CardFormImages;
import com.chain.triangleView.review.review.vo.Form;
import com.chain.triangleView.review.review.vo.Review;
import com.chain.triangleView.review.review.vo.RwComment;

import static com.chain.triangleView.common.JDBCTemplate.*;

public class ReviewDao {
	private Properties prop = new Properties();
	
	public ReviewDao(){
		String fileName = ReviewDao.class.getResource("/resources/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Review> logoutMainListSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Review> reviewList = null;
		
		String query = prop.getProperty("logoutMainHotListSelect");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			reviewList = new ArrayList<Review>();
			
			while(rset.next()){
				Review review = new Review();
				
				review.setNick(rset.getString("nick"));
				review.setTodayRwCount(rset.getInt("todayrwcount"));
				review.setLikeCount(rset.getInt("likecount"));
				review.setCategoryType(rset.getInt("categorytype"));
				review.setRwContent(rset.getString("rwContent"));
				review.setThumbnail(rset.getString("filename"));
				review.setRwTitle(rset.getString("rwtitle"));
				review.setModifyYn(rset.getString("modifyyn"));
				review.setCoorLink(rset.getString("coorlink"));
				review.setRwContentType(rset.getInt("rwcontenttype"));
				review.setRwCount(rset.getInt("rwcount"));
				review.setRwHash(rset.getString("rwhash"));
				review.setRwComment(rset.getString("rwcomment"));
				review.setRwType(rset.getInt("rwtype"));
				review.setUserId(rset.getString("userid"));
				review.setRwSupport(rset.getInt("rwsupport"));
				review.setRwNo(rset.getInt("rwno"));
				
				reviewList.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return reviewList;
	}

	public Form loadOneForm(Connection con, int rwNo, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Form form = null;
		
		String query = prop.getProperty("loadOneForm");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rwNo);
			pstmt.setInt(2, rwNo);
			pstmt.setInt(3, rwNo);
			pstmt.setInt(4, userNo);
			pstmt.setInt(5, rwNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				form = new Form();
				
				form.setNick(rset.getString("nick"));
				form.setRwHash(rset.getString("rwhash"));
				form.setRwCommentCount(rset.getInt("rwcommentcount"));
				form.setRwLikeCount(rset.getInt("rwlikecount"));
				form.setRwComment(rset.getString("rwcomment"));
				form.setLikeMe(rset.getInt("likeme"));
				form.setRwGrade(rset.getInt("rwgrade"));
				form.setRwContentType(rset.getInt("rwcontenttype"));
				form.setThumbnail(rset.getString("filename"));
				form.setCoorLink(rset.getString("coorlink"));
				form.setWriteDate(rset.getString("rwwritedate"));
				form.setRwTitle(rset.getString("rwtitle"));
				form.setRwContent(rset.getString("rwcontent"));
				form.setRwNo(rset.getInt("rwno"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return form;
	}

	public ArrayList<RwComment> loadOneFormComment(Connection con, int rwNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RwComment> rwComment = null;
		
		String query = prop.getProperty("loadOneFormComment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rwNo);
			rset = pstmt.executeQuery();
			
			rwComment = new ArrayList<RwComment>();
			while(rset.next()){
				RwComment comment = new RwComment();
				
				comment.setCommentContent(rset.getString("commentcontent"));
				if(rset.getInt("parentcommentno") > 0){
					comment.setParentCommentNo(true);
				}else{
					comment.setParentCommentNo(false);
				}
				comment.setRwDate(rset.getString("rwdate"));
				comment.setUserNo(rset.getInt("userNo"));
				comment.setThumbnail(rset.getString("filename"));
				comment.setNick(rset.getString("nick"));
				comment.setRwNo(rset.getInt("rwno"));
				comment.setCommentNo(rset.getInt("commentno"));
				
				rwComment.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rwComment;
	}

	public ArrayList<Review> selectInterestReview(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> reviewList = null;
		
		String query = prop.getProperty("selectInterestReview");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			reviewList = new ArrayList<Review>();
			
			while(rset.next()){
				Review review = new Review();
				
				review.setNick(rset.getString("nick"));
				review.setUserId(rset.getString("userid"));
				review.setLikeCount(rset.getInt("likecount"));
				review.setCategoryType(rset.getInt("categorytype"));
				review.setRwContent(rset.getString("rwContent"));
				review.setThumbnail(rset.getString("filename"));
				review.setRwTitle(rset.getString("rwtitle"));
				review.setModifyYn(rset.getString("modifyyn"));
				review.setCoorLink(rset.getString("coorlink"));
				review.setRwContentType(rset.getInt("rwcontenttype"));
				review.setRwCount(rset.getInt("rwcount"));
				review.setRwHash(rset.getString("rwhash"));
				review.setRwComment(rset.getString("rwcomment"));
				review.setRwType(rset.getInt("rwtype"));
				review.setRwSupport(rset.getInt("rwsupport"));
				review.setRwNo(rset.getInt("rwno"));
				
				reviewList.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewList;
	}

	public ArrayList<Review> searchHashSelect(Connection con, String searchHash) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> searchReviewList = null;
		
		String query = prop.getProperty("searchHash");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchHash);
			
			rset = pstmt.executeQuery();
			
			searchReviewList = new ArrayList<Review>();
			while(rset.next()){
				Review review = new Review();
				
				review.setNick(rset.getString("nick"));
				review.setLikeCount(rset.getInt("likecount"));
				review.setCategoryType(rset.getInt("categorytype"));
				review.setRwContent(rset.getString("rwContent"));
				review.setThumbnail(rset.getString("filename"));
				review.setRwTitle(rset.getString("rwtitle"));
				review.setModifyYn(rset.getString("modifyyn"));
				review.setCoorLink(rset.getString("coorlink"));
				review.setRwContentType(rset.getInt("rwcontenttype"));
				review.setRwCount(rset.getInt("rwcount"));
				review.setRwHash(rset.getString("rwhash"));
				review.setRwComment(rset.getString("rwcomment"));
				review.setRwType(rset.getInt("rwtype"));
				review.setUserId(rset.getString("userid"));
				review.setRwSupport(rset.getInt("rwsupport"));
				review.setRwNo(rset.getInt("rwno"));
				
				searchReviewList.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return searchReviewList;
	}
	
	public int insertWrite2Attachment(Connection con, ArrayList<Attachment> fileList, Member m, Review rwNoCheck) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertWrite2Attachment");

		try {
			for(int i = 0; i < fileList.size(); i++){
				int j = i;
				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, rwNoCheck.getRwNo());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3,fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFileSize());
				pstmt.setString(5, fileList.get(i).getFileType());
				pstmt.setInt(6, m.getUserNo());
				pstmt.setInt(7, j);

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public int write3Review(Connection con, Review rw, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWrite3Review");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, rw.getCategoryType());
			pstmt.setString(3, rw.getRwContent());
			pstmt.setString(4, rw.getRwTitle());
			pstmt.setDouble(5, rw.getRwGrade());
			pstmt.setString(6, rw.getRwComment());
			pstmt.setInt(7, rw.getRwSupport());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Review> userHomeReviewSelect(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> userReviewList = null;
		
		String query = prop.getProperty("userHomeReviewSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			userReviewList = new ArrayList<Review>();
			
			while(rset.next()){
				Review review = new Review();
				
				review.setNick(rset.getString("nick"));
				review.setLikeCount(rset.getInt("likecount"));
				review.setCategoryType(rset.getInt("categorytype"));
				review.setRwContent(rset.getString("rwContent"));
				review.setRwTitle(rset.getString("rwtitle"));
				review.setModifyYn(rset.getString("modifyyn"));
				review.setCoorLink(rset.getString("coorlink"));
				review.setRwContentType(rset.getInt("rwcontenttype"));
				review.setRwCount(rset.getInt("rwcount"));
				review.setRwHash(rset.getString("rwhash"));
				review.setRwComment(rset.getString("rwcomment"));
				review.setRwType(rset.getInt("rwtype"));
				review.setRwSupport(rset.getInt("rwsupport"));
				review.setRwNo(rset.getInt("rwno"));
				
				userReviewList.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userReviewList;
	}

	public int addComment(Connection con, int rwNo, int commentNo, int userNo, String commentContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("addComment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, rwNo);
			pstmt.setInt(2, rwNo);
			pstmt.setString(3, commentContent);
			if(commentNo == -1){
				pstmt.setInt(4, 0);
			}else{
				pstmt.setInt(4, commentNo);
			}
			pstmt.setInt(5, userNo);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int write1Review(Connection con, Review rw, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWrite1Review");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, rw.getCategoryType());
			pstmt.setString(3, rw.getRwContent());
			pstmt.setString(4, rw.getRwTitle());
			pstmt.setDouble(5, rw.getRwGrade());
			pstmt.setString(6, rw.getRwComment());
			pstmt.setInt(7, rw.getRwSupport());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int insertWrite1Attachment(Connection con, ArrayList<Attachment> fileList, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertWrite1Attachment");

		try {
			for(int i = 0; i < fileList.size(); i++){
				int j = i;
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2,fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFileSize());
				pstmt.setString(4, fileList.get(i).getFileType());
				pstmt.setInt(5, m.getUserNo());
				pstmt.setInt(6, j);

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public int write2Review(Connection con, Review rw, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertWrite2Review");
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, rw.getCategoryType());
			pstmt.setString(3, rw.getRwContent());
			pstmt.setString(4, rw.getRwTitle());
			pstmt.setDouble(5, rw.getRwGrade());
			pstmt.setString(6, rw.getRwComment());
			pstmt.setInt(7, rw.getRwSupport());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public int insertWrite3Attachment(Connection con, ArrayList<Attachment> fileList, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertWrite3Attachment");

		try {
			for(int i = 0; i < fileList.size(); i++){
				int j = i;
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFileSize());
				pstmt.setString(4, fileList.get(i).getFileType());
				pstmt.setInt(5, m.getUserNo());
				pstmt.setInt(6, j);

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public int insertHashtag(Connection con, Review rwNoCheck, String resultHash) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertHashtag");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, resultHash);
			pstmt.setInt(2, rwNoCheck.getRwNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public Review reviewNoCheck(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Review rwResult = null;
		
		String query = prop.getProperty("reviewNoCheck");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, m.getUserNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				rwResult = new Review();
				
				rwResult.setRwNo(rset.getInt("rwNo"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return rwResult;
	}

	public ArrayList<CardFormImages> loadOneFormCardImg(Connection con, int rwNo) {
		PreparedStatement pstmt = null;
		ArrayList<CardFormImages> cardImageList = null;
		ResultSet rset = null;
		String query  = prop.getProperty("loadOneFormCardImg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, rwNo);
			
			rset = pstmt.executeQuery();
			
			cardImageList = new ArrayList<CardFormImages>();
			while(rset.next()){
				CardFormImages list = new CardFormImages();
				
				list.setFileCode(rset.getInt("filecode"));
				list.setFileName(rset.getString("filename"));
				list.setFileSeqNo(rset.getInt("fileseqno"));
				list.setReviewNo(rset.getInt("reviewno"));
				list.setTableType(rset.getInt("tabletype"));
				
				cardImageList.add(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cardImageList;
	}

}
