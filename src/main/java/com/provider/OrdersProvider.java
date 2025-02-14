package com.provider;

import java.util.List;

import com.model.OrderModel;

public interface OrdersProvider {
	List<OrderModel> getConsumerOrders(String consumerId);
	List<OrderModel> getSellerOrders(String sellerId);
	void placeOrder(OrderModel order);
	void removeConsumerOrder(OrderModel order);
	void updateDelivered(OrderModel order);
	void updateShippedStatus(OrderModel order);
	void updateOutForDelivery(OrderModel order);
}
