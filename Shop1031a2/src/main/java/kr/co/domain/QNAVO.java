package kr.co.domain;

import java.io.Serializable;

public class QNAVO implements Serializable {


   private static final long serialVersionUID = 1L;

   private int qnaNum;
   private String qnaRegDate;
   private String id;
   private int productNo;
   private String qnaTitle;
   private String question;
   private int secret;
   private int complete;
   private String answer;
   
   public QNAVO() {}

   public QNAVO(int qnaNum, String qnaRegDate, String id, int productNo, String qnaTitle, String question, int secret,
         int complete, String answer) {
      super();
      this.qnaNum = qnaNum;
      this.qnaRegDate = qnaRegDate;
      this.id = id;
      this.productNo = productNo;
      this.qnaTitle = qnaTitle;
      this.question = question;
      this.secret = secret;
      this.complete = complete;
      this.answer = answer;
   }

   public int getQnaNum() {
      return qnaNum;
   }

   public void setQnaNum(int qnaNum) {
      this.qnaNum = qnaNum;
   }

   public String getQnaRegDate() {
      return qnaRegDate;
   }

   public void setQnaRegDate(String qnaRegDate) {
      this.qnaRegDate = qnaRegDate;
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

   public String getQnaTitle() {
      return qnaTitle;
   }

   public void setQnaTitle(String qnaTitle) {
      this.qnaTitle = qnaTitle;
   }

   public String getQuestion() {
      return question;
   }

   public void setQuestion(String question) {
      this.question = question;
   }

   public int getSecret() {
      return secret;
   }

   public void setSecret(int secret) {
      this.secret = secret;
   }

   public int getComplete() {
      return complete;
   }

   public void setComplete(int complete) {
      this.complete = complete;
   }

   public String getAnswer() {
      return answer;
   }

   public void setAnswer(String answer) {
      this.answer = answer;
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
      QNAVO other = (QNAVO) obj;
      if (id == null) {
         if (other.id != null)
            return false;
      } else if (!id.equals(other.id))
         return false;
      return true;
   }
   
   
   
   
   
   
}