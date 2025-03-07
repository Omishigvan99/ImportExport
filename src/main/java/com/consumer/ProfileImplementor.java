package com.consumer;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.ConsumerModel;
import com.model.SellerModel;
import com.provider.ProfileProvider;

public class ProfileImplementor implements ProfileProvider {

	@Override
	public void updateConsumerProfile(ConsumerModel consumerModel) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call update_consumer_profile(?,?)}");
			callableStatement.setString(1, consumerModel.getConsumerPortId());
			callableStatement.setString(2, consumerModel.getLocation());
			callableStatement.executeUpdate();
			System.out.println("Consumer updated successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteConsumerProfile(ConsumerModel consumerModel) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call delete_consumer(?,?,?)}");
			callableStatement.setString(1, consumerModel.getConsumerPortId());
			callableStatement.setString(2, consumerModel.getPassword());
			callableStatement.setString(3, "consumer");
			callableStatement.executeUpdate();
			System.out.println("Consumer deleted successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateSellerProfile(SellerModel sellerModel) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call update_seller_profile(?,?)}");
			callableStatement.setString(1, sellerModel.getSellerPortId());
			callableStatement.setString(2, sellerModel.getLocation());
			callableStatement.executeUpdate();
			System.out.println("Seller updated successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteSellerProfile(SellerModel sellerModel) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call delete_seller(?,?,?)}");
			callableStatement.setString(1, sellerModel.getSellerPortId());
			callableStatement.setString(2, sellerModel.getPassword());
			callableStatement.setString(3, "seller");
			callableStatement.executeUpdate();
			System.out.println("Seller deleted successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void changeSellerPassword(String portId, String password, String newPassword) {

		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call change_password(?,?,?,?)}");
			callableStatement.setString(1, portId);
			callableStatement.setString(2, password);
			callableStatement.setString(3, newPassword);
			callableStatement.setString(4, "seller");
			callableStatement.executeUpdate();
			System.out.println("Password changed successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void changeConsumerPassword(String portId, String password, String newPassword) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call change_password(?,?,?,?)}");
			callableStatement.setString(1, portId);
			callableStatement.setString(2, password);
			callableStatement.setString(3, newPassword);
			callableStatement.setString(4, "consumer");
			callableStatement.executeUpdate();
			System.out.println("Password changed successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@Override
	public ConsumerModel getConsumerProfile(ConsumerModel consumerModel) {
		ConsumerModel consumer = new ConsumerModel();
		// TODO Auto-generated method stub
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call get_consumer_profile(?)}");
			callableStatement.setString(1, consumerModel.getConsumerPortId());
			ResultSet rs= callableStatement.executeQuery();
			
			while (rs.next()) {
				consumer.setConsumerPortId(rs.getString("port_id"));
				consumer.setLocation(rs.getString("location"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return consumer;
	}
	
	@Override
	public SellerModel getSellerProfile(SellerModel sellerModel) {
		SellerModel seller = new SellerModel();
		// TODO Auto-generated method stub
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call get_seller_profile(?)}");
			callableStatement.setString(1, sellerModel.getSellerPortId());
			ResultSet rs = callableStatement.executeQuery();

			while (rs.next()) {
				seller.setSellerPortId(rs.getString("port_id"));
				seller.setLocation(rs.getString("location"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return seller;
	}
}
