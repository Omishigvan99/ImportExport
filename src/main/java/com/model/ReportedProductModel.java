package com.model;

import java.sql.Date;
import java.util.List;

import com.consumer.ReportedProductImplementor;

public class ReportedProductModel {
	private int reportId;
	private String consumerPortId;
	private String productName;
	private int productId;
	private String issueType;
	private String solution;
	private Date date;

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public String getConsumerPortId() {
		return consumerPortId;
	}

	public void setConsumerPortId(String consumerPortId) {
		this.consumerPortId = consumerPortId;
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

	public String getIssueType() {
		return issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public List<ReportedProductModel> getConsumerReportedProducts(String consumerId) {
		return new ReportedProductImplementor().getConsumerReportedProducts(consumerId);
	}
	
	public List<ReportedProductModel> getSellerReportedProducts(String sellerId) {
		return new ReportedProductImplementor().getSellerReportedProducts(sellerId);
	}
	
	public void removeReportedProduct(int reportedProductId) {
		new ReportedProductImplementor().removeReportedProduct(reportedProductId);
	}
	
	public void reportProduct(ReportedProductModel reportedProductModel) {
		new ReportedProductImplementor().reportProduct(reportedProductModel);
	}
}
