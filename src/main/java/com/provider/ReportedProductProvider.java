package com.provider;

import java.util.List;

import com.model.ReportedProductModel;

public interface ReportedProductProvider {
	List<ReportedProductModel> getConsumerReportedProducts(String consumerId);
	List<ReportedProductModel> getSellerReportedProducts(String sellerId);
	void removeReportedProduct(int reportedProductId);
	void reportProduct(ReportedProductModel reportedProduct);
}
