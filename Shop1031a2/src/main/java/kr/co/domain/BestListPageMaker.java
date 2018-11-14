package kr.co.domain;

import java.io.Serializable;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class BestListPageMaker implements Serializable{

	private static final long serialVersionUID = 1L;

	private int amount;
	private int beginPageNum;
	private int stopPageNum;
	private int totalPage;
	private BestListCriteria cri;
	private int displayPage;
	
	public BestListPageMaker() {
		displayPage = 6;
	}

	public BestListPageMaker(int amount, int beginPageNum, int stopPageNum, BestListCriteria cri) {
		super();
		this.amount = amount;
		this.beginPageNum = beginPageNum;
		this.stopPageNum = stopPageNum;
		this.cri = cri;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		totalPage = (amount - 1) / cri.getPerPage() + 1;
		beginPageNum = ((cri.getPage() - 1) / displayPage) * displayPage + 1;
		stopPageNum = beginPageNum + (displayPage - 1);
		if(stopPageNum > totalPage) stopPageNum = totalPage;
	}

	public int getBeginPageNum() {
		return beginPageNum;
	}

	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}

	public int getStopPageNum() {
		return stopPageNum;
	}

	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public BestListCriteria getCri() {
		return cri;
	}

	public void setCri(BestListCriteria cri) {
		this.cri = cri;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String makeBestListQuery(int bestNewPage) {
		UriComponents uc = UriComponentsBuilder.newInstance()
				.queryParam("page", bestNewPage)
				.queryParam("perPage",cri.getPerPage())
				.build();
		return uc.toString();
	}
	
	
}
