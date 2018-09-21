package com.chain.triangleView.notice.notice.vo.notice;

import java.util.Date;

public class Notice {

	private int noticeCode;				//공고코드
	private int noticeNo;				//글번호
	private String noticeTitle;			//글제목
	private int noticeWriter;			//작성자
	private Date noticeDate;			//작성일시
	private String noticeContent;		//글내용
	private int categoryCode;			//카테고리코드
	private int noticeCount;			//조회수
	private int deadlinePerson;			//마감인원
	private String productArea;			//상품지역
	private String noticeState;			//공고상태
	private Date noticeStartDate;		//공고시작시간
	private Date noticeEndDate;			//공고종료시간
	private int serviceNo; 				//등록번호
	private String caution;				//주의사항
	private String fileName;			//저장파일이름


	public Notice(){}

	

	public Notice(int noticeCode, int noticeNo, String noticeTitle, int noticeWriter, Date noticeDate,
			String noticeContent, int categoryCode, int noticeCount, int deadlinePerson, String productArea,
			String noticeState, Date noticeStartDate, Date noticeEndDate, int serviceNo, String caution,
			String fileName) {
		super();
		this.noticeCode = noticeCode;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
		this.categoryCode = categoryCode;
		this.noticeCount = noticeCount;
		this.deadlinePerson = deadlinePerson;
		this.productArea = productArea;
		this.noticeState = noticeState;
		this.noticeStartDate = noticeStartDate;
		this.noticeEndDate = noticeEndDate;
		this.serviceNo = serviceNo;
		this.caution = caution;
		this.fileName = fileName;
	}



	public Notice(int noticeCode, int noticeNo, String noticeTitle, int noticeWriter, Date noticeDate,
			String noticeContent, int categoryCode, int noticeCount, int deadlinePerson, String productArea,
			String noticeState, Date noticeStartDate, Date noticeEndDate, int serviceNo, String caution) {
		super();
		this.noticeCode = noticeCode;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
		this.categoryCode = categoryCode;
		this.noticeCount = noticeCount;
		this.deadlinePerson = deadlinePerson;
		this.productArea = productArea;
		this.noticeState = noticeState;
		this.noticeStartDate = noticeStartDate;
		this.noticeEndDate = noticeEndDate;
		this.serviceNo = serviceNo;
		this.caution = caution;
	}


	public Notice(int noticeCode, int noticeNo, String noticeTitle, int noticeWriter, Date noticeDate,
			String noticeContent, int categoryCode, int deadlinePerson, String productArea, String noticeState,
			Date noticeStartDate, Date noticeEndDate, int serviceNo, String caution) {
		super();
		this.noticeCode = noticeCode;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
		this.categoryCode = categoryCode;
		this.deadlinePerson = deadlinePerson;
		this.productArea = productArea;
		this.noticeState = noticeState;
		this.noticeStartDate = noticeStartDate;
		this.noticeEndDate = noticeEndDate;
		this.serviceNo = serviceNo;
		this.caution = caution;
	}


	public Notice(String noticeTitle, int noticeWriter, String noticeContent, int categoryCode, int deadlinePerson,
			String productArea, Date noticeStartDate, Date noticeEndDate, String caution) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.categoryCode = categoryCode;
		this.deadlinePerson = deadlinePerson;
		this.productArea = productArea;
		this.noticeStartDate = noticeStartDate;
		this.noticeEndDate = noticeEndDate;
		this.caution = caution;
	}



	public int getNoticeCode() {
		return noticeCode;
	}



	public int getNoticeNo() {
		return noticeNo;
	}



	public String getNoticeTitle() {
		return noticeTitle;
	}



	public int getNoticeWriter() {
		return noticeWriter;
	}



	public Date getNoticeDate() {
		return noticeDate;
	}



	public String getNoticeContent() {
		return noticeContent;
	}



	public int getCategoryCode() {
		return categoryCode;
	}



	public int getNoticeCount() {
		return noticeCount;
	}



	public int getDeadlinePerson() {
		return deadlinePerson;
	}



	public String getProductArea() {
		return productArea;
	}



	public String getNoticeState() {
		return noticeState;
	}



	public Date getNoticeStartDate() {
		return noticeStartDate;
	}



	public Date getNoticeEndDate() {
		return noticeEndDate;
	}



	public int getServiceNo() {
		return serviceNo;
	}



	public String getCaution() {
		return caution;
	}



	public String getFileName() {
		return fileName;
	}



	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}



	public void setNoticeWriter(int noticeWriter) {
		this.noticeWriter = noticeWriter;
	}



	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}



	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}



	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}



	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}



	public void setDeadlinePerson(int deadlinePerson) {
		this.deadlinePerson = deadlinePerson;
	}



	public void setProductArea(String productArea) {
		this.productArea = productArea;
	}



	public void setNoticeState(String noticeState) {
		this.noticeState = noticeState;
	}



	public void setNoticeStartDate(Date noticeStartDate) {
		this.noticeStartDate = noticeStartDate;
	}



	public void setNoticeEndDate(Date noticeEndDate) {
		this.noticeEndDate = noticeEndDate;
	}



	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}



	public void setCaution(String caution) {
		this.caution = caution;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	@Override
	public String toString() {
		return "Notice [noticeCode=" + noticeCode + ", noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle
				+ ", noticeWriter=" + noticeWriter + ", noticeDate=" + noticeDate + ", noticeContent=" + noticeContent
				+ ", categoryCode=" + categoryCode + ", noticeCount=" + noticeCount + ", deadlinePerson="
				+ deadlinePerson + ", productArea=" + productArea + ", noticeState=" + noticeState
				+ ", noticeStartDate=" + noticeStartDate + ", noticeEndDate=" + noticeEndDate + ", serviceNo="
				+ serviceNo + ", caution=" + caution + ", fileName=" + fileName + "]";
	}



	



}



