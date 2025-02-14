package com.provider;

import java.util.List;

import com.model.ProductModel;

public interface ProductProvider {
	List<ProductModel> getProducts(ProductModel productModel);

	List<ProductModel> getSellerProducts(String sellerId);

	void addProduct(ProductModel productModel);

	void updateProduct(ProductModel productModel);

	void deleteProduct(ProductModel productModel);

	void searchProduct(ProductModel productModel);

	ProductModel getProduct(int productId);
}
