package com.consumer;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.ReportedProductModel;
import com.provider.ReportedProductProvider;

public class ReportedProductImplementor implements ReportedProductProvider {

	@Override
	public List<ReportedProductModel> getConsumerReportedProducts(String consumerId) {

		try {
			CallableStatement callableStatement = null;
			List<ReportedProductModel> reportedProductList = new ArrayList<ReportedProductModel>();
			callableStatement = DBConnection.getConnection().prepareCall("{call get_consumer_reported_products(?)}");
			callableStatement.setString(1, consumerId);
			ResultSet resultSet = callableStatement.executeQuery();
			
			while(resultSet.next()) {
				ReportedProductModel reportedProduct = new ReportedProductModel();
                reportedProduct.setReportId(resultSet.getInt("report_id"));
                reportedProduct.setConsumerPortId(resultSet.getString("consumer_port_id"));
                reportedProduct.setProductId(resultSet.getInt("product_id"));
                reportedProduct.setProductName(resultSet.getString("product_name"));
                reportedProduct.setIssueType(resultSet.getString("issue_type"));
                reportedProduct.setSolution(resultSet.getString("solution"));
                reportedProduct.setDate(resultSet.getDate("report_date"));
                reportedProductList.add(reportedProduct);
            }
			
			return reportedProductList;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<ReportedProductModel> getSellerReportedProducts(String sellerId) {
		try {
			CallableStatement callableStatement = null;
			List<ReportedProductModel> reportedProductList = new ArrayList<ReportedProductModel>();
			callableStatement = DBConnection.getConnection().prepareCall("{call get_seller_reported_products(?)}");
			callableStatement.setString(1, sellerId);
			ResultSet resultSet = callableStatement.executeQuery();
			
			while(resultSet.next()) {
				ReportedProductModel reportedProduct = new ReportedProductModel();
                reportedProduct.setReportId(resultSet.getInt("report_id"));
                reportedProduct.setConsumerPortId(resultSet.getString("consumer_port_id"));
                reportedProduct.setProductId(resultSet.getInt("product_id"));
                reportedProduct.setProductName(resultSet.getString("product_name"));
                reportedProduct.setIssueType(resultSet.getString("issue_type"));
                reportedProduct.setSolution(resultSet.getString("solution"));
                reportedProduct.setDate(resultSet.getDate("report_date"));
                reportedProductList.add(reportedProduct);
            }
			
			return reportedProductList;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public void removeReportedProduct(int reportedProductId) {
		try {
			CallableStatement callableStatement = null;
			callableStatement = DBConnection.getConnection().prepareCall("{call delete_reported_product(?)}");
			callableStatement.setInt(1, reportedProductId);
			callableStatement.executeQuery();
			System.out.println("Reported Product removed successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void reportProduct(ReportedProductModel reportedProduct) {
		try {
			
			CallableStatement callableStatement = null;
			callableStatement = DBConnection.getConnection().prepareCall("{call report_product(?, ?, ?)}");
			callableStatement.setString(1, reportedProduct.getConsumerPortId());
			callableStatement.setInt(2, reportedProduct.getProductId());
			callableStatement.setString(3, reportedProduct.getIssueType());
			callableStatement.executeUpdate();
			System.out.println("Product reported successfully");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
