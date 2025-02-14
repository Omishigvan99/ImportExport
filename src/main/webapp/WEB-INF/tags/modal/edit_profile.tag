<%@ tag language="java" pageEncoding="UTF-8"%>
<div class="modal fade" id="updateProfileModal" tabindex="-1"
	aria-labelledby="updateProfileModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="updateProfileModalLabel">Update
					Profile</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- Location Update -->
				<form action="UpdateProfileController" method="post">
					<h2>Update Location</h2>
					<div class="mb-3">
						<label for="location" class="form-label">Location</label> <input
							type="text" class="form-control" id="location" name="location"
							placeholder="Enter your new location" />
						<button type="submit" class="btn btn-success mt-2">Update
							Location</button>
					</div>
				</form>

				<hr />

				<!-- Password Update -->
				<form method="post" action="ChangePasswordController">
					<h2>Update Password</h2>
					<input type="hidden" id="portId"
						value="<%=request.getSession(false).getAttribute("port_id")%>" />
					<div class="mb-3">
						<label for="previousPassword" class="form-label">Previous
							Password</label> <input type="password" class="form-control"
							name="old_password" id="previousPassword"
							placeholder="Enter your previous password" />
					</div>
					<div class="mb-3">
						<label for="newPassword" class="form-label">New Password</label> <input
							type="password" class="form-control" id="newPassword"
							name="new_password" placeholder="Enter your new password" />
					</div>
					<div class="mb-3">
						<label for="confirmPassword" class="form-label">Confirm
							New Password</label> <input type="password" class="form-control"
							name="confirm_password" id="confirmPassword"
							placeholder="Confirm your new password" />
					</div>
					<button type="submit" class="btn btn-warning">Update
						Password</button>
				</form>

				<hr />

				<form action="RemoveProfileController" method="post">
					<h2>Delete Account</h2>
					<div class="mb-3">
					<label for="Password" class="form-label">Password</label> <input
						type="password" class="form-control" name="password" id="password"
						placeholder="Enter your password" />
						</div>
			        <button type="submit" class="btn btn-danger">Delete</button>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary"
				data-bs-dismiss="modal">Close</button>
		</div>
	</div>
</div>
</div>