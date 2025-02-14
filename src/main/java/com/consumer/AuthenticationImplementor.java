package com.consumer;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import com.db.DBConnection;
import com.model.ConsumerModel;
import com.model.SellerModel;
import com.provider.AuthenticationProvider;

public class AuthenticationImplementor implements AuthenticationProvider {

	@Override
	public boolean authenticateConsumer(ConsumerModel consumerModel) {
		try {

			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call authenticate_user(?, ?, ?)}");
			callableStatement.setString(1, consumerModel.getConsumerPortId());
			callableStatement.setString(2, consumerModel.getPassword());
			callableStatement.setString(3, "consumer");
			ResultSet resultSet = callableStatement.executeQuery();

			if (resultSet.next()) {
				if (resultSet.getString("port_id").equals(consumerModel.getConsumerPortId())) {
					return true;
				} else {
					return false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean registerConsumer(ConsumerModel consumerModel) {
		CallableStatement callableStatement = null;
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call register_user(?, ?, ?, ?, ?)}");
			callableStatement.setString(1, consumerModel.getConsumerPortId());
			callableStatement.setString(2, consumerModel.getPassword());
			callableStatement.setString(3, consumerModel.getConfirmPassword());
			callableStatement.setString(4, consumerModel.getLocation());
			callableStatement.setString(5, "consumer");
			ResultSet resultSet = callableStatement.executeQuery();
			if (resultSet.next()) {
				if (resultSet.getString("port_id").equals(consumerModel.getConsumerPortId())) {
					return true;
				} else {
					return false;
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean authenticateSeller(SellerModel sellerModel) {
		try {

			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call authenticate_user(?, ?, ?)}");
			callableStatement.setString(1, sellerModel.getSellerPortId());
			callableStatement.setString(2, sellerModel.getPassword());
			callableStatement.setString(3, "seller");
			ResultSet resultSet = callableStatement.executeQuery();
			if (resultSet.next()) {
				if (resultSet.getString("port_id").equals(sellerModel.getSellerPortId())) {
					return true;
				} else {
					return false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean registerSeller(SellerModel sellerModel) {
		CallableStatement callableStatement = null;
		try {
			callableStatement = DBConnection.getConnection().prepareCall("{call register_user(?, ?, ?, ?, ?)}");
			callableStatement.setString(1, sellerModel.getSellerPortId());
			callableStatement.setString(2, sellerModel.getPassword());
			callableStatement.setString(3, sellerModel.getConfirmPassword());
			callableStatement.setString(4, sellerModel.getLocation());
			callableStatement.setString(5, "seller");
			ResultSet rs = callableStatement.executeQuery();
			if (rs.next()) {
				if (rs.getString("port_id").equals(sellerModel.getSellerPortId())) {
					return true;
				} else {
					return false;
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
