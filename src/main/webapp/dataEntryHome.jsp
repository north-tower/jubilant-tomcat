<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Data Entry Home</title>
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
				Project 4 Enterprise System database as a data-entry-level user 
				</p>
				<p class=" text-center text-uppercase text-secondary mb-0">
				Enter the data values in a form below to add a new record to the corresponding database table
				</p>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-12 col-xl-12">
				
					<form method="post" action="supplier">
						<div class="row">
						<p class=" text-center text-uppercase text-secondary mb-0">
				Suppliers Record Insert
				</p>
						<!-- Name input-->
						<div class="col-md-3">
						<div class="form-floating mb-3">
							<input class="form-control" id="snum" name="snum" type="text"
								 data-sb-validations="required" />
							<label for="name">snum</label>
						</div>
						</div>
						<div class="col-md-3">
						<div class="form-floating mb-3">
							<input class="form-control" id="sname" type="text" name="sname" /> <label for="email">sname</label>
						</div>
						</div>
						<!-- Phone number input-->
						<div class="col-md-3">
						<div class="form-floating mb-3">
							<input class="form-control" id="status" name="status" type="text"
								 />
							<label for="phone">status</label>
						</div>
						</div>
						<div class="col-md-3">
						<div class="form-floating mb-3">
							<input class="form-control" id="city" type="text" name="city" id="city"/>
							<label for="phone">city</label>
							
						</div>
						</div>
						<!-- Submit Button-->
						<div class="row  justify-content-center">
						<div class="col-md-4">
						
						<input class="btn btn-primary btn-md " id="supplier" name="supplier"
							type="submit" value="Enter supplier record into database" >
							</div>
								</div>
						</div>
							</form>
							 <form action="ClearData" method="post">
							<div class="col-md-4">
						<button class="btn btn-primary btn-md text-danger text-bold " id="submitButton"
							type="submit">Clear data and results</button>
						</div>
							</form>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-12 col-xl-12">
				
					<form method="post" action="parts">
						<div class="row">
						<p class=" text-center text-uppercase text-secondary mb-0">
				Parts Record Insert
				</p>
						<!-- Name input-->
						<div class="col-md-3">
						<div class="form-floating mb-2">
							<input class="form-control" id="pnum" name="pnum" type="text"
								 data-sb-validations="required" />
							<label for="name">pnum</label>
						</div>
						</div>
						<div class="col-md-2">
						<div class="form-floating mb-3">
							<input class="form-control" id="pname" type="text" name="pname" /> <label for="email">pname</label>
						</div>
						</div>
						<!-- Phone number input-->
						<div class="col-md-2">
						<div class="form-floating mb-2">
							<input class="form-control" id="color" name="color" type="text"
								 />
							<label for="phone">color</label>
						</div>
						</div>
						<div class="col-md-2">
						<div class="form-floating mb-2">
							<input class="form-control"  type="text" name="weight" id="weight"/>
							<label for="phone">weight</label>
							
						</div>
						</div>
						<div class="col-md-3">
						<div class="form-floating mb-3">
							<input class="form-control" id="city" type="text" name="city" id="city"/>
							<label for="phone">city</label>
							
						</div>
						</div>
						<!-- Submit Button-->
						<div class="row  justify-content-center">
						<div class="col-md-4">
						
						<input class="btn btn-primary btn-md " id="supplier" name="supplier"
							type="submit" value="Enter part record into database" >
							</div>
								</div>
						</div>
							</form>
							 <form action="ClearData" method="post">
							<div class="col-md-4">
						<button class="btn btn-primary btn-md text-danger text-bold " id="submitButton"
							type="submit">Clear data and results</button>
						</div>
							</form>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-12 col-xl-12">
				
					<form method="post" action="jobs">
						<div class="row">
						<p class=" text-center text-uppercase text-secondary mb-0">
				Jobs Record Insert
				</p>
						<!-- Name input-->
						<div class="col-md-3">
						<div class="form-floating mb-2">
							<input class="form-control" id="jnum" name="jnum" type="text"
								 data-sb-validations="required" />
							<label for="name">jnum</label>
						</div>
						</div>
						<div class="col-md-3">
						<div class="form-floating mb-3">
							<input class="form-control" id="jname" type="text" name="jname" /> <label for="email">jname</label>
						</div>
						</div>
						<!-- Phone number input-->
						<div class="col-md-3">
						<div class="form-floating mb-2">
							<input class="form-control" id="numworkers" name="numworkers" type="text"
								 />
							<label for="phone">numworkers</label>
						</div>
						</div>
						<div class="col-md-3">
						<div class="form-floating mb-2">
							<input class="form-control"  type="text" name="city" id="city"/>
							<label for="phone">city</label>
							
						</div>
						</div>
						
						<!-- Submit Button-->
						<div class="row  justify-content-center">
						<div class="col-md-4">
						
						<input class="btn btn-primary btn-md " id="supplier" name="supplier"
							type="submit" value="Enter part record into database" >
							</div>
								</div>
						</div>
							</form>
							 <form action="ClearData" method="post">
							<div class="col-md-4">
						<button class="btn btn-primary btn-md text-danger text-bold " id="submitButton"
							type="submit">Clear data and results</button>
						</div>
							</form>
				</div>
				<div class="row justify-content-center">
				<div class="col-lg-12 col-xl-12">
				
					<form method="post" action="shipments">
						<div class="row">
						<p class=" text-center text-uppercase text-secondary mb-0">
				Shipments Record Insert
				</p>
						<!-- Name input-->
						<div class="col-md-3">
						<div class="form-floating mb-2">
							<input class="form-control" id="snum" name="snum" type="text"
								 data-sb-validations="required" />
							<label for="name">snum</label>
						</div>
						</div>
						<div class="col-md-3">
						<div class="form-floating mb-3">
							<input class="form-control" id="pname" type="text" name="pname" /> <label for="email">pnum</label>
						</div>
						</div>
						<!-- Phone number input-->
						<div class="col-md-3">
						<div class="form-floating mb-2">
							<input class="form-control" id="jnum" name="jnum" type="text"
								 />
							<label for="phone">jnum</label>
						</div>
						</div>
						<div class="col-md-3">
						<div class="form-floating mb-2">
							<input class="form-control"  type="text" name="quantity" id="quantity"/>
							<label for="phone">quantity</label>
							
						</div>
						</div>
						
						<!-- Submit Button-->
						<div class="row  justify-content-center">
						<div class="col-md-4">
						
						<input class="btn btn-primary btn-md " id="shipments" name="shipments"
							type="submit" value="Enter part record into database" >
							</div>
								</div>
						</div>
							</form>
							 <form action="ClearData" method="post">
							<div class="col-md-4">
						<button class="btn btn-primary btn-md text-danger text-bold " id="submitButton"
							type="submit">Clear data and results</button>
						</div>
							</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
<footer class="footer text-center">
		<div class="container">
			<div class="row justify-content-center">
			
				
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0  text-center">
					<h4 class="text-uppercase mb-4 text-center">Execution results will appear here</h4>
						<%-- Display status message --%>


<%-- Display inserted values as a list --%>
<% if (request.getAttribute("insertedValues") != null) { %>
    <div class="inserted-values">
        
        <div><%= request.getAttribute("statusMessage") %>
            
            
            <%= request.getAttribute("insertedValues")
            %>-successfully entered into the database
        </div>
    </div>
<% } %>
						
						
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
    