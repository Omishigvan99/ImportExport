package com.provider;

import com.model.ConsumerModel;
import com.model.SellerModel;

public interface ProfileProvider {
	void updateConsumerProfile(ConsumerModel consumerModel );

	void deleteConsumerProfile(ConsumerModel consumerModel);
	
	void updateSellerProfile(SellerModel sellerModel);
	
	void deleteSellerProfile(SellerModel sellerModel);
	
	void changeSellerPassword(String portId, String password,String newPassword);
	
	void changeConsumerPassword(String portId, String password,String newPassword);
}
