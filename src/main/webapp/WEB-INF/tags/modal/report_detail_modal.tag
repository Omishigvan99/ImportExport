<%@ tag language="java" pageEncoding="UTF-8"%>

<div class="modal fade" id="viewReportModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Report Details</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
					<h6>Report ID</h6>
					<p id="report_id"></p>
				</div>
				<div class="mb-3">
					<h6>Product name</h6>
					<p id="product_name"></p>
				</div>
				<div class="mb-3">
					<h6>Issue Type</h6>
					<p id="issue_type">Quality Issue</p>
				</div>
				<div class="mb-3">
					<h6>Report Date</h6>
					<p id="report_date"></p>
				</div>
				<div class="mb-3">
					<a id="removeReportedProductLink" href="#" class="bg-danger btn btn-secondary">Delete</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Ok</button>
				</div>
			</div>
		</div>
	</div>
</div>
