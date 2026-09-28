<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Student Management System</h1>
        <p>Java • Maven • Tomcat • MySQL</p>
    </header>

    <section class="card">
        <h2>Add Student</h2>
        <form method="post" action="${pageContext.request.contextPath}/students">
            <input name="name" placeholder="Student name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input name="course" placeholder="Course" required>
            <button type="submit">Add Student</button>
        </form>
    </section>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <section class="card">
        <h2>Students</h2>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Course</th>
            </tr>
            <c:forEach var="s" items="${students}">
                <tr>
                    <td>${s.id()}</td>
                    <td>${s.name()}</td>
                    <td>${s.email()}</td>
                    <td>${s.course()}</td>
                </tr>
            </c:forEach>
        </table>
    </section>
</div>
</body>
</html>
