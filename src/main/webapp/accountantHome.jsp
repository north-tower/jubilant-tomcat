<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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
	
	<!-- Portfolio Section-->
	<section class="page-section portfolio mt-2" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
				<p
				class=" text-center text-uppercase text-secondary mb-0">You are connected to the
				Project 4 Enterprise System database as a accountant-level-user 
				</p>
				<p class=" text-center text-uppercase text-secondary mb-0">
				Please select the operation you would like to perform from the list below
				</p>
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<form method="post" action="accountant">
<fieldset class="mb-3">
              <legend _msttexthash="500409" _msthash="186">Select Operation</legend>
              <div class="form-check">
                <input type="radio" name="choice" value="supplier" class="form-check-input" >
                <label class="form-check-label" for="disabledRadio1" _>
                Get the maximum status value of all suppliers(Returns a maximum value)</label>
              </div>
               <div class="form-check">
                <input type="radio" name="choice" value="parts" class="form-check-input" >
                <label class="form-check-label" for="disabledRadio1" _>
                Get the total weight of all parts(Returns a sum)</label>
              </div>
               <div class="form-check">
                <input type="radio" name="choice" value="shipments" class="form-check-input" >
                <label class="form-check-label" for="disabledRadio1" _>
                Get the total number of shipment(Returns the current number of shipments in total)</label>
              </div>
              <div class="form-check">
                <input type="radio" name="choice" value="jobs" class="form-check-input" >
                <label class="form-check-label" for="disabledRadio1" _>
                Give the name and number of workers of the job with most workers(Returns two values)</label>
              </div>
               <div class="form-check">
                <input type="radio" name="choice" value="suppliers" class="form-check-input" >
                <label class="form-check-label" for="disabledRadio1" _>
                List the name and status of every supplier(Returns a list of supplier names with status)</label>
              </div>
              
            </fieldset>
            
            
            <input class="btn btn-primary btn-md " id="supplier" name="supplier"
							type="submit" value="Execute Command" >
							
							</form>
			
			
			
		</div>
	</section>
	<!-- About Section-->
	
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row justify-content-center">
			
				
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0  text-center">
					<h4 class="text-uppercase mb-4 text-center">Execution results will appear here</h4>
						<%-- Display status message --%>

<%-- Display inserted values as a list --%>
<% if (request.getAttribute("statusMessage") != null) { %>
    <div class="inserted-values">
    <table>
    <thead>
    <% if (request.getAttribute("jobNames") != null) { %>
    <th>Job Name</th>
    <% } %>
    <th><%= request.getAttribute("statusMessage") %></th>
    
    </thead>
    <tbody>
     <% if (request.getAttribute("jobNames") != null) { %>
    <td><%= request.getAttribute("jobNames") %></td>
    
    <td><%= request.getAttribute("numWorkersList")
            %></td>
            
            <% } %>
            <% if (request.getAttribute("insertedValues") != null) { %>
            <td><%= request.getAttribute("insertedValues")
            %></td>
            
             <% } %>
            
    </tbody>
    </table>
        
       
    </div>
<% } %>

						
	<% if (request.getAttribute("supplierNames") != null) { %>					
  <table border="1">
        <thead>
            <tr>
                <th>Supplier Name</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Retrieve attributes using getAttribute method
                List<String> supplierNames = (List<String>) request.getAttribute("supplierNames");
                List<Integer> statuses = (List<Integer>) request.getAttribute("statuses");

                // Check if the attributes are not null before looping
                if (supplierNames != null && statuses != null && supplierNames.size() == statuses.size()) {
                    for (int i = 0; i < supplierNames.size(); i++) {
            %>
                        <tr>
                            <td><%= supplierNames.get(i) %></td>
                            <td><%= statuses.get(i) %></td>
                        </tr>
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="2">No data available</td>
                    </tr>
            <% 
                }
            %>
        </tbody>
    </table>	
    <% 
                }
            %>
    
    		</div>
				
				
			</div>
		</div>
	</footer>
	
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
