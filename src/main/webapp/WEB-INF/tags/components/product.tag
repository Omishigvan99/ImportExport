<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="p_name" required="true" type="String"%>
<%@ attribute name="p_price" required="true" type="java.lang.Double" %>
<%@ attribute name="p_id" required="true" type="java.lang.Integer"%>

<div class="card">
	<div class="card-body">
		<h4 class="card-title">${p_name}</h4>
		<p class="card-text">${not empty p_price ? p_price : 'N/A'}</p>
		<a href="ProductDetailsController?product_id=${p_id}" class="btn btn-primary"> More </a>
	</div>
</div>