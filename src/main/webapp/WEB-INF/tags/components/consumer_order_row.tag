<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="order_id" required="true" type="java.lang.Integer"%>
<%@ attribute name="product_name" required="true"
	type="java.lang.String"%>
<%@ attribute name="customer_port_id" required="true"
	type="java.lang.String"%>
<%@ attribute name="quantity" required="true" type="java.lang.Integer"%>
<%@ attribute name="cost" required="true" type="java.lang.Double"%>
<%@ attribute name="date" required="true" type="java.lang.String"%>
<%@ attribute name="status" required="true" type="java.lang.String"%>
<%@ attribute name="price" required="true" type="java.lang.Double"%>
<%@ attribute name="product_id" required="true" type="java.lang.Integer"%>

<tr>
	<td>${order_id}</td>
	<td>${customer_port_id}</td>
	<td>${product_name}</td>
	<td>${quantity}</td>
	<td>${price}</td>
	<td>${cost}</td>
	<td>${date}</td>
	<td><span class="badge bg-warning">${status}</span></td>
	<td>
		<button class="btn btn-sm btn-primary" data-bs-toggle="modal"
			data-bs-target="#updateStatusModal"
			onclick="updateProgress('<%=status%>')">
			<i class="fa-solid fa-magnifying-glass-location"></i>
		</button>
		<button class="btn btn-sm btn-warning" data-bs-toggle="modal"
			data-bs-target="#reportProductModal"
			data-bs-productid="${product_id}">
			<i class="fa-regular fa-flag"></i>
		</button>
		<button class="btn btn-sm btn-danger" data-bs-orderid="${order_id}"
			data-bs-toggle="modal" data-bs-target="#confirmModal"
			data-bs-message="Are you sure you want to delete this order?"
			data-bs-callback="deleteConsumerOrder">
			<i class="fa-regular fa-trash-can"></i>
		</button>
	</td>
</tr>