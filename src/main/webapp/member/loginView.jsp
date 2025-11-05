<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 05/11/2025
  Time: 5:39 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div>
    <main>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                        <div class="card-body">
                            <form method="post" action="<c:url value='/login' />">
                                <c:if test="${param.error != null}">
                                    <div class="my-2" style="color: red;">Invalid email or password.</div>
                                </c:if>
                                <c:if test="${param.logout != null}">
                                    <div class="my-2" style="color: green;">Logout success.</div>
                                </c:if>
                                <div class="form-floating mb-3">
                                    <input required class="form-control" type="text" placeholder="username" name="username" />
                                    <label>Username</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input required class="form-control" type="password" placeholder="Password" name="password" />
                                    <label>Password</label>
                                </div>

                                <div class="mt-4 mb-0">
                                    <div class="d-grid"><button type="submit" class="btn btn-primary btn-block">Login</button></div>
                                </div>
                            </form>
                        </div>
                        <div class="text-center py-3" >
                            <div style="text-decoration: none; color: inherit; cursor: default;" class="small"><a href="/register">Need an account? Sign up!</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script></body>
</html>
