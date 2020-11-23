package com.customerModal;

public class Usercustomer 
{
   private int id;
   private String customer_number;
   private String company_name;
   private String billing_address_first;
   private String billing_address_sec;
   private String city;
   private String state;
   private int pincode;
   private String company_pan;
   private String gstin;
   private String tan;
   private String type;
   private String industry;
   private String company_per_name;
   private String company_per_designation;
   private String  company_per_email;
   private Long mobile;
   private String depart_info;
   private int dpi;
   private String colour;
   private String gst_certificate;
   private String pan;
   private String tan_att;
   private String signed_contract;
   private String questionnaire;
   private String others;

   //Extra profile
  private String username;
  private String location;
  private String password;
  //change password
  private String newpassword;
  private String confirm;
  public Usercustomer(String password,String newpassword,String confirm,String company_per_email)
  {
  	 this.password=password;
  	 this.newpassword=newpassword;
  	 this.confirm=confirm;
  	 this.company_per_email=company_per_email;
  }
  public String getNewpassword() {
	return newpassword;
}
public void setNewpassword(String newpassword) {
	this.newpassword = newpassword;
}
public String getConfirm() {
	return confirm;
}
public void setConfirm(String confirm) {
	this.confirm = confirm;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
   
   
   public Usercustomer(String gst_certificate,String pan,String tan_att,String signed_contract,String questionnaire,String others)
   {
	   this.gst_certificate=gst_certificate;
	   this.pan=pan;
	   this.tan_att=tan_att;
	   this.signed_contract=signed_contract;
	   this.questionnaire=questionnaire;
	   this.others=others;
   }
   
   
   
   
    
   
     /*public Usercustomer(int id,String customer_number,String company_name,String billing_address_first,String billing_address_sec,String city,String state,int pincode,String company_pan,String gstin,String tan,String type,String industry,String company_per_name,String company_per_designation,String  company_per_email,int mobile,String depart_info,int dpi,String colour,String gst_certificate,String pan,String tan_att,String signed_contract,String questionnaire,String others)
     {
    	 
     }*/
     
     
     public Usercustomer(String username,String password,String company_per_name,String company_per_designation,Long mobile,String  company_per_email,String location,int id)
     {
    	  this.username=username;
    	  this.password=password;
    	  this.company_per_name=company_per_name;
    	  this.company_per_designation=company_per_designation;
    	  this.mobile=mobile;
    	  this.company_per_email=company_per_email;
    	  this.location=location;
    	  this.id=id;
     }
   
   
  public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCustomer_number() {
	return customer_number;
}
public void setCustomer_number(String customer_number) {
	this.customer_number = customer_number;
}
public String getCompany_name() {
	return company_name;
}
public void setCompany_name(String company_name) {
	this.company_name = company_name;
}
public String getBilling_address_first() {
	return billing_address_first;
}
public void setBilling_address_first(String billing_address_first) {
	this.billing_address_first = billing_address_first;
}
public String getBilling_address_sec() {
	return billing_address_sec;
}
public void setBilling_address_sec(String billing_address_sec) {
	this.billing_address_sec = billing_address_sec;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public int getPincode() {
	return pincode;
}
public void setPincode(int pincode) {
	this.pincode = pincode;
}
public String getCompany_pan() {
	return company_pan;
}
public void setCompany_pan(String company_pan) {
	this.company_pan = company_pan;
}
public String getGstin() {
	return gstin;
}
public void setGstin(String gstin) {
	this.gstin = gstin;
}
public String getTan() {
	return tan;
}
public void setTan(String tan) {
	this.tan = tan;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getIndustry() {
	return industry;
}
public void setIndustry(String industry) {
	this.industry = industry;
}
public String getCompany_per_name() {
	return company_per_name;
}
public void setCompany_per_name(String company_per_name) {
	this.company_per_name = company_per_name;
}
public String getCompany_per_designation() {
	return company_per_designation;
}
public void setCompany_per_designation(String company_per_designation) {
	this.company_per_designation = company_per_designation;
}
public String getCompany_per_email() {
	return company_per_email;
}
public void setCompany_per_email(String company_per_email) {
	this.company_per_email = company_per_email;
}
public Long getMobile() {
	return mobile;
}
public void setMobile(Long mobile) {
	this.mobile = mobile;
}
public String getDepart_info() {
	return depart_info;
}
public void setDepart_info(String depart_info) {
	this.depart_info = depart_info;
}
public int getDpi() {
	return dpi;
}
public void setDpi(int dpi) {
	this.dpi = dpi;
}
public String getColour() {
	return colour;
}
   public void setColour(String colour) {
	this.colour = colour;
   }
   public String getGst_certificate() {
	return gst_certificate;
   }
   public void setGst_certificate(String gst_certificate) {
	this.gst_certificate = gst_certificate;
   }
   public String getPan() {
	return pan; 
   }
   public void setPan(String pan) {
	this.pan = pan;
   }
   public String getTan_att() {
	return tan_att;
   }
   public void setTan_att(String tan_att) {
	this.tan_att = tan_att;
  }
   public String getSigned_contract() {
	return signed_contract;
  } 
  public void setSigned_contract(String signed_contract) {
	this.signed_contract = signed_contract;
  }
   public String getQuestionnaire() {
	return questionnaire;
  }
  public void setQuestionnaire(String questionnaire) {
	this.questionnaire = questionnaire;
  }
  public String getOthers() {
	return others; 
   }
  public void setOthers(String others) {
	this.others = others;
  }
}
