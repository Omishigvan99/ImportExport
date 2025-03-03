<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="product_id" required="true" type="java.lang.Integer"%>
<%@ attribute name="product_name" required="true"
	type="java.lang.String"%>
<%@ attribute name="quantity" required="true" type="java.lang.Integer"%>
<%@ attribute name="price" required="true" type="java.lang.Double"%>

<tr>
	<td>${product_id}</td>
	<td>${product_name}</td>
	<td>${quantity}</td>
	<td>${price}</td>
	<td>
		<button class="btn btn-sm btn-warning" data-bs-toggle="modal"
			data-bs-target="#editProductModal"
			data-bs-productname="${product_name}"
			data-bs-productid="${product_id}" data-bs-quantity="${quantity}"
			data-bs-price="${price}">
			<i class="fa-solid fa-pen-to-square"></i>
		</button>
		<button class="btn btn-sm btn-danger"
			data-bs-productid="${product_id}" data-bs-toggle="modal"
			data-bs-target="#confirmModal"
			data-bs-message="Are you sure you want to delete this?"
			data-bs-callback="deleteSellerProduct">
			<i class="fa-regular fa-trash-can"></i>
		</button>
	</td>
</tr>