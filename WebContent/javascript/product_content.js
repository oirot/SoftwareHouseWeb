/**
 * 
 */

function sendReview(id){
	var comment = $("#commenta").val();
	var stars = $("#stars").val();
	
	$.ajax("/SoftwareHouseWeb/addReview", {
	    dataType: "text",
	    data:{commento:comment, stelle:stars, id:id},
	    type:"POST",
	    success: function(data) {
	    	if(data === "OOK")
	    		alert("Recensione aggiunta");
	    	else
	    		alert("Probelmi con la recensione");
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log(textStatus);
	    }
	});
}