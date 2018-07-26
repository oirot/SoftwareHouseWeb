/**
 * 
 */

function acquista(e){
	var id_btn= e.id;
	var id_prod = id_btn.split('_')[1];
	var quantity_prod = $("#q_" + id_prod).val();
	var data = new Object;
	$.ajax("/SoftwareHouseWeb/addToCart", {
	    dataType: "text",
	    data:{id:id_prod, quantity:quantity_prod},
	    type:"POST",
	    success: function() {
	        alert("Il prodotto &egrave; stato aggiunto al carrello");
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log(textStatus);
	    }
	});
}
