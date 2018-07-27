/**
 * 
 */

var mail = false;
var psw = false;


function isMailValid(){
	var mailExpr = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{1,3})+$/;
	if($("#mail_input").val().match(mailExpr)){
		$.ajax("/SoftwareHouseWeb/check", {
		    dataType: "text",
		    data:{email:$("#mail_input").val()},
		    type:"GET",
		    success: function(response) {
		    	if(response === "true"){
		    		$("#mail_img").attr("src", "images/green-v.png");
		    		mail = true;
		    		testButton();

		    	}else{
		    		$("#mail_img").attr("src", "images/red-cross.png");
		    		testButton();
		    		mail = false;
		    	}
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		    	alert("Nun se po fa");
		        console.log(textStatus);
		    }
		});
	}
	else{
		$("#mail_img").attr("src", "images/red-cross.png");
		mail = false;
		testButton();
	}
}

function validatePsw(){
	var pswExpr = /^\w{6,}$/;
	if($("#psw_input").val().match(pswExpr)){
		psw = true;
		$("#psw_img").attr("src", "images/green-v.png");
	}else{
		psw = false;
		$("#psw_img").attr("src", "images/red-cross.png");
	}
	testButton();
}


function testButton(){
	if(mail && psw
			&& $("#nome_input").val() != null
			&& $("#cognome_input").val() != null
			&& $("#mail_input").val() != null
			&& $("#date_input").val() != ""){
		document.getElementById("create_btn").disabled = false;
	}
	else
		document.getElementById("create_btn").disabled = true;
}