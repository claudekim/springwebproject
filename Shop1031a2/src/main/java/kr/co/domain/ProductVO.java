package kr.co.domain;

import java.io.Serializable;

public class ProductVO implements Serializable{

   private static final long serialVersionUID = 1L;

      private int productNo;
      private String productName;
      private int productPrice;
      private int viewCount;
      private String pregdate;
      private String category1;
      private String category2;
      private int rest;
      private int soldSum;
      private String productImgPath ;
      private String productContent;
      
      public ProductVO() {}

   public ProductVO(int productNo, String productName, int productPrice, int viewCount, String pregdate,
         String category1, String category2, int rest, int soldSum, String productImgPath, String productContent) {
      super();
      this.productNo = productNo;
      this.productName = productName;
      this.productPrice = productPrice;
      this.viewCount = viewCount;
      this.pregdate = pregdate;
      this.category1 = category1;
      this.category2 = category2;
      this.rest = rest;
      this.soldSum = soldSum;
      this.productImgPath = productImgPath;
      this.productContent = productContent;
   }

   public ProductVO(String productName, int productPrice, String category1, String category2, int rest,
         String productImgPath, String productContent) { //상품 등록
      super();
      this.productName = productName;
      this.productPrice = productPrice;
      this.category1 = category1;
      this.category2 = category2;
      this.rest = rest;
      this.productImgPath = productImgPath;
      this.productContent = productContent;
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

   public int getViewCount() {
      return viewCount;
   }

   public void setViewCount(int viewCount) {
      this.viewCount = viewCount;
   }

   public String getPregdate() {
      return pregdate;
   }

   public void setPregdate(String pregdate) {
      this.pregdate = pregdate;
   }

   public String getCategory1() {
      return category1;
   }

   public void setCategory1(String category1) {
      this.category1 = category1;
   }

   public String getCategory2() {
      return category2;
   }

   public void setCategory2(String category2) {
      this.category2 = category2;
   }

   public int getRest() {
      return rest;
   }

   public void setRest(int rest) {
      this.rest = rest;
   }

   public int getSoldSum() {
      return soldSum;
   }

   public void setSoldSum(int soldSum) {
      this.soldSum = soldSum;
   }

   public String getProductImgPath() {
      return productImgPath;
   }

   public void setProductImgPath(String productImgPath) {
      this.productImgPath = productImgPath;
   }

   public String getProductContent() {
      return productContent;
   }

   public void setProductContent(String productContent) {
      this.productContent = productContent;
   }

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + productNo;
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
      ProductVO other = (ProductVO) obj;
      if (productNo != other.productNo)
         return false;
      return true;
   }

   @Override
   public String toString() {
      return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
            + ", viewCount=" + viewCount + ", pregdate=" + pregdate + ", category1=" + category1 + ", category2="
            + category2 + ", rest=" + rest + ", soldSum=" + soldSum + ", productImgPath=" + productImgPath
            + ", productContent=" + productContent + "]";
   }

}
   /*
   PRODUCTNO NUMBER(10) PRIMARY KEY,
   PRODUCTNAME VARCHAR2(20),
   PRODUCTPRICE NUMBER(20),
   VIEWCOUNT NUMBER(10),
   PREGDATE DATE DEFAULT SYSDATE,
   CATEGORY1 VARCHAR2(20),
   CATEGORY2 VARCHAR2(20),
   REST NUMBER(5),
   SOLDSUM NUMBER(5),
   PRODUCTIMGPATH VARCHAR2(100),
   productContent varchar2(1000)*/
