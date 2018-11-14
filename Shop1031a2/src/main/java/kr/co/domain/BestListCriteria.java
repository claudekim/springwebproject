package kr.co.domain;

import java.io.Serializable;

public class BestListCriteria implements Serializable{

	private static final long serialVersionUID = 1L;
	private int page;
	private int perPage;
	private int startNum;
	private int endNum;
	
	public BestListCriteria() {
		page = 1;
		perPage = 6;
	}

	public BestListCriteria(int page, int perPage) {
		super();
		this.page = page;
		this.perPage = perPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page < 0) page = 1;
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	public int getStartNum() {
		return (page - 1) * perPage + 1;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
