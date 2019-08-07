/* Project : Time Scheduler
 * Author : Ingrid Farkas
 * validation.js: functions used for validation
 */


FNAME_VAL = 'true'; // does the first name input field contain only letters ( and spaces and apostrophes )
LNAME_VAL = 'true'; // does the last name input field contain only letters ( and spaces and apostrophes )
PASSW_EQUAL = 'true'; // do the passwords in 2 input fields match
/*
ISBN_VAL = 'true'; // does the ISBN input field contain only digits
PRICE_VAL = 'true'; // does the Price input field contain only digits
PG_VAL = 'true'; // does the Pages input field contain only digits
YRPUBL_VAL = 'true'; // does the Publication Year input field contain only digits
*/

/*
// setFocus: sets the focus on the input field inputfield ( for instance "first_name" ) on the form with id formid ( if the user didn't
// enter a value in the input field )
function setFocus(formid, inputfield) {
    //alert("empty" + (document.forms[formid][inputfield].value == "") + "aaaa");
	// alert("value1" + document.forms[formid][inputfield].value + "  ");
    //document.getElementById("login_btn").focus();
    if ( document.forms[formid][inputfield].value == "" ) { 
        document.getElementById(inputfield).focus();
    } 
}
*/

// isNumber: shows a message ( in the msg_field ) if the user entered a value that is a non numeric value ( in the input field named input_field )
// fieldFocus - the input field where the focus need to be set ( document.search_book.isbn ) @@@@@@@@@@@@@@@@@@@@@ change this
// num_type - is the input in the field an isbn, price, pages or a year @@@@@@@@@@@@@@@@@@@@@@@ change this
// formid: id of the form
function isNumber(formid, input_field, num_type, msg_field, fieldFocus) {
    var number; // the ISBN number

    // @@@@@@@@@@@@@ change this Get the value of the input field with id = "isbn"
    number = document.getElementById(input_field).value;
    
    // if the value entered in a isbn is not a nuumber 
    if ( isNaN(number)) {
        document.getElementById(msg_field).innerHTML = "* Can contain only digits"; // show the message
        if (num_type == 'is_isbn') {
            ISBN_VAL = 'false';
        } else if (num_type == 'is_pages') {
            PG_VAL = 'false';
        } else if (num_type == 'is_price') {
            PRICE_VAL = 'false';
        } else if (num_type == 'is_yrpubl') {
            YRPUBL_VAL = 'false';
        }
        // @@@@@@@@@@@@@@@@ fieldFocus.focus(); 
    } else {
        if (num_type == 'is_isbn') {
            ISBN_VAL  = 'true';
        } else if (num_type == 'is_pages') {
            PG_VAL = 'true';
        } else if (num_type == 'is_price') {
            PRICE_VAL = 'true';
        } else if (num_type == 'is_yrpubl') {
            YRPUBL_VAL = 'true';
        }
        document.getElementById(msg_field).innerHTML = ""; // show the message 
    }
}

// setNAME_VAL: if is_fname is 'true' sets the FNAME_VAL to val, otherwise sets the LNAME_VAL to val 
function setNAME_VAL(is_fname, val) {
	if (is_fname === 'true') {
    	FNAME_VAL = val;
    } else {
    	LNAME_VAL = val;
    	//alert("LNAME_VAL=" + LNAME_VAL);
    }
}

// valLetters: checks whether in the control input_field there are only letters ( and spaces and apostrophes ). If not in the message_span the message is shown.
// required - if the input field was required to be filled in before showing the message, when the user corrects the mistake, below
// is shown again that the input field is required ( to be filled in )
function valLetters( input_field, message_span,required, is_fname) { 
    var regex = /^[a-zA-Z\x27\x20]+$/;
    //alert ("NAME_VALIDATION: ");
    
    if (!input_field.value == '') {
        if ( !regex.test(input_field.value)) { // if the user entered some characters which are not letters ( in the input_field )
            message_span.innerHTML = "* Can contain only letters, apostrophes and space";
            setNAME_VAL(is_fname, 'false');
        } else { // the user entered characters which are letters ( in the input_field )
        	setNAME_VAL(is_fname, 'true');
            if (required == 'true') {
                message_span.innerHTML = "* Required Field";
            } else {
                message_span.innerHTML = "";
            }
        }
    } else {
        if (required == 'true') {
        	setNAME_VAL(is_fname, 'false');
            message_span.innerHTML = "* Required Field";
        } else {
        	setNAME_VAL(is_fname, 'true');
            message_span.innerHTML = "";
        }
    } 
    
}

// equalPasswords: shows message below the second password input field when the passwords do not match
function equalPasswords(){ 
	password1 = document.getElementById( "user_passw" ).value;
	password2 = document.getElementById( "user_passw2" ).value;
	if (password1 != password2){
		document.getElementById( "message2" ).innerHTML = "Passwords do not match";
		PASSW_EQUAL = 'false';
	} else {
		document.getElementById( "message2" ).innerHTML = "* Required Field";
		PASSW_EQUAL = 'true';
	}	
}

//checkForm: if the validation was successful return TRUE otherwise return FALSE
function checkForm(){
    if ((FNAME_VAL === 'true') && (LNAME_VAL === 'true') && (PASSW_EQUAL === 'true')) { 
        return true;
    } else {
        return false;
    }
}