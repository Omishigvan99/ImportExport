package com.model;

import com.consumer.SalesReportImplementor;

public class SalesModel {
	private String sellerId;
	private String reportType;
	private int year;
	private int month;
	
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
	public double[] getYearlySales(SalesModel salesModel) {
		return new SalesReportImplementor().getTotalSalesYearly(salesModel);
	}
	
	public double[] getMonthlySales(SalesModel  salesModel) {
		return new SalesReportImplementor().getTotalSalesMonthly(salesModel);
	}
}
