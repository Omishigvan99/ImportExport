<%@ tag language="java" pageEncoding="UTF-8"%>

<div class="modal fade" id="updateStatusModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Update Order Status</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<div class="container mt-5">
					<div class="d-flex justify-content-between position-relative mt-4">
						<div class="container mt-5">
							<h3 class="text-center">Shipment Tracking</h3>

							<!-- Progress Bar Container -->
							<div class="progress-container">
								<div class="progress-line"></div>
								<div id="progress-bar" class="progress-bar-custom"></div>

								<!-- Status Steps -->
								<div class="status-steps">
									<div class="status-step">
										<div id="step-1" class="status-circle">✔</div>
										<div class="status-label">Order Placed</div>
									</div>
									<div class="status-step">
										<div id="step-2" class="status-circle">✔</div>
										<div class="status-label">Shipped</div>
									</div>
									<div class="status-step">
										<div id="step-3" class="status-circle">✔</div>
										<div class="status-label">Out for Delivery</div>
									</div>
									<div class="status-step">
										<div id="step-4" class="status-circle">✔</div>
										<div class="status-label">Delivered</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Order Steps -->
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>