package com.web.shop.product.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
    
    private int PID;
    private String CATEGORY;
	private String PRODUCTNAME;
    private int PRICE;
    private String EXPLANATION;
    private String picture_url;
    private Date REGISTER;
    private int INVENTORY;
    

	public int getPID() {
		return PID;
	}
	public void setPID(int pID) {
		PID = pID;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}

	public String getPRODUCTNAME() {
		return PRODUCTNAME;
	}
	public void setPRODUCTNAME(String pRODUCTNAME) {
		PRODUCTNAME = pRODUCTNAME;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getEXPLANATION() {
		return EXPLANATION;
	}
	public void setEXPLANATION(String eXPLANATION) {
		EXPLANATION = eXPLANATION;
	}
	public String getPicture_url() {
        return picture_url;
    }
    public void setPrcture_url(String picture_url) {
        this.picture_url = picture_url;
    }
    public Date getREGISTER() {
		return REGISTER;
	}
	public void setREGISTER(Date rEGISTER) {
		REGISTER = rEGISTER;
	}
	public int getINVENTORY() {
		return INVENTORY;
	}
	public void setINVENTORY(int iNVENTORY) {
		INVENTORY = iNVENTORY;
	}
    @Override
    public String toString() {
        return "ProductDTO [PID=" + PID + ", CATEGORY=" + CATEGORY + ", PRODUCTNAME=" + PRODUCTNAME + ", PRICE=" + PRICE
                + ", EXPLANATION=" + EXPLANATION + ", picture_url=" + picture_url + ", REGISTER=" + REGISTER + ", INVENTORY=" + INVENTORY + "]";
    }
}