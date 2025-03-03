<%@ tag pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand fw-bolder" href="#"> <i
			class="fa-solid fa-ship"></i> Import Export
		</a>

		<div class="d-flex">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user"></i> <%=request.getSession(false).getAttribute("port_id")%></button>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
						data-bs-target="#updateProfileModal"><i class="fa-solid fa-pen-to-square"></i> Edit profile</a></li>
					<li><a class="dropdown-item" href="LogoutController"><span
							class="text-danger"><i class="fa-solid fa-right-from-bracket"></i> Logout</span></a></li>
				</ul>
			</div>
			<!-- sidebar-menu-button -->
			<button id="sidebar-open" class="btn text-white d-lg-none">
				<i class="bi bi-list"></i>
			</button>
		</div>
	</div>
</nav>

