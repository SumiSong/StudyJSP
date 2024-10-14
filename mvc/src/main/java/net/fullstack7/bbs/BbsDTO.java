package net.fullstack7.bbs;

import java.time.LocalDateTime;

public class BbsDTO {
	private int idx;
	private int refIdx;
	private int levelIdx;
	private int sortOrder;
	private String memberId;
	private String title;
	private String content;
	private String DisplayDate;
	private LocalDateTime regDate;
	private LocalDateTime modifyDate;
	private int readCnt;
	private String filePath;
	private String fileName;
	private String fileExt;
	private int fileSize;
	private String fileCategory;
	
	public int getIdx() {
		return idx;
	}
	public int getRefIdx() {
		return refIdx;
	}
	public int getLevelIdx() {
		return levelIdx;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public String getMemberId() {
		return memberId;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getDisplayDate() {
		return DisplayDate;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public LocalDateTime getModifyDate() {
		return modifyDate;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public String getFilePath() {
		return filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public String getFileExt() {
		return fileExt;
	}
	public int getFileSize() {
		return fileSize;
	}
	public String getFileCategory() {
		return fileCategory;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public void setRefIdx(int refIdx) {
		this.refIdx = refIdx;
	}
	public void setLevelIdx(int levelIdx) {
		this.levelIdx = levelIdx;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setDisplayDate(String displayDate) {
		DisplayDate = displayDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public void setModifyDate(LocalDateTime modifyDate) {
		this.modifyDate = modifyDate;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public void setFileCategory(String fileCategory) {
		this.fileCategory = fileCategory;
	}
	
	
	
}
