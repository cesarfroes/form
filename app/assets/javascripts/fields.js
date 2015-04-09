$( document ).ready(function() {
	$("#field_category_id").change(function(){
		var field_category_value = $(this).val();
	    
	    $.ajax({
	      method: "POST",
	      url: '/categories/sub_categories',
	      data: {category: field_category_value },
	      dataType: 'json', 
	    })
	    .done(function(data) {
	    	if(data.categories) {
	    	  $('#field_sub_category_id').html("");
	    	  $.each(data.categories, function(i, value) {
                $('#field_sub_category_id').append($('<option>').text(value.name).attr('value', value.id));
              });
	    	}
	    });
    });

	$("#field_field_element_id").change(function(){
		var field_element_value = $(this).val();
	    
	    $.ajax({
	      method: "POST",
	      url: '/fields/options',
	      data: {field_element: field_element_value },
	      dataType: 'json', 
	    })
	    .done(function(data) {
	    	if(data.options)
	    	  $("#field_options").parent().parent().show();
	    	else
              $("#field_options").parent().parent().hide();
	    });
    });
});