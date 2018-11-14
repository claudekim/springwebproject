package kr.co.domain;
import java.io.Serializable;

public class UserVO implements Serializable {

   private static final long serialVersionUID = 1L;

   private String id;
   private String pw;
   private String name;
   private String address;
   private String phone;
   private int point;
   private String accountdate;
   private String grade;
   
   public UserVO() {}

   public UserVO(String id, String pw, String name, String address, String phone, int point, String accountdate,
         String grade) {
      super();
      this.id = id;
      this.pw = pw;
      this.name = name;
      this.address = address;
      this.phone = phone;
      this.point = point;
      this.accountdate = accountdate;
      this.grade = grade;
   }

   
   
   
   
   public UserVO(String id, String pw, String name, String address, String phone) {         // 회원가입 할때 
      super();
      this.id = id;
      this.pw = pw;
      this.name = name;
      this.address = address;
      this.phone = phone;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPw() {
      return pw;
   }

   public void setPw(String pw) {
      this.pw = pw;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public int getPoint() {
      return point;
   }

   public void setPoint(int point) {
      this.point = point;
   }

   public String getAccountdate() {
      return accountdate;
   }

   public void setAccountdate(String accountdate) {
      this.accountdate = accountdate;
   }

   public String getGrade() {
      return grade;
   }

   public void setGrade(String grade) {
      this.grade = grade;
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
      UserVO other = (UserVO) obj;
      if (id == null) {
         if (other.id != null)
            return false;
      } else if (!id.equals(other.id))
         return false;
      return true;
   }
   
   
   
   
   
}

/*
ID VARCHAR2(20) PRIMARY KEY,
PW VARCHAR2(20) NOT NULL,
NAME VARCHAR2(20) NOT NULL,
ADDRESS VARCHAR2(100) NOT NULL,
PHONE VARCHAR2(30) NOT NULL,
POINT NUMBER(30),
ACCOUNTDATE DATE DEFAULT SYSDATE,
GRADE VARCHAR2(30) DEFAULT 'BASIC',*/