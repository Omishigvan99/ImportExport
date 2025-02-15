package com.model;

import com.consumer.AuthenticationImplementor;
import com.consumer.ProfileImplementor;

public class SellerModel {
	private String sellerPortId;
	private String password;
	private String confirmPassword;
	private String location;
	public String getSellerPortId() {
		return sellerPortId;
	}
	public void setSellerPortId(String sellerPortId) {
		this.sellerPortId = sellerPortId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public boolean registerSeller(SellerModel sellerModel) {
		return new AuthenticationImplementor().registerSeller(sellerModel);
	}
	
	public boolean authenticateSeller(SellerModel sellerModel) {
		return new AuthenticationImplementor().authenticateSeller(sellerModel);
	}
	
	public void updateSellerProfile(SellerModel sellerModel) {
		new ProfileImplementor().updateSellerProfile(sellerModel);
	}
	
	public void deleteSellerProfile(SellerModel sellerModel) {
		new ProfileImplementor().deleteSellerProfile(sellerModel);
	}
	
	public void changeSellerPassword(String portId, String password, String newPassword) {
		new ProfileImplementor().changeSellerPassword(portId, password, newPassword);
	}
	
	public SellerModel getSellerProfile(SellerModel sellerModel) {
		return new ProfileImplementor().getSellerProfile(sellerModel);
	}
	
}
