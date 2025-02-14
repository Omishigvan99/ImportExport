package com.model;

import java.util.List;

import com.consumer.ProductImplementor;

public class ProductModel {
	private int productId;
	private String productName;
	private double productPrice;
	private int productQuantity;
	private String sellerId;

	// getters and setters

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String producName) {
		this.productName = producName;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	// method to get all products
	public List<ProductModel> getProducts() {
		return new ProductImplementor().getProducts(this);
	}

	// method to get a product by id
	public ProductModel getProduct(int productId) {
		return new ProductImplementor().getProduct(productId);
	}

	// method to getSellerProducts
	public List<ProductModel> getSellerProducts(String sellerId) {
		return new ProductImplementor().getSellerProducts(sellerId);
	}

	// method to add a product
	public void addProduct(ProductModel productModel) {
		new ProductImplementor().addProduct(this);
	}
	
	// method to update a product
	public void updateProduct(ProductModel productModel) {
		new ProductImplementor().updateProduct(this);
	}
	
	// method to delete a product
	
	public void deleteProduct(ProductModel productModel) {
		new ProductImplementor().deleteProduct(this);
	}
}
