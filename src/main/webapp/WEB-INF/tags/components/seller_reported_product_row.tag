<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="report_id" required="true" type="java.lang.Integer"%>
<%@ attribute name="consumer_id" required="true" type="java.lang.String"%>
<%@ attribute name="product_name" required="true"
	type="java.lang.String"%>
<%@ attribute name="issue_type" required="true" type="java.lang.String"%>
<%@ attribute name="report_date" required="true" type="java.lang.String"%>
<%@ attribute name="solution" required="true" type="java.lang.String"%>
<%@ attribute name="product_id" required="true" type="java.lang.Integer"%>

<tr>
	<td>${report_id}</td>
	<td>${consumer_id}</td>
	<td>${product_id}</td>
	<td>${product_name }</td>
	<td><span class="badge bg-danger">${issue_type}</span></td>
	<td>${report_date}</td>
	<td><span class="badge bg-success">${solution}</span></td>
</tr>