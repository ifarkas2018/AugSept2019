<!-- project : Time Schedule, author : Ingrid Farkas, 2019 -->
<!-- show_task_info is shown when the URL is localhost:8080/task_update - method is POST, localhost:8080/add_d_form - method is POST, localhost:8080/add_task_get - method is GET,
	 localhost:8080/del_task_get - method is GET -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- include the links to the external style sheets -->	  
	<%@ include file="header.jsp"%>
	<script>
		DATE_VAL = 'true'; // has the entered date a date format
		START_T_VAL = 'true'; // has the entered start time the format hh:mm AM/PM
		END_T_VAL  = 'true'; // has the entered end time the format hh:mm AM/PM
		
		// isDate: shows a message ( in the msg_field ) if the user entered a date ( in the input field named input_field )
		function isDate(input_field, msg_field) {
			var date;
			
			// the date in the input field
			date = document.getElementById(input_field).value;
			
			if (date.indexOf("//") < 0) {
				var arr = date.split("/"); // split the date using the character /
	
				if ((isNaN(arr[0])) || (isNaN(arr[1])) || (isNaN(arr[2]))) { // if the day, month or year is not a number
					DATE_VAL = 'false';
					document.getElementById(msg_field).innerHTML = "* Can Contain Only Digits"; // show the message
				} else {
					// var digit1 = arr[0].charAt(0);
					// alert( typeof arr[0]);
					/*
					if (arr[0]<31)
						alert("less than 31");
					else
						alert("more than 31");
					*/
					if (arr[0]>31 || arr[1]>12) {
						DATE_VAL = 'false';
						document.getElementById(msg_field).innerHTML = "* The Day Has To Be < 31 And The Month Has To Be <12";
					} else {
						DATE_VAL = 'true';
						document.getElementById(msg_field).innerHTML = "* Required Field";
					}
				}
			} else {
				DATE_VAL = 'false';
				document.getElementById(msg_field).innerHTML = "* Can Contain Only Digits"; // show the message
			}
		}
		
		// setStartEnd: sets the START_T_VAL ( or END_T_VAL ) to 'false' depending whether it is start time  
		function setStartEnd( start ) {
			if (start) {// set the indicator that the entered time is not valid ( start time or end time )
				START_T_VAL = 'false'; 
			} else {
				END_T_VAL = 'false';
			}
			
			alert("START_T_VAL = " + START_T_VAL );
		}
		
		// setStartEndT: sets the START_T_VAL ( or END_T_VAL ) to 'true' depending whether it is start time  
		function setStartEndT( start ) {
			if (start) {// set the indicator that the entered time is valid ( start time or end time )
				START_T_VAL = 'true'; 
			} else {
				END_T_VAL = 'true';
			}
			
			// alert("START_T_VAL = " + START_T_VAL );
		}
		
		// isValHour: returns true if hour is a valid hour ( between 00 and 12)
		function isValHour( hour ) {
			var hour1; // first digit of the hour
			var hour2; // second digit of the hour
			
			hour1 = hour.charAt(0);
			alert("hour1:" + hour1);
			
			if (hour.length === 2){
				hour2 = hour.charAt(1); 
			} else {
				hour2 = -1;
			}
			alert("hour2:" + hour2);
			// @@@@@@@@@@@@@ what does happen if there is no hour2
			if ( !isNaN(hour1) ) { // is hour1 a number
				if ( !isNaN(hour2) ) { // is hour2 a number
					if ( hour2 == -1 ) {
						return true; // the hour has only one digit
					} else if ( hour1 == 0 ) {
						return true;
					} else if ( hour1 == 1 && (hour2 == 0 || hour2 == 1 || hour2 == 2 )){
						return true;
					} else {
						return false;
					}
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
		
		// isValMin: returns true if min is a valid minute ( between 00 and 60)
		function isValMin( min ) {
			var min1; // first digit of the minute
			var min2; // second digit of the minute
			
			min1 = min.charAt(0);
			min2 = min.charAt(1);
			// alert("MIN.LENGTH" + min.length);
			// alert("min=" + min);
			if (min.length != 2) {
				//alert("branch 1");
				return false; // the minute has to have 2 digits
			}
			
			if ( !isNaN(min1) ) { // is min1 a number
				if ( !isNaN(min2) ) { // is min2 a number
					if (min1 <= 5 && min1 >= 0) {
						//alert("branch 2");
						return true;
					} else {
						//alert("branch 3");
						return false;
					}
				} else {
					//alert("branch 4");
					return false;
				}
			} else {
				//alert("branch 5");
				return false;
			}
		}
		
		
		
		// validTime: shows a message ( in the msg_field ) if the user entered a value that is not hh:mm AM/PM ( in the input field named input_time ) 
		// start : is it the start time or end time of the task
		function validTime( input_time, start, msg_field ){
			var val_hour = true; // is the value entered for hour < 12
			var val_min = true; // is the value entered for minute < 60
			var minutes = 0;
			var hours = 0;
			var min_pos; // position of digits in the minute
			var is_digit = true; // is the character a digit
			
			alert("validTime");
			// the time in the input field
			
		    time = document.getElementById(input_time).value;
			
			var str_time = time.trim();
			
			// alert("str_time trimmed" + str_time );
			pos = str_time.indexOf("AM");
			
			// alert( "AM pos" + pos );
			if (pos < 0) { // AM is not found in the string
				pos = str_time.indexOf("am"); // find the position of the am
			} 
			if (pos < 0) { // AM or am is not found in the string
				pos = str_time.indexOf("PM"); // find the position of the PM
			}
			if (pos < 0) { // AM or am or PM is not found in the string
				pos = str_time.indexOf("pm"); // find the position of the PM
			}
			
			// alert("pos AM" + pos);
			if (pos < 0) {
				setStartEnd ( start ); // sets the var. START_T_VAL or END_T_VAL to 'false'
			}
				
			if (pos > 0) { // AM or am or PM or pm were found
				pos_colon = str_time.indexOf(":");
				//alert("pos_colon" + pos_colon); 
				min_pos = pos_colon + 1;
				var pos_diff = min_pos - pos_colon; 
				while ( is_digit && pos_diff <= 2 ) { // does the minute have only 2 digits
					// alert("pos_diff" + pos_diff); 
					//alert("min_pos" + min_pos);
					 //alert("is_digit" + is_digit);
					pos_diff = min_pos - pos_colon;
					character = str_time.charAt(min_pos);
					if (character == ' '){
						is_digit = false;
					} else {
						is_digit = !(isNaN(str_time.charAt(min_pos)));
					}
					//alert("loop: min_pos" + min_pos);
					//alert("charAt(min_pos)=" + str_time.charAt(min_pos));
					//alert("loop: is_digit" + is_digit );
					
					min_pos++;
				}
				
				// is_digit = !isNaN(str_time.charAt(min_pos));
				alert("after:min_pos" + min_pos);
				//alert("after:pos_colon" + pos_colon);
				// alert("is_digit" + is_digit);
				alert("after:pos_diff" + pos_diff );
				//alert("character:" + character);
				//alert("after:is_digit" + is_digit);
				/*
				if (is_digit || (pos_diff != 3)) { // the minute doesn't have 2 digits
					//alert("set start end");
					setStartEnd( start ); // sets the var. START_T_VAL or END_T_VAL to 'true'
				*/
				alert("after:pos" + pos );
				min_pos--; // at the end of the loop I increased the min_pos for 1
				if ((pos_diff == 3) && ((min_pos === pos) || ((min_pos+1 === pos) && (character ===' ')))){
					// alert("pos_colon" + pos_colon);
					if (pos_colon == 1 || pos_colon == 2) { // : is at the required position
						hours = str_time.substring(0, pos_colon);
						//alert("hours:" + hours);
						val_hour = isValHour( hours ); // is the number before the : <= 12
						// alert("val_hour:" + val_hour);
						if (val_hour) { // the hour is valid
							//alert("hours: valid");
							min1 = str_time.charAt(pos_colon + 1);  // first digit of the minute
							// alert("min1=" + min1);
							if ( !isNaN(min1) ) { // min1 is a digit
								min2 = str_time.charAt(pos_colon + 2);  // second digit of the minute
								if ( !isNaN(min2) ) { // min2 is a digit
									min = min1 + min2; // concatenate min1 and min2
									//alert("mins:" + min);
									val_min = isValMin( min ); // is the min < 60
									//alert("val_min:" + val_min);
									if ( val_min === false) {
										setStartEnd( start ); // sets the var. START_T_VAL or END_T_VAL to 'false'
									} else {
										setStartEndT( start ); // sets the var. START_T_VAL or END_T_VAL to 'true'
									}
									// alert("val_min" + val_min);
								} else { // the start time or the end time is not valid
									setStartEnd ( start ); // sets the var. START_T_VAL or END_T_VAL to 'false'
								}
							}  else { // the start time or the end time is not valid
								setStartEnd ( start ); // sets the var. START_T_VAL or END_T_VAL to 'false'
							}
						} else {
							setStartEnd ( start ); // sets the var. START_T_VAL or END_T_VAL to 'false'
						}
						
					} else { // the time is NOT valid ( the : is not at the right position )
						setStartEnd ( start ); // sets the var. START_T_VAL or END_T_VAL to 'false'
					}
				} else { // the minute doesn't have 2 digits
					//alert("set start end");
					setStartEnd( start ); // sets the var. START_T_VAL or END_T_VAL to 'true'	
				}
				
			}
			
			if (START_T_VAL === 'true' && END_T_VAL === 'true') {
				document.getElementById(msg_field).innerHTML = "* Required Field";
			} else {
				document.getElementById(msg_field).innerHTML = "* The Time Has To Be In Required Format "; // show the message
		    }
			
			
			// @@@@ SET MESSAGE
			// alert( "am or pm pos" + pos );
			// hourmin = str_time.substring(pos);
			// .replace(/\s+/g, '');
			//alert("validtime");
		}
		
		// checkForm: if the validation was successful return TRUE otherwise return FALSE
		function checkForm(){
		    if (START_T_VAL === 'true' && END_T_VAL === 'true' && DATE_VAL === 'true') { 
		        return true;
		    } else {
		        return false;
		    }
		}
			
	</script>
</head>

<body>   
    <div class="content"> 
      	<!-- Top menu on small screens -->
      	<header class="w3-container w3-white w3-xlarge w3-padding-16"> 
        	<span class="w3-left">Time Management</span> 
      	</header> <!-- end of header -->
	  	<!-- including the navigation -->
      	<%@ include file="nav1.jsp"%>   
      	
      	<!-- include the content of the web page -->
      	<!-- shows the form with the task name, date, start time, end time --> 
      	<%@ include file="show_task_form.jsp"%> 
      	<br />
      	
      	<!-- include the footer -->
      	<%@ include file="footer.jsp"%>
	</div> 
</body> 