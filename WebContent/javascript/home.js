/**
 * 
 */

var contents = [{id:'1', logo:'webgear.png', img:"webgeartop.jpg"}, 
				{id:'2',logo:'visualtool.png', img:'visualtooltop.jpg'},
				{id:'3', logo:"easy.png", img:'gird.jpg'}];
var index = 0;
var ex;

function change(i){
	$("#img_prodotto").attr('src', "images/" + contents[i].img);
	$("#btn_" + ex).attr('id', "btn_" + contents[i].id);
	$("#q_" + ex).attr('id', "q_" + contents[i].id);
	
	$.ajax("/SoftwareHouseWeb/product_content.jsp", {
	    dataType: "html",
	    data:{id: contents[i].id, logo: contents[i].logo},
	    type:"GET",
	    success: function(data) {
	    	$("#prodotto").html(data);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log(textStatus);
	    }
	});
} 

function move_sx(){
	ex = contents[index].id;
	index = index - 1;
	if(index < 0){
		index = contents.length - 1;
	}
	change(index);
}

function move_dx(){
	ex = contents[index].id;
	index = index + 1;
	if(index >= contents.length){
		index = 0;
	}
	change(index);
}