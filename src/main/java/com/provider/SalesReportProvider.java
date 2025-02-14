package com.provider;

import com.model.SalesModel;

public interface SalesReportProvider {
	public double[] getTotalSalesYearly(SalesModel salesModel);

	public double[] getTotalSalesMonthly(SalesModel salesModel);
}
