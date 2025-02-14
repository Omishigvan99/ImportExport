package com.model;

import java.sql.Date;
import java.util.List;

import com.consumer.OrderImplementor;

public class OrderModel {
	
	private int orderId;
	private int productId;
	private String productName;
	private double price;
	private double cost;
	private int quantity;
	private String consumerId;
	private Date orderDate;
	private boolean isOrderPlaced;
	private boolean isOrderShipped;
	private boolean isOrderDelivered;
	private boolean isOrderOutForDelivery;
	

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(String consumerId) {
		this.consumerId = consumerId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public boolean isOrderPlaced() {
		return isOrderPlaced;
	}

	public void setOrderPlaced(boolean isOrderPlaced) {
		this.isOrderPlaced = isOrderPlaced;
	}

	public boolean isOrderShipped() {
		return isOrderShipped;
	}

	public void setOrderShipped(boolean isOrderShipped) {
		this.isOrderShipped = isOrderShipped;
	}

	public boolean isOrderDelivered() {
		return isOrderDelivered;
	}

	public void setOrderDelivered(boolean isOrderDelivered) {
		this.isOrderDelivered = isOrderDelivered;
	}

	public boolean isOrderOutForDelivery() {
		return isOrderOutForDelivery;
	}

	public void setOrderOutForDelivery(boolean isOrderOutForDelivery) {
		this.isOrderOutForDelivery = isOrderOutForDelivery;
	}

	
	public List<OrderModel> getConsumerOrders(String consumerId){
		return new OrderImplementor().getConsumerOrders(consumerId);
	}
	
	public List<OrderModel> getSellerOrders(String sellerId) {
		return new OrderImplementor().getSellerOrders(sellerId);
	}
	
	public void removerConsumerOrder(OrderModel order) {
		new OrderImplementor().removeConsumerOrder(order);
	}
	
	public void placeOrder(OrderModel order) {
		new OrderImplementor().placeOrder(order);
	}
	
	public void updateDelivered(OrderModel order) {
		new OrderImplementor().updateDelivered(order);
	}
	
	public void updateShippedStatus(OrderModel order) {
		new OrderImplementor().updateShippedStatus(order);
	}
	
	public void updateOutForDelivery(OrderModel order) {
		new OrderImplementor().updateOutForDelivery(order);
	}
}
