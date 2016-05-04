$(function(){
	$( "#customerName" ).focus().autocomplete({
	      source: function( request, response ) {
	    		 $.ajax({
	   	          type : "post",
	   	          url: contextPath+'/customer/searchCustomerName',
	   	          dataType: "json",
	   	          contentType: "application/x-www-form-urlencoded; charset=utf-8",
	   	          data: {
	         			customerName:$("#customerName").val()
	   	          },
	   	          success: function( data ) {
                     response( $.map( data.customers, function( item ) {
                       return {
                         label: item.customerName,
                         value: item.customerName
                       };
                     }));
	   	          }
	   	        });
	      },
	      minLength: 0,
	      select: function( event, ui ) {
	    	$("#customerName").val(ui.item.customerName);
	      },
	      open: function() {
	        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
	      },
	      close: function() {
	        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
	      }
	    });
	$('#container').live('mousedown',function(){
		$('#customerName').autocomplete('close', document.getElementById('customerName') );
	});
});