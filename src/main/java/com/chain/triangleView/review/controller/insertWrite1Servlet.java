package com.chain.triangleView.review.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.chain.triangleView.common.MyFileRenamePolicy;
import com.chain.triangleView.member.member.vo.Attachment;
import com.chain.triangleView.member.member.vo.Member;
import com.chain.triangleView.review.review.service.ReviewService;
import com.chain.triangleView.review.review.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class insertWrite1Servlet
 */
public class insertWrite1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertWrite1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 20; // 20mb가 됨

			// 파일 길이를 위한 object생성
			File fileObj = null;
			// 파일 확장자 구하기위해 생성
			String fileExtend = null;

			// 루트체크
			String root = request.getSession().getServletContext().getRealPath("/");

			// 저장경로설정
			String savePath = root + "thumbnail_upload/";

			// 파일저장이름 설정
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			// 리뷰에 대한 기본적인 정보
			String rwTitle = multiRequest.getParameter("title");
			int categoryType = Integer.parseInt(multiRequest.getParameter("categoryCheck"));
			String rwHash = multiRequest.getParameter("hash");
			String rwComment = multiRequest.getParameter("introduce");
			Member loginUser = (Member) (request.getSession().getAttribute("loginUser"));
			int userNo = loginUser.getUserNo();
			double rwGrade = 0.0;
			if(multiRequest.getParameter("rwGrade") == null){
				rwGrade = 0;
			}else{
				double rwGrade2 = Double.parseDouble(multiRequest.getParameter("rwGrade"));
				rwGrade = rwGrade2 / 2;
			}

			String rwContent = "";
			String companySponCheck = multiRequest.getParameter("companySpon");
			int companySpon = 0;
			if(companySponCheck == null){
				companySpon = 0;
			}else{
				companySpon = 1;
			}
			
			String resultHash = "";
			if(rwHash != null){
				//sha512로변환한 해시
				MessageDigest digest;
				try {
					digest = MessageDigest.getInstance("SHA-512");
					byte[] bytes = rwHash.getBytes(Charset.forName("UTF-8"));
					digest.reset();
					digest.update(bytes);
					resultHash = Base64.getEncoder().encodeToString(digest.digest());
				} catch (NoSuchAlgorithmException e) {
					
					e.printStackTrace();
				}			
			}else{
				resultHash = "undefined";
			}
			
			System.out.println("바뀌는가? : " + resultHash);
			
			Review rw = new Review();
			rw.setRwTitle(rwTitle);
			rw.setCategoryType(categoryType);
			rw.setRwHash(rwHash);
			rw.setRwComment(rwComment);
			rw.setRwGrade(rwGrade);
			rw.setRwSupport(companySpon);
			
			
			
			// 저장한 파일의 이름을 저장할 arrayList생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			// 원본 파일의 이름을 저장할 arrayList생성
			ArrayList<String> originFiles = new ArrayList<String>();

			// 파일의 이름을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();
			
			// Attachment 객체 생성하여 ArrayList객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			while (files.hasMoreElements()) {
				String name = files.nextElement();

				if (multiRequest.getFilesystemName(name) != null) {

					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));

					Attachment at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(multiRequest.getOriginalFileName(name));
					at.setChangeName(multiRequest.getFilesystemName(name));
					rwContent += multiRequest.getOriginalFileName(name);
					fileObj = multiRequest.getFile(name);
					if (fileObj != null) {
						// 파일길이 구하기위한 오브젝트생성
						at.setFileSize(String.valueOf(fileObj.length()));
						fileExtend = multiRequest.getOriginalFileName(name);
						// 파일 확장자 구하기위해 생성
						at.setFileType(
								fileExtend.substring(multiRequest.getOriginalFileName(name).lastIndexOf(".") + 1));
						fileList.add(at);
					} else {
						at.setFileSize("0");
						at.setFileType(null);
					}
					rw.setRwContent(rwContent);
				}
			}
			Member m = new Member();
			m.setUserNo(userNo);
			
			int result = new ReviewService().write1Review(rw, m, fileList,resultHash);
			
			if (result > 0) {
				System.out.println("굿");
			} else {
				System.out.println("ㅠㅠ");
			}

		}
	}
			
	
				 
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
