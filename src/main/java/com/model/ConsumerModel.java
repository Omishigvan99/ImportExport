package com.model;

import com.consumer.AuthenticationImplementor;
import com.consumer.ProfileImplementor;

public class ConsumerModel {
	private String consumerPortId;
	private String password;
	private String confirmPassword;
	private String location;
	public String getConsumerPortId() {
		return consumerPortId;
	}
	public void setConsumerPortId(String consumerPortId) {
		this.consumerPortId = consumerPortId;
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
	
	public boolean registerConsumer(ConsumerModel consumerModel) {
		return new AuthenticationImplementor().registerConsumer(consumerModel);
	}
	
	public boolean authenticateConsumer(ConsumerModel consumerModel) {
		return new AuthenticationImplementor().authenticateConsumer(consumerModel);
	}
	
	public void updateConsumerProfile(ConsumerModel consumerModel) {
		new ProfileImplementor().updateConsumerProfile(consumerModel);
	}
	
	public void deleteConsumerProfile(ConsumerModel consumerModel) {
		new ProfileImplementor().deleteConsumerProfile(consumerModel);
	}
	
	public void changeConsumerPassword(String portId, String password, String newPassword) {
		new ProfileImplementor().changeConsumerPassword(portId, password, newPassword);
	}
	
	public ConsumerModel getConsumerProfile(ConsumerModel consumerModel) {
		return new ProfileImplementor().getConsumerProfile(consumerModel);
	}
}
