/**
 * 
 */

function acquista(e){
		var id_btn= e.id;
		var id_prod = id_btn.split('_')[1];
		var quantity_prod = 1;
		var data = new Object;
		$.get("/SoftwareHouseWeb/addToCart", {id:id_prod, quantity:quantity_prod},
				function(e){
					console.log(e);			
				});	
	}