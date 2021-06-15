package com.bteam.violet.domain;

import java.util.Date;
import java.util.List;

public class CustVO {
   
   private int cust_bno;
   private String cust_name;
   private String cust_birth;
   private String cust_gender;
   private String cust_id;
   private String cust_password;
   private String cust_address;
   private String cust_phone;
   private String cust_job;
   private String cust_area;
   private String cust_religion;
   private String cust_smoking;
   private String cust_drinking;
   private String cust_exer;
   private String cust_food;
   private String cust_pet;
   private String cust_study;
   private String cust_hobby;
   private String cust_char;
   private String cust_photo;
   private String cust_say;
   private Date cust_joindate;
   private int cust_different;
   private   String cust_email;
   
   // 비밀번호 변경을 위한 변수선언
   private String new_password;
   
   //profile 사진 업로드
    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;
   
    private List<CustVO> attachList;
   
   
   public List<CustVO> getAttachList() {
      return attachList;
   }
   public void setAttachList(List<CustVO> attachList) {
      this.attachList = attachList;
   }
   public String getUuid() {
      return uuid;
   }
   public void setUuid(String uuid) {
      this.uuid = uuid;
   }
   public String getUploadPath() {
	   uploadPath = uploadPath.replace("\\", "/");
	   return uploadPath;
   }
   public void setUploadPath(String uploadPath) {
      this.uploadPath = uploadPath;
   }
   public String getFileName() {
      return fileName;
   }
   public void setFileName(String fileName) {
      this.fileName = fileName;
   }
   public boolean isFileType() {
      return fileType;
   }
   public void setFileType(boolean fileType) {
      this.fileType = fileType;
   }
   public String getCust_email() {
      return cust_email;
   }
   public void setCust_email(String cust_email) {
      this.cust_email = cust_email;
   }
   public int getCust_bno() {
      return cust_bno;
   }
   public void setCust_bno(int cust_bno) {
      this.cust_bno = cust_bno;
   }
   public String getCust_name() {
      return cust_name;
   }
   public void setCust_name(String cust_name) {
      this.cust_name = cust_name;
   }
   
   public String getCust_birth() {
      return cust_birth;
   }
   public void setCust_birth(String cust_birth) {
      this.cust_birth = cust_birth;
   }
   public String getCust_gender() {
      return cust_gender;
   }
   public void setCust_gender(String cust_gender) {
      this.cust_gender = cust_gender;
   }
   public String getCust_id() {
      return cust_id;
   }
   public void setCust_id(String cust_id) {
      this.cust_id = cust_id;
   }
   public String getCust_password() {
      return cust_password;
   }
   public void setCust_password(String cust_password) {
      this.cust_password = cust_password;
   }
   public String getCust_address() {
      return cust_address;
   }
   public void setCust_address(String cust_address) {
      this.cust_address = cust_address;
   }
   public String getCust_phone() {
      return cust_phone;
   }
   public void setCust_phone(String cust_phone) {
      this.cust_phone = cust_phone;
   }
   public String getCust_job() {
      return cust_job;
   }
   public void setCust_job(String cust_job) {
      this.cust_job = cust_job;
   }
   public String getCust_area() {
      return cust_area;
   }
   public void setCust_area(String cust_area) {
      this.cust_area = cust_area;
   }
   public String getCust_religion() {
      return cust_religion;
   }
   public void setCust_religion(String cust_religion) {
      this.cust_religion = cust_religion;
   }
   public String getCust_smoking() {
      return cust_smoking;
   }
   public void setCust_smoking(String cust_smoking) {
      this.cust_smoking = cust_smoking;
   }
   public String getCust_drinking() {
      return cust_drinking;
   }
   public void setCust_drinking(String cust_drinking) {
      this.cust_drinking = cust_drinking;
   }
   public String getCust_exer() {
      return cust_exer;
   }
   public void setCust_exer(String cust_exer) {
      this.cust_exer = cust_exer;
   }
   public String getCust_food() {
      return cust_food;
   }
   public void setCust_food(String cust_food) {
      this.cust_food = cust_food;
   }
   public String getCust_pet() {
      return cust_pet;
   }
   public void setCust_pet(String cust_pet) {
      this.cust_pet = cust_pet;
   }
   public String getCust_study() {
      return cust_study;
   }
   public void setCust_study(String cust_study) {
      this.cust_study = cust_study;
   }
   public String getCust_hobby() {
      return cust_hobby;
   }
   public void setCust_hobby(String cust_hobby) {
      this.cust_hobby = cust_hobby;
   }
   public String getCust_char() {
      return cust_char;
   }
   public void setCust_char(String cust_char) {
      this.cust_char = cust_char;
   }
   public String getCust_photo() {
      return cust_photo;
   }
   public void setCust_photo(String cust_photo) {
      this.cust_photo = cust_photo;
   }
   public String getCust_say() {
      return cust_say;
   }
   public void setCust_say(String cust_say) {
      this.cust_say = cust_say;
   }
   public Date getCust_joindate() {
      return cust_joindate;
   }
   public void setCust_joindate(Date cust_joindate) {
      this.cust_joindate = cust_joindate;
   }
   
   public int getCust_different() {
      return cust_different;
   }
   public void setCust_different(int cust_different) {
      this.cust_different = cust_different;
   }
   
   
   public String getNew_password() {
      return new_password;
   }
   public void setNew_password(String new_password) {
      this.new_password = new_password;
   }
   
   
   @Override
   public String toString() {
      return "CustVO [cust_bno=" + cust_bno + ", cust_name=" + cust_name + ", cust_birth=" + cust_birth
            + ", cust_gender=" + cust_gender + ", cust_id=" + cust_id + ", cust_password=" + cust_password
            + ", cust_address=" + cust_address + ", cust_phone=" + cust_phone + ", cust_job=" + cust_job
            + ", cust_area=" + cust_area + ", cust_religion=" + cust_religion + ", cust_smoking=" + cust_smoking
            + ", cust_drinking=" + cust_drinking + ", cust_exer=" + cust_exer + ", cust_food=" + cust_food
            + ", cust_pet=" + cust_pet + ", cust_study=" + cust_study + ", cust_hobby=" + cust_hobby
            + ", cust_char=" + cust_char + ", cust_photo=" + cust_photo + ", cust_say=" + cust_say
            + ", cust_joindate=" + cust_joindate + ", cust_different=" + cust_different + ", cust_email="
            + cust_email + ", new_password=" + new_password + ", uuid=" + uuid + ", uploadPath=" + uploadPath
            + ", fileName=" + fileName + ", fileType=" + fileType + ", attachList=" + attachList + "]";
   }
   
}