/**
 * 
 */
var isPswValid = false;
var isMailValid = false;

function tryActivateSubmit(){
	if(isMailValid && isPswValid){
		document.getElementById("login_button").disabled = false;
	}else{
		document.getElementById("login_button").disabled = true;
	}
	
	var mail_bad_txt = document.getElementById("bad_email");
	var psw_bad_txt = document.getElementById("bad_psw");
	var mail_input = document.getElementsByName("j_username")[0];
	var psw_input = document.getElementsByName("j_password")[0];

	if(mail_input.value == "" || isMailValid){
		mail_bad_txt.style.visibility = "hidden";
	}else{
		mail_bad_txt.style.visibility = "visible";	

	}
	if(psw_input.value == "" || isPswValid){
		psw_bad_txt.style.visibility = "hidden";	
	}else{
		psw_bad_txt.style.visibility = "visible";	
	}
}

function validateMail(input){
	var mailExpr = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{1,3})+$/;
	if(input.value.match(mailExpr)){
		isMailValid = true;
	}
	else{
		isMailValid = false;
	}
	tryActivateSubmit();
}

function validatePsw(input){
	var pswExpr = /^\w{6,}$/;
	if(input.value.match(pswExpr)){
		isPswValid = true;
	}
	else{
		isPswValid = false;
	}
	tryActivateSubmit();
}

