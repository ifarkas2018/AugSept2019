<!-- project : Time Schedule, author : Ingrid Farkas, 2019 -->
<!-- included in addshw_form.jsp -->
<!-- Contact section -->
	<div class="w3-content">
	    <div class="w3-row w3-margin">
	    	<!-- "w3-third" class uses 33% of the parent container -->
	    	<div class="w3-third">
	            &nbsp; &nbsp; &nbsp; &nbsp;
	            <br />
	            &nbsp; &nbsp; &nbsp; &nbsp;
	            <!-- first image on the left hand side from the form -->
	            <img src="../../images/woman_on_phone.jpg" style="width:100%">
	            &nbsp; &nbsp; &nbsp; &nbsp;
	            <!-- second image on the left hand side from the form -->
	            <img src="../../images/woman_with_laptop.jpg" style="width:100%"> 
	            <br />
	            <br />
	        </div>
	        
	        <%
		        // reading from the model variable whether the user is doing Add Employee
				String is_add_emp = (String)(request.getAttribute("is_add_emp"));
	     		// is the user is doing Show Employee
				String is_show_emp = (String)(request.getAttribute("is_show_emp"));
	        %>
	
			<!-- "w3-third" class uses 66% of the parent container -->
	        <div class="w3-twothird w3-container">
	            <br/>
	            <br/>
	            <!--  w3-text-theme-m1 CSS rule which sets the color of the text ( file styles1.css ) -->
	            <div class="w3-container  w3-light-grey w3-padding-32 w3-padding-large" id="show_sched_info"> 
	              	<div class="w3-content w3-text" style="max-width:600px">
	              		<% if (is_add_emp.equals("true")) { // it is Add Employee
	              		%>
		              		<!--  w3-center centers the text -->
			                <h4 class="w3-center"><b>Add Employee</b></h4>
			            <% } else if (is_show_emp.equals("true")) { %>
			            	<!--  w3-center centers the text -->
			                <h4 class="w3-center"><b>Show Employee</b></h4>
			            <% } %>
			            
			            <%
			            	if (is_show_emp.equals("true")) { // it is Show Employee
			            %>
			            
				                <!-- after clicking on the button addshow_emp is called using method post -->
				                <form action="/addshow_emp" name="show_emp" id="show_emp" method="post">
				        <%
			            	} else if (is_add_emp.equals("true")) { // it is Add Employee
			            %>
			            		<!-- after clicking on the button add_login is called using method post -->
				                <form action="/add_login" name="add_emp" id="add_emp" method="post">
				        <%
			            	}
			            	
		                	// if (is_show_emp.equals("true")) { // it is Show Employee @@@@@@@@@@@@@@@@@@@@@ 
		                %>
		                	<!--  @@@@@@@@@@@@@@@@@@@@@@@@'
		                	<div class="w3-section">
		                    	<label>Employee ID</label>
		                    	<input class="w3-input w3-border" type="text" name="emp_id" id="emp_id" onchange='isNum("show_emp", "emp_id", "is_empid", "empid_message");'> 
		                  		<span id="empid_message" class="red_text"></span>
		                  	</div>
		                  	--> 
		                <%
		                	//}
		                %>
		                  	<div class="w3-section">
		                    	<label>First Name</label>
		                    	<%
		                  			if (is_add_emp.equals("true")) { // it is Add Employee
		                  		%>
		                    			<input class="w3-input w3-border" type="text" name="first_name" id="first_name" maxlength="30" onchange="valLetters(document.add_emp.first_name, fname_message, 'true', 'true');" required=true> 
								<%
		                  			} else if (is_show_emp.equals("true")) { // it is Show Employee
		                  		%>
		                  				<input class="w3-input w3-border" type="text" name="first_name" id="first_name" maxlength="30" onchange="valLetters(document.show_emp.first_name, fname_message, 'true', 'true');" required=true>
		                  		<%  
		                  			}	
								%>
								<span id="fname_message" class="red_text">* Required Field</span>	                  	
		                  	</div> 
		                  	
		                  	<div class="w3-section">
		                    	<label>Last Name</label>
		                    	<%
		                  			if (is_add_emp.equals("true")) { // it is Add Employee
		                  		%>
		                    			<input class="w3-input w3-border" type="text" name="last_name" id="last_name" maxlength="30" onchange="valLetters(document.add_emp.last_name, lname_message, 'true', 'false');" required=true> 
		                  		<%
		                  			} else if (is_show_emp.equals("true")) { // it is Show Employee
		                  		%>
		                  				<input class="w3-input w3-border" type="text" name="last_name" id="last_name" maxlength="30" onchange="valLetters(document.show_emp.last_name, lname_message, 'true', 'false');" required=true>
		                  		<%  
		                  			}	
								%>
		                  		<span id="lname_message" class="red_text">* Required Field</span>
		                  	</div> 
		                  	
		                  	<%
		                  		if (is_add_emp.equals("true")) { // it is Add Employee
		                  	%>
				                  	<div class="w3-section">
				                    	<label>Department</label>
				                    	<select class="w3-input w3-border" id="department" name="department">
										    <option value="Sales">Sales</option>
										    <option value="Management">Management</option>
										    <option value="IT">IT</option>
										    <option value="Administ">Administration</option> <!-- @@@@@@@@@@@@@@@@@@@@@do not put Administration - DOES NOT WORK  -->
										    <option value="Support">Support</option>
										</select> 
				                  	</div> 
				                  	<button class="w3-btn w3-camo-grey" onclick="return checkForm();">Next</button> 
				            <%
		                  		} else if (is_show_emp.equals("true")) { // it is Show Employee
				            %>
			                        <input class="w3-input w3-border" type="text" name="show_add" value="show"> 	            
		                  			<button class="w3-btn w3-camo-grey" onclick="return checkForm();">Show Employee</button> 
		                  	<%
		                  		}
		                  	%>
		                </form>
	              	</div>
	            </div>
	            <br />
	        </div>  <!-- end of class="w3-twothird w3-container" -->
	    </div> <!-- end of class="w3-row w3-margin" --> 
    </div> <!-- end of the contact section -->
</div> <!-- end of class="content" -->
