package com.consumer;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.model.OrderModel;
import com.provider.OrdersProvider;

public class OrderImplementor implements OrdersProvider {

	@Override
	public List<OrderModel> getConsumerOrders(String consumerId) {
		
		CallableStatement callableStatement= null;
		
		try {
			
			callableStatement = DBConnection.getConnection().prepareCall("{call get_consumer_orders(?)}");
			callableStatement.setString(1, consumerId);
			
			ResultSet resultSet = callableStatement.executeQuery();
			
			List<OrderModel> orders = new ArrayList<OrderModel>();
			
			while(resultSet.next()) {
				OrderModel order = new OrderModel();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setProductId(resultSet.getInt("product_id"));
                order.setProductName(resultSet.getString("product_name"));
                order.setConsumerId(resultSet.getString("consumer_port_id"));
                order.setPrice(resultSet.getDouble("price"));
                order.setQuantity(resultSet.getInt("quantity"));
                order.setCost(resultSet.getDouble("cost"));
                order.setOrderDate(resultSet.getDate("order_date"));
                order.setOrderPlaced(resultSet.getBoolean("order_placed"));
                order.setOrderDelivered(resultSet.getBoolean("delivered"));
                order.setOrderOutForDelivery(resultSet.getBoolean("out_for_delivery"));
                order.setOrderShipped(resultSet.getBoolean("shipped"));
                
                orders.add(order);
            
			}
			
			return orders;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OrderModel> getSellerOrders(String sellerId) {
CallableStatement callableStatement= null;
		
		try {
			
			callableStatement = DBConnection.getConnection().prepareCall("{call get_seller_orders(?)}");
			callableStatement.setString(1, sellerId);
			
			ResultSet resultSet = callableStatement.executeQuery();
			
			List<OrderModel> orders = new ArrayList<OrderModel>();
			
			while(resultSet.next()) {
				OrderModel order = new OrderModel();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setProductId(resultSet.getInt("product_id"));
                order.setProductName(resultSet.getString("product_name"));
                order.setConsumerId(resultSet.getString("consumer_port_id"));
                order.setPrice(resultSet.getDouble("price"));
                order.setQuantity(resultSet.getInt("quantity"));
                order.setCost(resultSet.getDouble("cost"));
                order.setOrderDate(resultSet.getDate("order_date"));
                order.setOrderPlaced(resultSet.getBoolean("order_placed"));
                order.setOrderDelivered(resultSet.getBoolean("delivered"));
                order.setOrderOutForDelivery(resultSet.getBoolean("out_for_delivery"));
                order.setOrderShipped(resultSet.getBoolean("shipped"));
                
                orders.add(order);
            
			}
			
			return orders;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void placeOrder(OrderModel order) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection().prepareCall("{call place_order(?,?,?)}");
			
			callableStatement.setString(1, order.getConsumerId());
			callableStatement.setInt(2,order.getProductId());
			callableStatement.setInt(3, order.getQuantity());
			
			callableStatement.executeUpdate();
			
			System.out.println("Order placed successfully");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void removeConsumerOrder(OrderModel order) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call delete_consumer_order(?)}");
			callableStatement.setInt(1, order.getOrderId());
			callableStatement.executeUpdate();
			System.out.println("Order removed successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateDelivered(OrderModel order) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call update_delivered_status(?,?)}");
			callableStatement.setInt(1, order.getOrderId());
			callableStatement.setBoolean(2, order.isOrderDelivered());
			callableStatement.executeUpdate();
			System.out.println("Order delivered successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void updateOutForDelivery(OrderModel order) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
                    .prepareCall("{call update_out_for_delivery_status(?,?)}");
            callableStatement.setInt(1, order.getOrderId());
            callableStatement.setBoolean(2, order.isOrderOutForDelivery());
            callableStatement.executeUpdate();
            System.out.println("Order out for delivery successfully");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	@Override
	public void updateShippedStatus(OrderModel order) {
		try {
			CallableStatement callableStatement = DBConnection.getConnection()
					.prepareCall("{call update_shipped_status(?,?)}");
			callableStatement.setInt(1, order.getOrderId());
			callableStatement.setBoolean(2, order.isOrderShipped());
			callableStatement.executeUpdate();
			System.out.println("Order shipped successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
