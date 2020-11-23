package com.customerModal;

public class ComplainList 
{
   private String title; 
   private String attachment;
   private String documentnumberref;
   private String description;
   private String category;
   private int id;
   

   public ComplainList(String title,String attachment,String documentnumberref,String description,int id,String category)
   {
	    this.title=title;
	    this.attachment=attachment;
	    this.documentnumberref=documentnumberref;
	    this.description=description;
	    this.id=id;
	    this.category=category;
   }
   
  public String getDescription() {
	return description;
 }
  public void setDescription(String description) {
	this.description = description;
  }
  public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getCategory() {
	return category;
}

public void setCategory(String category) {
	this.category = category;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getAttachment() {
	return attachment;
}

public void setAttachment(String attachment) {
	this.attachment = attachment;
}

public String getDocumentnumberref() {
	return documentnumberref;
}

public void setDocumentnumberref(String documentnumberref) {
	this.documentnumberref = documentnumberref;
}


}
