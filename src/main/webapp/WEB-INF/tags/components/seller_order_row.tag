<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="order_id" required="true" type="java.lang.Integer" %>
<%@ attribute name="product_name" required="true" type="java.lang.String" %>
<%@ attribute name="customer_port_id" required="true" type="java.lang.String" %>
<%@ attribute name="quantity" required="true" type="java.lang.Integer" %>
<%@ attribute name="cost" required="true" type="java.lang.Double" %>
<%@ attribute name="date" required="true" type="java.lang.String" %>
<%@ attribute name="status" required="true" type="java.lang.String" %>
<%@ attribute name="price" required="true" type="java.lang.Double" %>

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
        <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                data-bs-target="#updateStatusModal" data-bs-orderid="${order_id}">Track Order</button>
    </td>
</tr>