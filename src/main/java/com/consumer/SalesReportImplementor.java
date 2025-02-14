package com.consumer;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.SalesModel;
import com.provider.SalesReportProvider;

public class SalesReportImplementor implements SalesReportProvider {
	@Override
	public double[] getTotalSalesMonthly(SalesModel salesModel) {
		double[] result = new double[2];
		try {
			CallableStatement cs = null;
			cs = DBConnection.getConnection().prepareCall("{call generate_sales_report(?,?,?,?)}");
			cs.setString(1, salesModel.getSellerId());
			cs.setString(2, salesModel.getReportType());
			cs.setInt(3, salesModel.getYear());
			cs.setInt(4, salesModel.getMonth());
			
			ResultSet rs = cs.executeQuery();
			
			if (rs.next()) {
				result[0] = rs.getDouble(1);
				result[1] = rs.getDouble(2);
				return result;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public double[] getTotalSalesYearly(SalesModel salesModel) {
		double[] result = new double[2];
		try {
			
			CallableStatement cs = null;
            cs = DBConnection.getConnection().prepareCall("{call generate_sales_report(?,?,?,?)}");
            cs.setString(1, salesModel.getSellerId());
            cs.setString(2, salesModel.getReportType());
            cs.setInt(3, salesModel.getYear());
            cs.setInt(4, salesModel.getMonth());
            
            ResultSet rs = cs.executeQuery();
            
            if (rs.next()) {
				result[0] = rs.getDouble(1);
				result[1] = rs.getDouble(2);
				return result;
			}
			
			if (rs.next()) {
				return result;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
