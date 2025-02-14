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
		</button> <a class="btn btn-sm btn-danger"
		href="ProductRemoveController?productId=${product_id}"> <i
			class="fa-solid fa-trash"></i>
	</a>
	</td>
</tr>