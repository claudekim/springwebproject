package kr.co.domain;

import java.io.Serializable;

public class TradeVO implements Serializable{

   private static final long serialVersionUID = 1L;
   
   private int tradeNum;
   private String id;
   private int productNo;
   private int productQuantity;
   private int purchaseNum;
   private String tradeDate;
   private int state;
   private String tradeAddress;
   private String receivceName;
   
   public TradeVO() {}

   public TradeVO(int tradeNum, String id, int productNo, int productQuantity, int purchaseNum, String tradeDate,
         int state, String tradeAddress, String receivceName) {
      super();
      this.tradeNum = tradeNum;
      this.id = id;
      this.productNo = productNo;
      this.productQuantity = productQuantity;
      this.purchaseNum = purchaseNum;
      this.tradeDate = tradeDate;
      this.state = state;
      this.tradeAddress = tradeAddress;
      this.receivceName = receivceName;
   }

   public int getTradeNum() {
      return tradeNum;
   }

   public void setTradeNum(int tradeNum) {
      this.tradeNum = tradeNum;
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

   public int getProductQuantity() {
      return productQuantity;
   }

   public void setProductQuantity(int productQuantity) {
      this.productQuantity = productQuantity;
   }

   public int getPurchaseNum() {
      return purchaseNum;
   }

   public void setPurchaseNum(int purchaseNum) {
      this.purchaseNum = purchaseNum;
   }

   public String getTradeDate() {
      return tradeDate;
   }

   public void setTradeDate(String tradeDate) {
      this.tradeDate = tradeDate;
   }

   public int getState() {
      return state;
   }

   public void setState(int state) {
      this.state = state;
   }

   public String getTradeAddress() {
      return tradeAddress;
   }

   public void setTradeAddress(String tradeAddress) {
      this.tradeAddress = tradeAddress;
   }

   public String getReceivceName() {
      return receivceName;
   }

   public void setReceivceName(String receivceName) {
      this.receivceName = receivceName;
   }

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + tradeNum;
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
      TradeVO other = (TradeVO) obj;
      if (tradeNum != other.tradeNum)
         return false;
      return true;
   }

   @Override
   public String toString() {
      return "TRADEVO [거래번호=" + tradeNum + ", id=" + id + ", 거래상품번호=" + productNo + ", 상품수량=" + productQuantity + 
            ", 구매번호=" + purchaseNum + ", 거래날짜=" + tradeDate + ", 거래 상태=" + state
            + ", 상품 배송지=" + tradeAddress + ", 상품 받는사람 이름=" + receivceName + "]";
   }

}