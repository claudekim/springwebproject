package kr.co.domain;

import java.io.Serializable;

public class CartListVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private int cartListNum;
	private String id;
	private int productNo;
	private String productName;
	private int productPrice;
	private int productQuantity;

	public CartListVO() {
	}

	public CartListVO(int cartListNum, String id, int productNo, String productName, int productPrice,
			int productQuantity) {
		super();
		this.cartListNum = cartListNum;
		this.id = id;
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
	}

	public int getCartListNum() {
		return cartListNum;
	}

	public void setCartListNum(int cartListNum) {
		this.cartListNum = cartListNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		CartListVO other = (CartListVO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "cartListNum=" + cartListNum + "/ id=" + id + "/ productNo=" + productNo + "/ productName="
				+ productName + "/ productPrice=" + productPrice + "/ productQuantity=" + productQuantity;
	}

	/*
	 * CREATE TABLE TEAM_CARTLIST
	 * 
	 * CARTLISTNUM NUMBER(5) PRIMARY KEY, ID VARCHAR2(20),
	 * 
	 * PRODUCTNO NUMBER(10),
	 * 
	 * PRODUCTQUANTITY NUMBER
	 * 
	 * CONSTRAINT CARTLIST_FK_ID FOREIGN KEY(ID) REFERENCES TEAM_USER(ID) ON DELETE
	 * CASCADE, CONSTRAINT CARTLIST_FK_PRODUCTNO FOREIGN KEY(PRODUCTNO) REFERENCES
	 * TEAM_PRODUCT(PRODUCTNO) ON DELETE SET NULL );
	 */
}