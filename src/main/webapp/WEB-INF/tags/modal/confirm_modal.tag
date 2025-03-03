<%@ tag language="java" pageEncoding="UTF-8"%>
<div class="modal fade" id="confirmModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Confirmation</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body" id="confirmMessage">Are you sure?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-danger" id="confirmBtn">Confirm</button>
			</div>
		</div>
	</div>
</div>

<script defer>
	document.getElementById("confirmModal").addEventListener(
			"show.bs.modal",
			function(event) {
				let button = event.relatedTarget; // Button that triggered the modal
				let message = button.getAttribute("data-bs-message"); // Get message
				let callback = button.getAttribute("data-bs-callback"); // Get function name
				let product_id = button.getAttribute("data-bs-productid"); // Get product id
				let order_id = button.getAttribute("data-bs-orderid"); // Get order id

				document.getElementById("confirmMessage").innerText = message; // Set message

				document.getElementById("confirmBtn").onclick = function() {
					if (callback == "deleteSellerProduct"
							&& typeof window[callback] === "function") {
						window[callback](product_id); // Execute the function dynamically
					}

					if (callback == "deleteConsumerOrder"
							&& typeof window[callback] === "function") {
						window[callback](order_id); // Execute the function dynamically
					}

					bootstrap.Modal.getInstance(
							document.getElementById("confirmModal")).hide(); // Close modal
				};
			});

	function deleteSellerProduct(product_id) {
		window.location.href = "ProductRemoveController?product_id="
				+ product_id;
	}

	function deleteConsumerOrder(order_id) {
		window.location.href = "RemoveOrderController?order_id=" + order_id;
	}
</script>