package kr.co.domain;

import java.io.Serializable;

public class CategoryVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private String Category1;
	private String Category2;
	
	public CategoryVO() {
	}
	
	//유저
	public CategoryVO(String category1, String category2) {
		super();
		Category1 = category1;
		Category2 = category2;
	}

	//겟셋
	public String getCategory1() {
		return Category1;
	}


	public void setCategory1(String category1) {
		Category1 = category1;
	}


	public String getCategory2() {
		return Category2;
	}


	public void setCategory2(String category2) {
		Category2 = category2;
	}

	//헤쉬
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((Category1 == null) ? 0 : Category1.hashCode());
		result = prime * result + ((Category2 == null) ? 0 : Category2.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CategoryVO other = (CategoryVO) obj;
		if (Category1 == null) {
			if (other.Category1 != null)
				return false;
		} else if (!Category1.equals(other.Category1))
			return false;
		if (Category2 == null) {
			if (other.Category2 != null)
				return false;
		} else if (!Category2.equals(other.Category2))
			return false;
		return true;
	}

	//투스트링..!
	@Override
	public String toString() {
		return "CategoryVO [Category1=" + Category1 + ", Category2=" + Category2 + "]";
	}

	
	
	
	
	

}
