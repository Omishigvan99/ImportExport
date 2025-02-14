package com.consumer;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.ProductModel;
import com.provider.ProductProvider;

public class ProductImplementor implements ProductProvider {
	CallableStatement callableStatement = null;

	@Override
	public List<ProductModel> getProducts(ProductModel productModel) {
		List<ProductModel> products = new ArrayList<>();
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call get_products(?, ?)}");
			callableStatement.setInt(1, 1);
			callableStatement.setInt(2, 10);

			ResultSet resultSet = callableStatement.executeQuery();

			while (resultSet.next()) {
				ProductModel product = new ProductModel();
				product.setProductId(resultSet.getInt("product_id"));
				product.setProductName(resultSet.getString("product_name"));
				product.setProductPrice(resultSet.getDouble("price"));
				product.setProductQuantity(resultSet.getInt("quantity"));
				product.setSellerId(resultSet.getString("seller_id"));
				products.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

	@Override
	public void addProduct(ProductModel productModel) {
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call add_product(?, ?, ?, ?)}");
			callableStatement.setString(1, productModel.getSellerId());
			callableStatement.setString(2, productModel.getProductName());
			callableStatement.setInt(3, productModel.getProductQuantity());
			callableStatement.setDouble(4, productModel.getProductPrice());
			callableStatement.executeUpdate();
			System.out.println("Product added successfully");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateProduct(ProductModel productModel) {
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call update_product(?, ?, ?, ?)}");
            callableStatement.setInt(1, productModel.getProductId());
            callableStatement.setString(2, productModel.getProductName());
            callableStatement.setInt(3, productModel.getProductQuantity());
            callableStatement.setDouble(4, productModel.getProductPrice());
            callableStatement.executeUpdate();
            System.out.println("Product updated successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteProduct(ProductModel productModel) {
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call remove_product(?)}");
			callableStatement.setInt(1, productModel.getProductId());
			callableStatement.executeUpdate();
			System.out.println("Product deleted successfully");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void searchProduct(ProductModel productModel) {
		System.out.println("Searching product from ProductImplementor");
	}

	@Override
	public ProductModel getProduct(int productId) {
		ProductModel product = new ProductModel();
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call get_product(?)}");
			callableStatement.setInt(1, productId);
			ResultSet resultSet = callableStatement.executeQuery();
			product = new ProductModel();

			while (resultSet.next()) {
				product.setProductId(resultSet.getInt("product_id"));
				product.setProductName(resultSet.getString("product_name"));
				product.setProductPrice(resultSet.getDouble("price"));
				product.setProductQuantity(resultSet.getInt("quantity"));
				product.setSellerId(resultSet.getString("seller_id"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return product;
	}

	@Override
	public List<ProductModel> getSellerProducts(String sellerId) {
		List<ProductModel> products = new ArrayList<>();
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call get_seller_products(?)}");
			callableStatement.setString(1, sellerId);

			ResultSet resultSet = callableStatement.executeQuery();

			while (resultSet.next()) {
				ProductModel product = new ProductModel();
				product.setProductId(resultSet.getInt("product_id"));
				product.setProductName(resultSet.getString("product_name"));
				product.setProductPrice(resultSet.getDouble("price"));
				product.setProductQuantity(resultSet.getInt("quantity"));
				product.setSellerId(resultSet.getString("seller_id"));
				products.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return products;
	}

}
