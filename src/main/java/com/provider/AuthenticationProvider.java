package com.provider;

import com.model.ConsumerModel;
import com.model.SellerModel;

public interface AuthenticationProvider {
	boolean authenticateConsumer(ConsumerModel consumerModel);
	boolean registerConsumer(ConsumerModel consumerModel);
	boolean authenticateSeller(SellerModel sellerModel);
	boolean registerSeller(SellerModel sellerModel);
}
