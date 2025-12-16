<%@ page import="in.rahultech.dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Student</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container mt-4">

    <h2 class="mb-3">Update Student</h2>

    <form action="updateStudent" method=post class="p-4 shadow bg-white rounded">
    	<input type="hidden" name="id" value="${student.id}">

        <div class="mb-3">
            <label class="form-label">New Student Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">New Age</label>
            <input type="number" name="age" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">New Address</label>
            <input type="text" name="address" class="form-control" required>
        </div>

        <button class="btn btn-success">Save</button>
        <a href="students" class="btn btn-secondary">Cancel</a>

    </form>

</div>

</body>
</html>
