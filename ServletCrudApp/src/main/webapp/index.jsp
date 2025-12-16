<%@ page import="java.util.*, in.rahultech.dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Management</title>

<!-- BOOTSTRAP CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

	<div class="container mt-4">

		<!-- TOP BAR -->
		<div class="d-flex justify-content-between align-items-center mb-3">
			<div class="input-group w-50">
				<span class="input-group-text border-0 text-bg-dark">
				<svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"
				>
                <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
            </svg>
				</span> <input id="searchInput" type="text"
					class="form-control text-bg-secondary p-1.5 border-0 custom-placeholder"
					placeholder="Search by ID or Name...">
			</div>

			<a href="addStudent.jsp" class="btn btn-primary">+ Add Student</a>
		</div>

		<!-- STUDENT TABLE -->
		<table class="table table-bordered table-striped shadow">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Age</th>
					<th>Address</th>
					<th style="width: 150px">Actions</th>
				</tr>
			</thead>

			<tbody id="studentTable">
				<%
				List<Student> list = (List<Student>) request.getAttribute("students");
				if (list != null) {
					for (Student s : list) {
				%>
				<tr>
					<td><%=s.getId()%></td>
					<td><%=s.getName()%></td>
					<td><%=s.getAge()%></td>
					<td><%=s.getAddress()%></td>
					<td><a href="updateStudent?id=<%=s.getId()%>"
						class="btn btn-sm btn-warning">Update</a>

						<button class="btn btn-sm btn-danger" data-bs-toggle="modal"
							data-bs-target="#deleteModal"
							onclick="setDeleteId(<%=s.getId()%>)">Delete</button></td>

				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- DELETE CONFIRM MODAL -->
	<div class="modal fade" id="deleteModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header bg-danger text-white">
					<h5 class="modal-title">Confirm Delete</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body text-center">
					<p class="fs-5">Are you sure you want to delete this student?</p>
				</div>

				<div class="modal-footer justify-content-center">
					<form action="deleteStudent" method="post">
						<input type="hidden" name="id" id="deleteId">
						<button type="submit" class="btn btn-danger">Yes, Delete</button>
					</form>

					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
				</div>

			</div>
		</div>
	</div>

	<!-- SEARCH SCRIPT -->
	<script>
		const searchInput = document.getElementById("searchInput");
		const table = document.getElementById("studentTable");

		searchInput
				.addEventListener(
						"keyup",
						function() {
							let filter = searchInput.value.toLowerCase();
							let rows = table.getElementsByTagName("tr");

							for (let i = 0; i < rows.length; i++) {
								let cols = rows[i].getElementsByTagName("td");
								if (cols.length > 0) {
									let text = (cols[0].textContent + cols[1].textContent)
											.toLowerCase();
									rows[i].style.display = text
											.includes(filter) ? "" : "none";
								}
							}
						});
		
	    function setDeleteId(id) {
	        document.getElementById("deleteId").value = id;
	    }
	</script>

	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
