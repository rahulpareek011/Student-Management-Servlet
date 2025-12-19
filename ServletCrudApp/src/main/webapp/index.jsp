<%@ page import="java.util.*, in.rahultech.dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Management System</title>

<!-- BOOTSTRAP CSS -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!-- BOOTSTRAP ICONS -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<!-- TAILWIND (for Toast only) -->
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-light">

<div class="container mt-4">

    <!-- TOP BAR -->
    <div class="d-flex justify-content-between align-items-center mb-3">

        <!-- SEARCH -->
        <div class="input-group w-50">
            <span class="input-group-text bg-dark text-white">
                <i class="bi bi-search"></i>
            </span>
            <input id="searchInput" type="text" class="form-control"
                   placeholder="Search by ID or Name...">
        </div>

        <!-- ADD STUDENT -->
        <a href="addStudent.jsp" class="btn btn-primary">
            <i class="bi bi-person-plus-fill me-1"></i> Add Student
        </a>
    </div>

    <!-- STUDENT TABLE -->
    <table class="table table-bordered table-striped shadow">
        <thead class="table-dark text-center">
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

                <td class="text-center">
                    <a href="updateStudent?id=<%=s.getId()%>"
                       class="btn btn-sm btn-warning me-1">
                        <i class="bi bi-pencil-square"></i>
                    </a>

                    <button class="btn btn-sm btn-danger"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteModal"
                            onclick="setDeleteId(<%=s.getId()%>)">
                        <i class="bi bi-trash-fill"></i>
                    </button>
                </td>
            </tr>
            <%
                }
            }
            %>
        </tbody>
    </table>
</div>

<!-- ===== TOAST (TAILWIND) ===== -->
<div id="toast"
     class="fixed top-6 right-6 z-50 hidden
            bg-white border-l-4 border-emerald-600
            shadow-xl rounded-xl px-6 py-4
            flex items-center gap-4
            transform translate-x-20 opacity-0
            transition-all duration-500">

    <!-- ICON -->
    <div id="toastIcon"
         class="w-10 h-10 flex items-center justify-center
                rounded-full bg-emerald-100 text-emerald-600
                scale-0 transition-transform duration-500">
        <i class="bi bi-check-lg text-xl"></i>
    </div>

    <!-- MESSAGE -->
    <div>
        <p class="font-semibold text-slate-800" id="toastMsg"></p>
        <p class="text-sm text-slate-500">
            Operation completed successfully
        </p>
    </div>
</div>

<!-- DELETE CONFIRM MODAL -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    Confirm Delete
                </h5>
                <button type="button" class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body text-center">
                <p class="fs-5">Are you sure you want to delete this student?</p>
            </div>

            <div class="modal-footer justify-content-center">
                <form action="deleteStudent" method="post">
                    <input type="hidden" name="id" id="deleteId">
                    <button type="submit" class="btn btn-danger">
                        <i class="bi bi-trash-fill me-1"></i> Yes, Delete
                    </button>
                </form>

                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">
                    Cancel
                </button>
            </div>

        </div>
    </div>
</div>

<!-- SCRIPTS -->
<script>
    // SEARCH
    const searchInput = document.getElementById("searchInput");
    const table = document.getElementById("studentTable");

    searchInput.addEventListener("keyup", function () {
        let filter = searchInput.value.toLowerCase();
        let rows = table.getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            let cols = rows[i].getElementsByTagName("td");
            if (cols.length > 0) {
                let text = (cols[0].textContent + cols[1].textContent).toLowerCase();
                rows[i].style.display = text.includes(filter) ? "" : "none";
            }
        }
    });

    function setDeleteId(id) {
        document.getElementById("deleteId").value = id;
    }

    /* TOAST */
    const params = new URLSearchParams(window.location.search);
    const success = params.get("success");

    if (success) {
        let msg = "";
        if (success === "added") msg = "Student added successfully";
        if (success === "updated") msg = "Student updated successfully";
        if (success === "deleted") msg = "Student deleted successfully";

        const toast = document.getElementById("toast");
        const icon = document.getElementById("toastIcon");
        document.getElementById("toastMsg").innerText = msg;

        toast.classList.remove("hidden");

        setTimeout(() => {
            toast.classList.remove("translate-x-20", "opacity-0");
            toast.classList.add("translate-x-0", "opacity-100");
            icon.classList.add("scale-100");
        }, 50);

        setTimeout(() => {
            toast.classList.add("translate-x-20", "opacity-0");
            icon.classList.remove("scale-100");
        }, 3000);

        setTimeout(() => {
            toast.classList.add("hidden");
        }, 3500);

        window.history.replaceState({}, document.title, "students");
    }
</script>

<!-- BOOTSTRAP JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
