<%@ tag language="java" pageEncoding="UTF-8"%>

<div class="modal fade" id="editProductModal" tabindex="-1"
	aria-labelledby="editProductModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="editProductModalLabel">Edit
					Product</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="card">
						<div class="card-header bg-primary text-light">Edit Product</div>
						<div class="card-body">
							<form action="ProductUpdateController" method="POST">
								<input type="hidden" name="productId" id="productId" value="" />
								<div class="form-floating mb-3">
									<input type="text" class="form-control" name="pname"
										id="productName" placeholder="pname" /> <label
										for="productName">Product Name</label>
								</div>

								<div class="form-floating mb-3">
									<input type="number" class="form-control" name="pquantity"
										id="productQuantity" placeholder="Quantity" /> <label
										for="productQuantity">Quantity</label>
								</div>

								<div class="form-floating mb-3">
									<input type="number" class="form-control" name="pprice"
										id="productPrice" placeholder="Price"/> <label
										for="productPrice">Price</label>
								</div>

								<button type="submit" class="btn btn-primary">Update
									Product</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>