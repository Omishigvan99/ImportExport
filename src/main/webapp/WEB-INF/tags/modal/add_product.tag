<%@ tag language="java" pageEncoding="UTF-8"%>
<div class="modal fade" id="addProductModal" tabindex="-1"
	aria-labelledby="addProductModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="addProductModalLabel">Products</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="card">
						<div class="card-header bg-primary text-light">Add new
							Products</div>
						<div class="card-body">
							<form action="ProductAddController" method="post">
								<input id="add-product-sellerid" type="hidden" name="sellerId" value="" />
								<div class="form-floating mb-3">
									<input type="text" class="form-control" name="pname"
										id="formId2" placeholder="" /> <label for="formId2">Name</label>
								</div>

								<div class="form-floating mb-3">
									<input type="number" class="form-control" name="pquantity"
										id="formId4" placeholder="" /> <label for="formId4">Quantity</label>
								</div>

								<div class="form-floating mb-3">
									<input type="number" class="form-control" name="pprice"
										id="formId5" placeholder=""/> <label
										for="formId5">Price</label>
								</div>

								<button id="add-product-submit-button" type="submit" class="btn btn-primary">Add
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
