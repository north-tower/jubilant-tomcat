<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Project 4</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Fall 2023 Project 4 Enterprise System</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			
		</div>
	</nav>
	
	
	
	
	<!-- Contact Section-->
	<section class="page-section mt-2" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<p
				class=" text-center text-uppercase text-secondary mb-0">You are connected to the
				Project 4 Enterprise System database as a root-level user 
				</p>
				<p class=" text-center text-uppercase text-secondary mb-0">
				Please enter any SQL query or update command in the box below
				</p>
			<!-- Icon Divider-->
			
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					
					<form method="post" action="rootUser" id="myForm">
						
						<!-- Message input-->
						<div class="form-floating mb-3">
							<textarea class="form-control" name="sqlQuery" id="sqlQuery" type="text"
								placeholder="select * from suppliers" style="height: 10rem"
								data-sb-validations="required"></textarea>
							<label for="message">SQL query</label>
							
						</div>
					
						<input class="btn btn-primary btn-xl"
							type="submit" value="Execute command">
							
							<input  class="btn btn-danger btn-xl" type="button" value="Clear Form" onclick="clearForm()">
							
					</form>
					<form action="ClearRoot" method="post">
					<input class="btn btn-info btn-xl m-1" id="submitButton"
							type="submit" value="Clear results">
							
							</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row justify-content-center ">
			
				
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0  text-center">
					<h4 class="text-uppercase mb-4 text-center">Execution results will appear here</h4>
					<%-- Display inserted values as a list --%>
	<% if (request.getAttribute("errorMessage") != null) { %>
	<td><%= request.getAttribute("errorMessage")
            %></td>
		<%
	}else if (request.getAttribute("successMessage") != null){
		%>
		
		<td><%= request.getAttribute("successMessage")
            %></td>
		
		
	<% } else if (request.getAttribute("queryResults") != null) { %>
	   
					
<% 
    List<String[]> queryResults = (List<String[]>) request.getAttribute("queryResults");
    if (queryResults != null && !queryResults.isEmpty()) {
%>
    <table border="1">
        <thead>
            <tr>
                <% 
                    for (String columnName : queryResults.get(0)) {
                %>
                        <th><%= columnName %></th>
                <% 
                    }
                %>
            </tr>
        </thead>
        <tbody>
            <% 
                for (int i = 1; i < queryResults.size(); i++) {
                    String[] row = queryResults.get(i);
            %>
                    <tr>
                        <% 
                            for (String columnValue : row) {
                        %>
                                <td><%= columnValue %></td>
                        <% 
                            }
                        %>
                    </tr>
            <% 
                }
            %>
        </tbody>
    </table>
<% 
    } else {
        out.println("No results found.");
    }}
%>
				</div>
				
				
			</div>
		</div>
	</footer>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
<script>
function clearForm() {
    document.getElementById("myForm").reset();
}

</body>
</html>
