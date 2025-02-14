<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="report_id" required="true" type="java.lang.Integer"%>
<%@ attribute name="product_name" required="true"
	type="java.lang.String"%>
<%@ attribute name="issue_type" required="true" type="java.lang.String"%>
<%@ attribute name="date" required="true" type="java.lang.String"%>

<div class="col">
	<div class="card shadow-sm">
		<div class="card-body">
			<div class="d-flex justify-content-between mb-3">
				<span class="badge bg-danger">${issue_type}</span> <small
					class="text-muted">Report ID: ${report_id}</small>
			</div>
			<h5 class="card-title">${product_name}</h5>
			<div class="d-flex justify-content-between align-items-center">
				<small class="text-muted">Reported on: ${date}</small>
				<button class="btn btn-sm btn-outline-primary"
					data-bs-toggle="modal" data-bs-target="#viewReportModal"
					data-bs-reportid="${report_id}"
					data-bs-productname="${product_name}"
					data-bs-issuetype="${issue_type}" 
					data-bs-date="${date}"
					>View Details</button>
			</div>
		</div>
	</div>
</div>