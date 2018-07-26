/**
 * 
 */


var currentInMod = new Object;


function modify(e){
	var id = $(e).attr('id').split('_')[1];
	if(currentInMod.id != null){
		if(id === currentInMod.id)
			return;
		var exId = currentInMod.id;
		$("#name_" + exId).html(currentInMod.name);
		$("#description_" + exId).html(currentInMod.description);
		$("#version_" + exId).html(currentInMod.version);
		$("#price_" + exId).html(currentInMod.price);	
		$("#ida_" + exId).html(currentInMod.ida);
		$("#save_" + exId).prop("disabled", true);
	}
	
	currentInMod.id = id;
	currentInMod.name = $("#name_" + id).html();
	currentInMod.description = $("#description_" + id).html();
	currentInMod.version = $("#version_" + id).html();
	currentInMod.price = $("#price_" + id).html();
	currentInMod.ida = $("#ida_" + id).html();
	
	$("#name_" + id).html('<input type="text" maxlenght="30" id="upl_name" value="'+ currentInMod.name +'">');
	$("#description_" + id).html('<textarea id="upl_desc">' + currentInMod.description + '</textarea>');
	$("#version_" + id).html('<input type="text" maxlenght="3" id="upl_vers" value="'+ currentInMod.version +'">');
	$("#price_" + id).html('<input type="number" id="upl_prez" class="input_price" step="0.25" value="'+ currentInMod.price +'">');
	$("#ida_" + id).html('<input type="text" id="upl_ida" value="'+ currentInMod.ida +'">');
	$("#save_" + id).prop("disabled", false);
	$("#description_" + id).val();
}


function add(){
	var data = new Object;
	data.nome = $("#add_name").val();
	data.desc = $("#add_desc").val();
	data.ida = $("#add_ida").val();
	data.prezzo = $("#add_prez").val();
	data.version = $("#add_vers").val();
	
	$.ajax("/SoftwareHouseWeb/addProduct", {
	    dataType: "text",
	    data:data,
	    type:"POST",
	    success: function() {
	    	console.log();
	    	location.reload();
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	alert("Nun se po fa");
	        console.log(textStatus);
	    }
	});
}

var saveId;

function save(e){
	var id = $(e).attr("id").split('_')[1];
	saveId = id;
	var data = new Object;
	data.id = id;
	data.nome = $("#upl_name").val();
	data.desc = $("#upl_desc").val();
	data.ida = $("#upl_ida").val();
	data.prezzo = $("#upl_prez").val();
	data.version = $("#upl_vers").val();
	
	$.ajax("/SoftwareHouseWeb/addProduct", {
	    dataType: "text",
	    data:data,
	    type:"POST",
	    success: function(){
	    	location.reload();
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	    	alert("Nun se po fa");
	        console.log(textStatus);
	    }
	});
}