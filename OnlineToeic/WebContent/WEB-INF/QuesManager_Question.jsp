<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="icon/m.ico">

    <title>Monggogo Toeic - Admin</title>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- Icon của button login -->
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
   
    <!-- Bootstrap core CSS -->
    <link href="Style/css/bootstrap.css" rel="stylesheet">
    <link href="Style/css/img-hover.css" rel="stylesheet">
    <link href="Style/css/header.css" rel="stylesheet">
    <link href="Style/css/style.css" rel="stylesheet">
    <link href="Style/css/hiddenform_management.css" rel="stylesheet">

    <script src="Style/js/jquery-3.2.1.min.js"></script>
    <!-- thư viện jquery -->
    <script src="Style/js/glm-ajax.js"></script>
    <script src="Style/js/login_large.js"></script>
    <!-- validate from by jquery -->
    <script src="Style/js/bootstrap.js"></script>
            	<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function(){
        	$("#modal-4options").hide();
        	
        	
        	function autopage(){
        		$('.page-number').remove(); //k xóa là nó sinh ra phân trang hoài
        		$('table.paginated').each(function() {
					var currentPage = 0;
					var numPerPage = 6;  /* Muốn hiển thị 1 page có bao nhiêu hàng */
					var $table = $(this);
					$table.bind('repaginate', function() {
						$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
					});
					$table.trigger('repaginate');
					var numRows = $table.find('tbody tr').length;
					var numPages = Math.ceil(numRows / numPerPage);
					var $pager = $('<div class="pager"></div>');
                   var pre="",next="next";
                   if(numPages>1){
                   	pre="<";
                   	next=">";
                   }else{
                   	pre="";
                   	next="";
                   }
                   if(numPages>1){
                       $('<span class="page-number"></span>').text(pre).bind('click', {
                               newPage: page
                           }, function(event) {
                               currentPage = currentPage-1;
                           if(currentPage<0){
                               currentPage=0;
                           }else if(currentPage>numPages){
                               currentPage=numPages-1;
                           }
                                   $table.trigger('repaginate');
                                   $(this).addClass('active').siblings().removeClass('active');

                           }).appendTo($pager).addClass('clickable');
                   }
					for (var page = 0; page < numPages; page++) {
						$('<span class="page-number"></span>').text(page + 1).bind('click', {
							newPage: page
						}, function(event) {
							currentPage = event.data['newPage'];
							$table.trigger('repaginate');
							$(this).addClass('active').siblings().removeClass('active');
						}).appendTo($pager).addClass('clickable');
					}
					if(numPages>1){
                   $('<span class="page-number"></span>').text(next).bind('click', {
                               newPage: page
                           }, function(event) {
                               currentPage = currentPage+1;
                       if(currentPage<0){
                               currentPage=0;
                           }else if(currentPage>numPages){
                               currentPage=numPages-1;
                           }
                       
                           if(currentPage<numPages){                                                                                             $table.trigger('repaginate');
                               $(this).addClass('active').siblings().removeClass('active');

                           }
                           }).appendTo($pager).addClass('clickable');
                   
					$pager.insertAfter($table).find('span.page-number:first').addClass('active').css({'float':'left','margin-left':'50px'});
					}
				});
        	}
        	
        	function autopage2(){
//         		$('.page-number2').remove(); //k xóa là nó sinh ra phân trang hoài
//         		$('table.paginated2').each(function() {
// 					var currentPage = 0;
// 					var numPerPage = 6;  /* Muốn hiển thị 1 page có bao nhiêu hàng */
// 					var $table = $(this);
// 					$table.bind('repaginate', function() {
// 						$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
// 					});
// 					$table.trigger('repaginate');
// 					var numRows = $table.find('tbody tr').length;
// 					var numPages = Math.ceil(numRows / numPerPage);
// 					var $pager = $('<div class="pager"></div>');
//                    var pre="",next="next";
//                    if(numPages>1){
//                    	pre="pre";
//                    	next="next";
//                    }else{
//                    	pre="";
//                    	next="";
//                    }
//                    if(numPages>1){
//                        $('<span class="page-number2"></span>').text(pre).bind('click', {
//                                newPage: page
//                            }, function(event) {
//                                currentPage = currentPage-1;
//                            if(currentPage<0){
//                                currentPage=0;
//                            }else if(currentPage>numPages){
//                                currentPage=numPages-1;
//                            }
//                                    $table.trigger('repaginate');
//                                    $(this).addClass('active').siblings().removeClass('active');

//                            }).appendTo($pager).addClass('clickable');
//                    }
// 					for (var page = 0; page < numPages; page++) {
// 						$('<span class="page-number2"></span>').text(page + 1).bind('click', {
// 							newPage: page
// 						}, function(event) {
// 							currentPage = event.data['newPage'];
// 							$table.trigger('repaginate');
// 							$(this).addClass('active').siblings().removeClass('active');
// 						}).appendTo($pager).addClass('clickable');
// 					}
// 					if(numPages>1){
//                    $('<span class="page-number2"></span>').text(next).bind('click', {
//                                newPage: page
//                            }, function(event) {
//                                currentPage = currentPage+1;
//                        if(currentPage<0){
//                                currentPage=0;
//                            }else if(currentPage>numPages){
//                                currentPage=numPages-1;
//                            }
                       
//                            if(currentPage<numPages){                                                                                             $table.trigger('repaginate');
//                                $(this).addClass('active').siblings().removeClass('active');

//                            }
//                            }).appendTo($pager).addClass('clickable');
                   
// 					$pager.insertAfter($table).find('span.page-number2:first').addClass('active');
// 					}
// 				});
        	}
        	function reload(){
       		 $.get("act_Question", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
     		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
     		        if (responseJson.check == "fail") {
    		                    //$('#message').text("List isEmpty! Name not found!");
    		                    //$('#message').css('color', 'red');
    		                  	alert("Loaddata failed!");
    		                    return;
    		        }
     		       $.each(responseJson, function(index, product) { 
            			$("#productTable > tbody > tr").remove();
            		 });
     		       
     		        var $table = document.getElementById("row");
					
     		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
     		        	$("<tr>").appendTo($table)                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        		.append($("<td>").text(product.questionID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
     		                .append($("<td>").text(product.contentGrName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
     		               	.append($("<td>").text(product.content))
     		                .append($("<td>")
     		                		.append($("<a>")
     		                				.append($("<i>").addClass("fa fa-pencil edit"))
     		                			   )
     		                				.click(function(){
     		                		           	 $.post("act_Question",{action: '3',questionID : product.questionID}, 
     		                		           		function(responseJson) {   
    		 		                		           		if (responseJson.check == "fail") {
    		 		                		                    //$('#message').text("List isEmpty! Name not found!");
    		 		                		                    //$('#message').css('color', 'red');
    		 		                		                  	alert("Loaddata failed!");
    		 		                		                    return;
    		 		                		        		}
     		                		     		        	$("#contentGrID2").val(responseJson.questionID);
     		                		     		        	$("#content2").val(responseJson.content);
    		                		     		        	$("#contentGrName2").val(responseJson.contentGrName);
    	 		  		                		           	 event.preventDefault();

     		                		     		    }
     		                		           	 );
     		                		           	 event.preventDefault();
      		                					$("#modal-4options").show();

     		                				})
     		                )
     		                .append($("<td>")
     		                		.append($("<a>")
     		                				.append($("<i>").addClass("fa fa-trash remove"))
     		                				)
     		                				.click(function(){
     		                					var retVal = confirm("Do you really want to delete this?");          	
    	 		           	                    if( retVal == true ){
    	 		           	                    	$.post("act_Question",{action: '4',questionID : product.questionID}, 
    	   		                						function(responseJson) {  
    		   		                						if (responseJson.check == "fail") {
    			 		               		                  	alert("Deleting failed!");
    			 		               		                    return;
    		 		               		       				 }
    	   		                							reload();reload2();
    		                		     		    	}
    		                		           	 	);
    		                		           	 	event.preventDefault();
    	 		           	                       return true;
    	 		           	                    }
    	 		           	                    else{
    	 		           	                       return false;
    	 		           	                    }
       		                					
       		                				})
     		                		)
     		                		// Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
     		        });
     		       autopage();
        		    autopage2();
     		    }); 
       	 }
        	
        	
        	
        	$.post("act_Question",{action: '5'},function(responseJson) {
    			 if (responseJson.check == "fail") {
   		        	alert("Loaddata failed!");
		                return;       		                  	
	 		        }
    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
   		        	$("#contentGrName > option").remove();
   		        	$("#contentGrName2 > option").remove();
     		 	});
    			 
    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
  		        	$("#contentGrName").append($("<option>").val(product.contentGrName)
	     		       				.text(product.contentGrName))
	     		    $("#contentGrName2").append($("<option>").val(product.contentGrName)
	     		       				.text(product.contentGrName))
	     		       	
    		 	});
    		 });
        	
        	 $.get("act_Question", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
 		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
 		        if (responseJson.check == "fail") {
		                    //$('#message').text("List isEmpty! Name not found!");
		                    //$('#message').css('color', 'red');
		                  	alert("Loaddata failed!");
		                    return;
		        }
 		        var $table = document.getElementById("row");
		        if(responseJson.length>10){
		        	
		        }
 		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        	$("<tr>").appendTo($table)                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
 		        		.append($("<td>").text(product.questionID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.contentGrName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.content))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_Question",{action: '3',questionID : product.questionID}, 
 		                		           		function(responseJson) {   
		 		                		           		if (responseJson.check == "fail") {
		 		                		                    //$('#message').text("List isEmpty! Name not found!");
		 		                		                    //$('#message').css('color', 'red');
		 		                		                  	alert("Loaddata failed!");
		 		                		                    return;
		 		                		        		}
 		                		     		        	$("#contentGrID2").val(responseJson.questionID);
 		                		     		        	$("#content2").val(responseJson.content);
		                		     		        	$("#contentGrName2").val(responseJson.contentGrName);
	 		  		                		           	 event.preventDefault();

 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-4options").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Question",{action: '4',questionID : product.questionID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();reload2();
		                		     		    	}
		                		           	 	);
		                		           	 	event.preventDefault();
	 		           	                       return true;
	 		           	                    }
	 		           	                    else{
	 		           	                       return false;
	 		           	                    }
   		                					
   		                				})
 		                		)
 		                		// Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
 		        });
 		       autopage();
    		    autopage2();
 		    });
        	 
        	 
        	 
        	
        	$('#add1').click(function(){
           	 $.post("act_Question",{action: '1',contentGrName : $('#contentGrName').val(),
           		content : $('#content').val()},
           		function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
           			if (responseJson.check == "fail") {
	                    var retVal = confirm("Please enter your full details with your request!\nDo you want to continute?");          	
                        if( retVal == true ){
                        	$("#modal-3options").show();
                           return true;
                        }
                        else{
                           return false;
                        }
	        		}
           			//xóa table cũ đi
           		 $.each(responseJson, function(index, product) { 
           			$("#productTable > tbody > tr").remove();
           		 });
           	 //Load lại toàn bộ dữ liệu mới sau khi insert
           		 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
     		        	$("#productTable > tbody").append(
     		        	$("<tr>")                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        	.append($("<td>").text(product.questionID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.contentGrName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.content))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_Question",{action: '3',questionID : product.questionID}, 
 		                		           		function(responseJson) {   
		 		                		           		if (responseJson.check == "fail") {
		 		                		                    //$('#message').text("List isEmpty! Name not found!");
		 		                		                    //$('#message').css('color', 'red');
		 		                		                  	alert("Loaddata failed!");
		 		                		                    return;
		 		                		        		}
 		                		     		        	$("#contentGrID2").val(responseJson.questionID);
 		                		     		        	$("#contentGrName2").val(responseJson.contentGrName);
 		                		     		        	$("#content2").val(responseJson.content);
 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-4options").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Question",{action: '4',questionID : product.questionID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();reload2();
		                		     		    	}
		                		           	 	);
		                		           	 	event.preventDefault();
	 		           	                       return true;
	 		           	                    }
	 		           	                    else{
	 		           	                       return false;
	 		           	                    }
   		                					
   		                				})
 		                		)
   		                );
     		        });
           		autopage();
     		    autopage2();
     		    });
           	 event.preventDefault(); // Important! Prevents submitting the form
            });  
        	
        	
        	$('#edit1').click(function(){
           	 $.post("act_Question",{action: '2',contentGrName : $('#contentGrName2').val(),
					questionID : $('#contentGrID2').val(),content : $('#content2').val()},
           	 function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
						if (responseJson.check == "fail") {
		                    var retVal = confirm("Please enter your full details with your request!\nDo you want to continute?");          	
	                        if( retVal == true ){
	                        	$("#modal-4options").show();
	                           return true;
	                        }
	                        else{
	                           return false;
	                        }
		        		}
				//xóa table cũ đi
           		 $.each(responseJson, function(index, product) { 
           			$("#productTable > tbody > tr").remove();
           		 });
           	 //Load lại toàn bộ dữ liệu mới sau khi insert
           		 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
     		        	$("#productTable > tbody").append(
     		        	$("<tr>")                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        	.append($("<td>").text(product.questionID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.contentGrName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.content))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_Question",{action: '3',questionID : product.questionID}, 
 		                		           		function(responseJson) {   
		 		                		           		if (responseJson.check == "fail") {
		 		                		                    //$('#message').text("List isEmpty! Name not found!");
		 		                		                    //$('#message').css('color', 'red');
		 		                		                  	alert("Loaddata failed!");
		 		                		                    return;
		 		                		        		}
 		                		     		        	$("#contentGrID2").val(responseJson.questionID);
 		                		     		        	$("#contentGrName2").val(responseJson.contentGrName);
 		                		     		        	$("#content2").val(responseJson.content);
 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-4options").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Question",{action: '4',questionID : product.questionID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();reload2();
		                		     		    	}
		                		           	 	);
		                		           	 	event.preventDefault();
	 		           	                       return true;
	 		           	                    }
	 		           	                    else{
	 		           	                       return false;
	 		           	                    }
   		                					
   		                				})
 		                		)
   		                );
     		        });
           		autopage();
     		    autopage2();
     		    });
           	 event.preventDefault(); // Important! Prevents submitting the form
            });  
        	
        	
        	
        	
        	//===============================================================================  QUESTION&OPTIONS      	

//===============================================================================  QUESTION&OPTIONS      	
        	
        	//===============================================================================  QUESTION&OPTIONS      	

        	
        	
        	
			$("#modal-6options").hide();  //from edit ques&op
        	
			$('#btn_left2').click(function(){
           	 
	           	$.post("act_Question_Options",{action: '5'},function(responseJson) {
	   			 if (responseJson.check == "fail") {
	  		        	alert("Loaddata failed!");
			                return;       		                  	
		 		        }
	   			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	  		        	$("#queslist > option").remove();
	    		 	});
	   			 
	   			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	 		        	$("#queslist").append($("<option>").val(product.questionID)
		     		       				.text(product.questionID))
		     		       	
	   		 	});
	   		 });
       	
	       	$.post("act_Question_Options",{action: '6'},function(responseJson) {
	  			 if (responseJson.check == "fail") {
	 		        	alert("Loaddata failed!");
			                return;       		                  	
		 		        }
	  			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	 		        	$("#opslist > option").remove();
	   		 	});
	  			 
	  			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
			        	$("#opslist").append($("<option>").val(product.optionID)
		     		       				.text(product.optionID))
		     		       	
	  		 	});
	  		 });
       	$("#modal-5options").show();
      });
        	$.post("act_Question_Options",{action: '5'},function(responseJson) {
    			 if (responseJson.check == "fail") {
   		        	alert("Loaddata failed!");
		                return;       		                  	
	 		        }
    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
   		        	$("#queslist > option").remove();
     		 	});
    			 
    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
  		        	$("#queslist").append($("<option>").val(product.questionID)
	     		       				.text(product.questionID))
	     		       	
    		 	});
    		 });
        	
        	$.post("act_Question_Options",{action: '6'},function(responseJson) {
   			 if (responseJson.check == "fail") {
  		        	alert("Loaddata failed!");
		                return;       		                  	
	 		        }
   			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
  		        	$("#opslist > option").remove();
    		 	});
   			 
   			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        	$("#opslist").append($("<option>").val(product.optionID)
	     		       				.text(product.optionID))
	     		       	
   		 	});
   		 });
        	
        	 $.get("act_Question_Options", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
 		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
 		        if (responseJson.check == "fail") {
		                    //$('#message').text("List isEmpty! Name not found!");
		                    //$('#message').css('color', 'red');
		                  	alert("Loaddata failed!");
		                    return;
		        }
 		        var $table = document.getElementById("row2");
 		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        	$("<tr>").appendTo($table).addClass('article-loop')                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
 		                .append($("<td>").text(product.questionID).css('width','380px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.optionID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.isAnswer))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_Question_Options",{action: '3',ques_op_ID : product.ques_op_ID}, 
 		                		           		function(responseJson) {   
		 		                		           		if (responseJson.check == "fail") {
		 		                		                    //$('#message').text("List isEmpty! Name not found!");
		 		                		                    //$('#message').css('color', 'red');
		 		                		                  	alert("Loaddata failed!");
		 		                		                    return;
		 		                		        		}
		 		                                      	$("#question_op_ID").val(responseJson.ques_op_ID);
		                		     		        	$("#questionID_op").val(responseJson.questionID);
 		                		     		        	$("#contentGrID").val(responseJson.optionID);
 		                		     		        	if(responseJson.isAnswer==true){
 	 		                		     		        	$("#isAnswer2").val("true");
 		                		     		        	}
 		                		     		        	else{
 	 		                		     		        	$("#isAnswer2").val("false");
 		                		     		        	}
	 		  		                		           	 event.preventDefault();

 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-6options").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Question_Options",{action: '4',ques_op_ID : product.ques_op_ID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();reload2();
		                		     		    	}
		                		           	 	);
		                		           	 	event.preventDefault();
	 		           	                       return true;
	 		           	                    }
	 		           	                    else{
	 		           	                       return false;
	 		           	                    }
   		                					
   		                				})
 		                		)
 		                		// Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
 		        });
 		       autopage();
    		    autopage2();$('.article-loop').paginate(6);
 		    });
        	 
        	 
        	 function reload2(){
        		 $.get("act_Question_Options", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
      		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
      		        if (responseJson.check == "fail") {
		                    //$('#message').text("List isEmpty! Name not found!");
		                    //$('#message').css('color', 'red');
		                  	alert("Loaddata failed!");
		                    return;
		        	}
      		        var $table = document.getElementById("row2");
      		      	$.each(responseJson, function(index, product) { 
             			$("#productTable2 > tbody > tr").remove();
             		 });
      		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
      		            $("<tr>").appendTo($table).addClass('article-loop')                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
      		          	.append($("<td>").text(product.questionID).css('width','380px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
		                .append($("<td>").text(product.optionID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
		               	.append($("<td>").text(product.isAnswer))
		                .append($("<td>")
		                		.append($("<a>")
		                				.append($("<i>").addClass("fa fa-pencil edit"))
		                			   )
		                				.click(function(){
		                		           	 $.post("act_Question_Options",{action: '3',ques_op_ID : product.ques_op_ID}, 
		                		           		function(responseJson) {   
		 		                		           		if (responseJson.check == "fail") {
		 		                		                    //$('#message').text("List isEmpty! Name not found!");
		 		                		                    //$('#message').css('color', 'red');
		 		                		                  	alert("Loaddata failed!");
		 		                		                    return;
		 		                		        		}
		 		                		           		$("#question_op_ID").val(responseJson.ques_op_ID);
	                		     		        		$("#questionID_op").val(responseJson.questionID);
		                		     		        	$("#contentGrID").val(responseJson.optionID);
		                		     		        	if(responseJson.isAnswer==true){
 	 		                		     		        	$("#isAnswer2").val("true");
 		                		     		        	}
 		                		     		        	else{
 	 		                		     		        	$("#isAnswer2").val("false");
 		                		     		        	}
		   		                		           	 event.preventDefault();

		                		     		    }
		                		           	 );
		                		           	 event.preventDefault();
		                					$("#modal-6options").show();

		                				})
		                )
		                .append($("<td>")
		                		.append($("<a>")
		                				.append($("<i>").addClass("fa fa-trash remove"))
		                				)
		                				.click(function(){
		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Question_Options",{action: '4',ques_op_ID : product.ques_op_ID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();reload2();
		                		     		    	}
		                		           	 	);
		                		           	 	event.preventDefault();
	 		           	                       return true;
	 		           	                    }
	 		           	                    else{
	 		           	                       return false;
	 		           	                    }
 		                					
 		                				})
		                		)
      		                		// Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
      		        });
      		      autopage();
       		    autopage2();$('.article-loop').paginate(6);
      		    });
        	 }
        	   
             
             
        	$('#edit2').click(function(){
           	 $.post("act_Question_Options",{action: '2',optionID : $('#contentGrID').val(),
           		isAnswer : $('#isAnswer2').val(),questionID : $('#questionID_op').val(),
           		ques_op_ID : $('#question_op_ID').val()},
           	 function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
						if (responseJson.check == "fail") {
		                    var retVal = confirm("Please enter your full details with your request!\nDo you want to continute?");          	
	                        if( retVal == true ){
	                        	$("#modal-6options").show();
	                           return true;
	                        }
	                        else{
	                           return false;
	                        }
		        		}
				//xóa table cũ đi
           		 $.each(responseJson, function(index, product) { 
           			$("#productTable2 > tbody > tr").remove();
           		 });
           	 //Load lại toàn bộ dữ liệu mới sau khi insert
           		 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
     		        	$("#productTable2 > tbody").append(
     		        	$("<tr>").addClass('article-loop')                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        	.append($("<td>").text(product.questionID).css('width','380px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.optionID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.isAnswer))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_Question_Options",{action: '3',ques_op_ID : product.ques_op_ID}, 
 		                		           		function(responseJson) {   
		 		                		           		if (responseJson.check == "fail") {
		 		                		                    //$('#message').text("List isEmpty! Name not found!");
		 		                		                    //$('#message').css('color', 'red');
		 		                		                  	alert("Loaddata failed!");
		 		                		                    return;
		 		                		        		}
		 		                		           		$("#question_op_ID").val(responseJson.ques_op_ID);
	                		     		        		$("#questionID_op").val(responseJson.questionID);
		                		     		        	$("#contentGrID").val(responseJson.optionID);
		                		     		        	if(responseJson.isAnswer==true){
 	 		                		     		        	$("#isAnswer2").val("true");
 		                		     		        	}
 		                		     		        	else{
 	 		                		     		        	$("#isAnswer2").val("false");
 		                		     		        	}
 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-6options").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Question_Options",{action: '4',ques_op_ID : product.ques_op_ID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();reload2();
		                		     		    	}
		                		           	 	);
		                		           	 	event.preventDefault();
	 		           	                       return true;
	 		           	                    }
	 		           	                    else{
	 		           	                       return false;
	 		           	                    }
   		                					
   		                				})
 		                		)
   		                );
     		        });
           		autopage();
     		    autopage2();$('.article-loop').paginate(6);
     		    });
           	 event.preventDefault(); // Important! Prevents submitting the form
            }); 
        	
        	  	

        	$('#add2').click(function(){
              	 $.post("act_Question_Options",{action: '1',questionID : $('#queslist').val(),
              		 optionID : $('#opslist').val(), isAnswer : $('#isAnswer').val()}, function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
              		if (responseJson.check == "fail") {
                       var retVal = confirm("Please enter your full details with your request!\nDo you want to continute?");          	
                       if( retVal == true ){
                       	$("#modal-5options").show();
                          return true;
                       }
                       else{
                          return false;
                       }
           			}
              		 //xóa table cũ đi
              		 $.each(responseJson, function(index, product) { 
              			$("#productTable2 > tbody > tr").remove();
              		 });
              	 //Load lại toàn bộ dữ liệu mới sau khi insert
              		 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
        		        	$("#productTable2 > tbody").append(
        		        	$("<tr>").addClass('article-loop')                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
        		        	.append($("<td>").text(product.questionID).css('width','380px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
     		                .append($("<td>").text(product.optionID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
     		               	.append($("<td>").text(product.isAnswer))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
    		                .append($("<td>")
    		                		.append($("<a>")
    		                				.append($("<i>").addClass("fa fa-pencil edit"))
    		                			   )
    		                				.click(function(){
    		                		           	 $.post("act_Question_Options",{action: '3',ques_op_ID : product.ques_op_ID}, 
    		                		           		function(responseJson) { 
   	 		                		           		if (responseJson.check == "fail") {
   		 		               		                  	alert("Loaddata failed!");
   		 		               		                    return;
   	 		               		       				 }
   	 		                		           		$("#question_op_ID").val(responseJson.ques_op_ID);
                		     		        		$("#questionID_op").val(responseJson.questionID);
	                		     		        	$("#contentGrID").val(responseJson.optionID);
	                		     		        	if(responseJson.isAnswer==true){
	 		                		     		        	$("#isAnswer2").val("true");
		                		     		        	}
		                		     		        	else{
	 		                		     		        	$("#isAnswer2").val("false");
		                		     		        	}
    		                		     		    }
    		                		           	 );
    		                		           	 event.preventDefault();
     		                					$("#modal-6options").show();

    		                				})
    		                )
    		                .append($("<td>")
    		                		.append($("<a>")
    		                				.append($("<i>").addClass("fa fa-trash remove"))
    		                				)
    		                				.click(function(){
    		                					var retVal = confirm("Do you really want to delete this?");          	
   	 		           	                    if( retVal == true ){
   	 		           	                    	$.post("act_Question_Options",{action: '4',ques_op_ID : product.ques_op_ID}, 
   	   		                						function(responseJson) {  
   		   		                						if (responseJson.check == "fail") {
   			 		               		                  	alert("Deleting failed!");
   			 		               		                    return;
   		 		               		       				 }
   		   		                					reload();reload2();
   		                		     		    	}
   		                		           	 	);
   		                		           	 	event.preventDefault();
   	 		           	                       return true;
   	 		           	                    }
   	 		           	                    else{
   	 		           	                       return false;
   	 		           	                    }
      		                					
      		                				})
      		                		)
      		                );
        		        });
              		autopage();
         		    autopage2();$('.article-loop').paginate(6);
        		    });
              	 event.preventDefault(); // Important! Prevents submitting the form
           		
               });  
	        
        });
	</script>
</head>
<body>
	<!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="padding: 0 10px">
		<a class="navbar-brand" href="ForwarToLoginedHome?username=${perinfo.username }"><img src="Style/icon/logo.png" height="50px" style="margin-left: 30px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse lead" id="navbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="ForwarToLoginedHome?username=${perinfo.username }">HOME <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="ForwardToPerinfo_Ques?username=${perinfo.username }">PERSIONAL INFO</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MANAGEMENT</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
						<a class="dropdown-item" href="ForwardToContentGr?username=${perinfo.username }">CONTENT</a>
						<a class="dropdown-item" href="ForwardToQuestion?username=${perinfo.username }">QUESTION</a>
						<a class="dropdown-item" href="ForwardToOptions?username=${perinfo.username }">OPTION</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="HomeForward">LOG OUT</a>
				</li>
			</ul>
			<div id="imaginary_container"> 
                <div class="input-group stylish-input-group input-append">
                    <input type="text" class="form-control"  placeholder="Search" >
                    <span class="input-group-addon">
                        <button type="submit">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>  
                    </span>
                </div>
            </div>
		</div>
	</nav>

    <!-- Cover -->
    <div id="cover" class="carousel">
        <img class="d-block w-100" src="Style/images/cover/cover1.jpg" alt="First slide">

        <div class="carousel-caption">
            <h2><span class="fullname_avt">${perinfo.fullName }</span><span> (</span><span class="fullname_avt" id="yourname">${perinfo.userID }</span><span>)</span></h2>
        </div>
    </div>

   <!-- Form add Option, sử dụng chung với content group -->
    <div class="md-modal5 md-effect-7" id="modal-3options">
        <div class="md-content">
            <h4>
                <span>
                        Add Question 
                        <button type="button" class="close" data-dismiss="modal-3options" aria-label="Close" id="closebtn">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_question" class="was-validated" action="" method="">
                <fieldset>
                <!--  
                        <div>
                            <label for="text">Authority ID</label>
                            <span class="red_right_add2e" id="contentGrID_error_message"></span>
                            <!-- cột hiện lỗi validate
                        </div>
                        <div>
                            <input type="text" name="contentGrID" id="contentGrID" placeholder="Enter Authority ID">
                        </div>
                        -->
                        <div>
                            <label for="text" class="lbl_contentgr">ContentGroup Name</label>
                            <select name="contentGrName" id="contentGrName" class="custom-select d-block my-3 select_contentgr" required>
                                        
                            </select>
                        </div>

                        <div>
                            <label for="textarea">Content</label>
                            <span class="red_right" id="content_error_message" style="margin-right:50px;"></span>
                        </div>
                        <div>
                            <textarea name="content" id="content" cols="40" rows="6" placeholder="Enter content"></textarea>
                        </div>
                        
                </fieldset>
                <div>
                    <div id="btn">
                    	<div id="add1" style="float:left;">
                        <input class="animated" type="submit" value="ADD">
                        </div>
                           <input id="closebtn_form2" data-dismiss="modal-3options" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form2").onclick = function abc3() {
                                      $("#modal-3options").hide();
                                  };
                   document.getElementById("add1").onclick = function abc3() {
                                      $("#modal-3options").hide();
                                  };
                   </script>
                    </div>
            </form>
        </div>
    </div>
    <!-- end form add Authority  -->
    <style>
 #modal-5options #login_form_option{
    background-color: #fff;
    padding: 26px 0px 28px 34px;
    display: inline-block;
    color: #343536;
    line-height: 27px;
    width: 100%;
    border: 1px solid #9b9999;
        /*bo tròn 2 góc dưới*/
    -webkit-border-radius: 0 0 5px 5px;
	-moz-border-radius: 0 0 5px 5px;
	border-radius: 0 0 5px 5px;
        
   
}
#modal-5options #login_form_option input[type="submit"] {
	color: #fff;
    padding: 5px 5px;
	width: 95px;
    font-weight: bold;
    font-size: 16px;
    background: #2a94cc;

    -webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}
/*2 button add và cancel*/
#modal-5options #login_form_option #btn {
    float: right;
    padding-top: 24px;
} 
#modal-5options #login_form_option #btn .animated:hover{
    color: #fff;
    background: #2582b4;
}
#modal-5options #login_form_option #btn .md-close {
    margin-left: 24px;
    margin-right: 35px;
    color: #fff;
    background: #87969f;
}
#modal-5options #login_form_option #btn .md-close:hover {
    color: #fff;
    background: #798389;
}
 
    </style>
    
    <!-- Form repair Authority, sử dụng chung với content group -->
    <div class="md-modal118" id="modal-4options">
        <div class="md-content">
            <h4 class="h4-repair-contentGr">
                <span>
                        Edit Question
                        <button type="button" class="close" data-dismiss="modal-4options" aria-label="Close" id="closebtn1">
                              <span aria-hidden="true">&times;</span>
                        </button>                
                </span>
            </h4>

            <form id="login_form_question2" class="was-validated" action="" method="post">
                <fieldset>
                        <div>
                            <label for="text">Question ID</label>
                        </div>
                        <div>
                            <input type="text" name="contentGrID" id="contentGrID2" placeholder="Enter ContentGroup ID" 
                              disabled>
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">ContentGroup Name</label>
                            <select name="contentGrName" id="contentGrName2" class="custom-select d-block my-3 select_contentgr" required>
                                        
                                </select>
                        </div>

                        <div>
                            <label for="textarea">Content</label>
                            <span class="red_right" id="content_error_message2" style="margin-right:50px;"></span>
                        </div>
                        <div>
                            <textarea name="content" id="content2" cols="40" rows="6" placeholder="Enter content"></textarea>
                        </div>
                </fieldset>
                <div>
                    <div id="btn">
                        <div id="edit1" style="float:left;">
                        	<input class="animated" type="submit" value="EDIT">
                        </div>
                        <input id="closebtn_form" data-dismiss="modal-4options" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form").onclick = function abc3() {
                                      $("#modal-4options").hide();
                                  };
                   document.getElementById("edit1").onclick = function abc3() {
                                      $("#modal-4options").hide();
                                  };
                    </script>
                </div>
            </form>
        </div>
    </div>
    <!-- end form repair Authority  -->
   
   
   
   <!-- Form add Option, sử dụng chung với content group -->
    <div class="md-modal5 md-effect-7" id="modal-5options">
        <div class="md-content">
            <h4>
                <span>
                        Add Option for Question
                        <button type="button" class="close" data-dismiss="modal-5options" aria-label="Close" id="closebtn2">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_option" class="was-validated" action="" method="">
                <fieldset>  
                        <div>
                            <label for="text" class="lbl_contentgr">Question ID</label>
                            <select id="queslist" class="custom-select d-block my-3 select_contentgr" required>
                                     
                            </select>
                        </div>

                        <div>
                            <label for="text" class="lbl_contentgr">Option ID</label>
                            <select id="opslist" class="custom-select d-block my-3 select_contentgr" required>
                                     
                            </select>
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Is Answer?</label>
                            <select id="isAnswer" class="custom-select d-block my-3 select_contentgr" required>
                                        <option value="true">True</option>
                                        <option value="false">False</option>
                            </select>
                        </div>
                </fieldset>
                <div>
                    <div id="btn">
                    	<div id="add2" style="float:left;">
                        <input class="animated" type="submit" value="ADD">
                        </div>
                           <input id="closebtn_form3" data-dismiss="modal-5options" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form3").onclick = function abc3() {
                                      $("#modal-5options").hide();
                                  };
                   document.getElementById("add2").onclick = function abc3() {
                                      $("#modal-5options").hide();
                                  };
                    </script>
                </div>
              </form>           
        </div>
    </div>
    <!-- end form add Authority  -->
   
   
   
   <style>
   /*edit option o trang ques*/
#modal-6options {
	margin: 60px auto 20px auto;
	width: 70%; /*hiển thị 70% là cân bằng khi thu nhỏ*/

}
/*cua option o trang ques*/
#modal-6options h4 {
    background: #fff;
	-webkit-border-radius: 5px 5px 0 0;
	-moz-border-radius: 5px 5px 0 0;
	border-radius: 5px 5px 0 0;
	
	font-size: 19px;
	padding: 15px 20px;
    color: black;
    width: 100%;
    margin-bottom: 0px;
    font-weight: bold;
    border-top: 1px solid #9b9999;
    border-left: 1px solid #9b9999;
    border-right: 1px solid #9b9999;
    
}
/*form*/
#modal-6options #login_form_5options{
    background-color: #fff;
    padding: 26px 0px 28px 34px;
    display: inline-block;
    color: #343536;
    line-height: 27px;
    width: 100%;
    border: 1px solid #9b9999;
        /*bo tròn 2 góc dưới*/
    -webkit-border-radius: 0 0 5px 5px;
	-moz-border-radius: 0 0 5px 5px;
	border-radius: 0 0 5px 5px;
        
   
}
#modal-6options fieldset input[type="text"], #modal-6options fieldset input[type="password"] {
	width: 90%;
    color: #5a6265;
	padding: 4px 5px;
    border: 1px solid #9b9999;
    -webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
    margin-bottom: 5px;
}

#modal-6options #login_form_5options input[type="submit"] {
	color: #fff;
    padding: 5px 5px;
	width: 95px;
    font-weight: bold;
    font-size: 16px;
    background: #2a94cc;

    -webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}
/*2 button add và cancel*/
#modal-6options #login_form_5options #btn {
    float: right;
    padding-top: 24px;
} 
#modal-6options #login_form_5options #btn .animated:hover{
    color: #fff;
    background: #2582b4;
}
#modal-6options #login_form_5options #btn .md-close {
    margin-left: 24px;
    margin-right: 35px;
    color: #fff;
    background: #87969f;
}
#modal-6options #login_form_5options #btn .md-close:hover {
    color: #fff;
    background: #798389;
}
   </style>
   
   <!-- Form repair ques op, sử dụng chung với content group -->
    <div class="md-modal118" id="modal-6options">
        <div class="md-content">
            <h4 class="h4-repair-contentGr">
                <span>
                        Edit Option for Question
                        <button type="button" class="close" data-dismiss="modal-6options" aria-label="Close" id="closebtn3">
                              <span aria-hidden="true">&times;</span>
                        </button>                
                </span>
            </h4>

            <form id="login_form_5options" class="was-validated" action="" method="post">
                <fieldset>
                		<div>
                            <label for="text">Ques&Options ID</label>
                        </div>
                        <div>
                            <input type="text" name="question_op_ID" id="question_op_ID" placeholder="Enter ContentGroup ID" 
                              disabled>
                        </div>
                        
                        <div>
                            <label for="text">Question ID</label>
                        </div>
                        <div>
                            <input type="text" name="questionID" id="questionID_op" placeholder="Enter ContentGroup ID" 
                              disabled>
                        </div>
                        
                        <div>
                            <label for="text">Option ID</label>
                            <span class="red_right_add2e" id="contentGrID_error_message"></span>
                        </div>
                        <div>
                            <input type="text" name="optionID" id="contentGrID" placeholder="Enter ContentGroup ID">
                        </div>

                        <div>
                            <label for="text" class="lbl_contentgr">Is Answer?</label>
                            <select id="isAnswer2" class="custom-select d-block my-3 select_contentgr" required>
                                        <option value="true">True</option>
                                        <option value="false">False</option>
                            </select>
                        </div>
                </fieldset>
                <div>
                    <div id="btn">
                        <div id="edit2" style="float:left;">
                        	<input class="animated" type="submit" value="EDIT">
                        </div>
                        <input id="closebtn_form5" data-dismiss="modal-6options" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form5").onclick = function abc3() {
                                      $("#modal-6options").hide();
                                  };
                   document.getElementById("edit2").onclick = function abc3() {
                                      $("#modal-6options").hide();
                                  };
                    </script>
                </div>
            </form>
        </div>
    </div>
    <!-- end form repair Authority  -->
   
   
   <script>
 //add, edit, quess
 function check_content() {
		var content_length = $("#content").val().length;

		if(content_length > 500) {
			$("#content_error_message").html("Must be between 0-500 characters");
			$("#content_error_message").show();      
			error_content = true;
		}
		else
		{
			$("#content_error_message").hide();
		}

	}
	
	function check_content2() {
		var content2_length = $("#content2").val().length;

		if(content2_length > 500) {
			$("#content_error_message2").html("Must be between 0-500 characters");
			$("#content_error_message2").show();      
			error_content2 = true;
		}
		else
		{
			$("#content_error_message2").hide();
		}

	}
   $("#login_form_question").submit(function() {

		error_content = false;
		
		check_content();
		
		if(error_content == false) {
			return true;
		} else {
			return false;	
		}
	});
   
   $("#login_form_question2").submit(function() {

		error_content2 = false;
		
		check_content2();
		
		if(error_content2 == false) {
			return true;
		} else {
			return false;	
		}

	});
   </script>
   
    <!-- Authority Manegement -->
    
     <div class="container tieude" id="content-gr">
         		<h2 class="text-center" style="color: red;font-weight: bold;margin-bottom: 20px !important;">QUESTION MANEGEMENT</h2>
        <p class="text-right">
        <a class="md-trigger btn" data-modal="modal-3options" id="btn_left"><button type="button" class="btn add-employee">
        	<i class="fa fa-plus" aria-hidden="true"></i>Add Question</button></a>
        </p>
	
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped pre-scrollable2 paginated" id="productTable">
						<thead>
							<tr class="text-center">
								<th class="text-center">Question ID</th>
                                <th class="text-center">ContentGroup Name</th>
                                <th class="text-center">Content</th>
							</tr>
						</thead>
						<tbody id="row" class="text-center">
						<!--  
						<c:forEach var="list" items="${authority }" >
							<tr class="text-center">
                                <td>${list.authorityID }</td>
                                <td>${list.authorityName }</td>
								<td class="text-center">
								     <a href="Display_EditAuthority?temp=${list.authorityID }">
								     	<i class="fa fa-pencil edit"></i></a>
								     <a href="DeleteAuthority?temp=${list.authorityID }">
								    	<i class="fa fa-trash remove"></i></a>
								</td>
							</tr>
						</c:forEach>
						-->
						</tbody>
					</table>
				</div>
		<script src="Style/js/classie.js"></script>
   	<script src="Style/js/modalEffects.js"></script>
    </div>
     
     
     
     <hr style="margin-top: 100px;">
     
     
     <div class="container tieude" id="content-gr">
         <h2 class="text-center" style="color: red;font-weight: bold;margin-bottom: 20px !important;">QUESTION'S OPTIONS MANEGEMENT</h2>
        <p class="text-right">
				<a class="md-trigger btn" data-modal="modal-5options" id="btn_left2">
                        <button type="button" class="btn add-employee">
                	<i class="fa fa-plus" aria-hidden="true"></i>Add Option for Question</button></a>
        </p>
	
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped pre-scrollable2 paginated2" id="productTable2">
						<thead>
							<tr class="text-center">
								<th class="text-center">Question ID</th>
                                <th class="text-center">Option ID</th>
                                <th class="text-center">Is Answer</th>
							</tr>
						</thead>
						<tbody id="row2" class="text-center">
						
						</tbody>
					</table>
					<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
					<script src="Style/js/pag.js"></script>
				</div>
		<script src="Style/js/classie.js"></script>
   	<script src="Style/js/modalEffects.js"></script>
    </div>
   
    
      <!-- javascript xử lý cái nút close -->
        <script type="text/javascript">
            //nút close của add
                document.getElementById("btn_left").onclick = function abc2() {
                        $("#modal-3options").show();
                        $("#classID").val("");
                        $("#content").val("");
                    };
                document.getElementById("closebtn").onclick = function abc() {
                        $("#modal-3options").hide();
                    };
            //nút close của EDIT
              document.getElementById("closebtn1").onclick = function abc3() {
                        $("#modal-4options").hide();
                    };
                document.getElementById("btn_left1").onclick = function abc4() {
                        $("#modal-4options").show();
                    };
                    
                    //add option for ques
                    document.getElementById("closebtn2").onclick = function abc5() {
                        $("#modal-5options").hide();
                    };
                    
                    
                    
                  //edit option for ques
                    document.getElementById("closebtn3").onclick = function abc5() {
                        $("#modal-6options").hide();
                    };
        </script>
	
	<script>
	 //edit option for ques
    document.getElementById("closebtn3").onclick = function abc5() {
        $("#modal-6options").hide();      
    };
	</script>
	
	<script>
	document.getElementById("closebtn2").onclick = function abc5() {
	       $("#modal-5options").hide();
	   };
	   document.getElementById("btn_left2").onclick = function abc6() {
	       $("#modal-5options").show();
	   };
	</script>
	
	
    <!-- Footer -->
    <footer id=contact>
        <div class="splitter"></div>
        <ul>
            <li>
                <div class="text">
                    <h4>MONGGOGO TOEIC</h4>
                    <div>
                        <p class="lead"><i class="fa fa-map" aria-hidden="true" style="padding-right: 12px"></i>Address: 1040 Vo Van Ngan, Thu Duc District, HCMC</p>
                        <p class="lead"><i class="fa fa-address-book" aria-hidden="true" style="padding-right: 12px"></i>Phone: (088) 6677022</p>
                        <p class="lead"><i class="fa fa-envelope-open" aria-hidden="true" style="padding-right: 12px"></i>Email: monggogotoeic@edu.vn</p>
                        <a href="#">Read more...</a></div>
                </div>
            </li>

            <li>
                <div class="text">
                    <h4>SOCIAL</h4>
                    <p class="lead social-icons">Connect us:
                        <a href=""> <i class="fa fa-facebook-square"></i></a>
                        <a href="" class="tw"> <i class="fa fa-twitter-square"></i></a>
                        <a href="" class="rs"> <i class="fa fa-rss-square"></i></a>
                        <a href="" class="yt"> <i class="fa fa-youtube-square"></i></a>
                        <a href="" class="li"> <i class="fa fa-linkedin-square"></i></a>
                        <a href="" class="gp"> <i class="fa fa-google-plus-square"></i></a>
                    </p>


                    <p class="lead">Please rate your overall experience:</p>
                    <fieldset class="rating">
                        <input type="radio" id="star5" name="rating" value="5" /><label class="full" for="star5" title="Awesome - 5 stars"></label>
                        <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                        <input type="radio" id="star4" name="rating" value="4" /><label class="full" for="star4" title="Pretty good - 4 stars"></label>
                        <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                        <input type="radio" id="star3" name="rating" value="3" /><label class="full" for="star3" title="Meh - 3 stars"></label>
                        <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                        <input type="radio" id="star2" name="rating" value="2" /><label class="full" for="star2" title="Kinda bad - 2 stars"></label>
                        <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                        <input type="radio" id="star1" name="rating" value="1" /><label class="full" for="star1" title="Sucks big time - 1 star"></label>
                        <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                    </fieldset>

                </div>
            </li>
        </ul>

        <div class="bar">
            <div class="clear"></div>
            <div class="copyright lead">&copy; 2017 Monggogo Toeic All Rights Reserved</div>
        </div>
    </footer>


	<script>
    (function($){
        
        var paginate = {
            startPos: function(pageNumber, perPage) {
                // determine what array position to start from
                // based on current page and # per page
                return pageNumber * perPage;
            },

            getPage: function(items, startPos, perPage) {
                // declare an empty array to hold our page items
                var page = [];

                // only get items after the starting position
                items = items.slice(startPos, items.length);

                // loop remaining items until max per page
                for (var i=0; i < perPage; i++) {
                    page.push(items[i]); }

                return page;
            },

            totalPages: function(items, perPage) {
                // determine total number of pages
                return Math.ceil(items.length / perPage);
            },

            createBtns: function(totalPages, currentPage) {
                // create buttons to manipulate current page
                var pagination = $('<div class="pagination" />');

                // add a "first" button
                pagination.append('<span class="pagination-button">&laquo;</span>');

                // add pages inbetween
                for (var i=1; i <= totalPages; i++) {
                    // truncate list when too large
                    if (totalPages > 5 && currentPage !== i) {
                        // if on first two pages
                        if (currentPage === 1 || currentPage === 2) {
                            // show first 5 pages
                            if (i > 5) continue;
                        // if on last two pages
                        } else if (currentPage === totalPages || currentPage === totalPages - 1) {
                            // show last 5 pages
                            if (i < totalPages - 4) continue;
                        // otherwise show 5 pages w/ current in middle
                        } else {
                            if (i < currentPage - 2 || i > currentPage + 2) {
                                continue; }
                        }
                    }

                    // markup for page button
                    var pageBtn = $('<span class="pagination-button page-num" />');

                    // add active class for current page
                    if (i == currentPage) {
                        pageBtn.addClass('active'); }

                    // set text to the page number
                    pageBtn.text(i);

                    // add button to the container
                    pagination.append(pageBtn);
                }

                // add a "last" button
                pagination.append($('<span class="pagination-button">&raquo;</span>'));

                return pagination;
            },

            createPage: function(items, currentPage, perPage) {
                // remove pagination from the page
                $('.pagination').remove();

                // set context for the items
                var container = items.parent(),
                    // detach items from the page and cast as array
                    items = items.detach().toArray(),
                    // get start position and select items for page
                    startPos = this.startPos(currentPage - 1, perPage),
                    page = this.getPage(items, startPos, perPage);

                // loop items and readd to page
                $.each(page, function(){
                    // prevent empty items that return as Window
                    if (this.window === undefined) {
                        container.append($(this)); }
                });

                // prep pagination buttons and add to page
                var totalPages = this.totalPages(items, perPage),
                    pageButtons = this.createBtns(totalPages, currentPage);

                container.after(pageButtons);
            }
        };

        
        // stuff it all into a jQuery method!
        $.fn.paginate = function(perPage) {
            var items = $(this);

            // default perPage to 5
            if (isNaN(perPage) || perPage === undefined) {
                perPage = 5; }

            // don't fire if fewer items than perPage
            if (items.length <= perPage) {
                return true; }

            // ensure items stay in the same DOM position
            if (items.length !== items.parent()[0].children.length) {
                items.wrapAll('<div class="pagination-items" />');
            }

            // paginate the items starting at page 1
            paginate.createPage(items, 1, perPage);

            // handle click events on the buttons
            $(document).on('click', '.pagination-button', function(e) {
                // get current page from active button
                var currentPage = parseInt($('.pagination-button.active').text(), 10),
                    newPage = currentPage,
                    totalPages = paginate.totalPages(items, perPage),
                    target = $(e.target);

                // get numbered page
                newPage = parseInt(target.text(), 10);
                if (target.text() == '«') newPage = 1;
                if (target.text() == '»') newPage = totalPages;

                // ensure newPage is in available range
                if (newPage > 0 && newPage <= totalPages) {
                    paginate.createPage(items, newPage, perPage); }
            });
        };
})(jQuery);

    /* This part is just for the demo,
    not actually part of the plugin */
    $('.article-loop').paginate(6);
    </script>

    
<script>
//     (function($){
//     	var paginate2 = {
//                 startPos: function(pageNumber, perPage) {
//                     // determine what array position to start from
//                     // based on current page and # per page
//                     return pageNumber * perPage;
//                 },

//                 getPage: function(items, startPos, perPage) {
//                     // declare an empty array to hold our page items
//                     var page2 = [];

//                     // only get items after the starting position
//                     items = items.slice(startPos, items.length);

//                     // loop remaining items until max per page
//                     for (var i=0; i < perPage; i++) {
//                         page.push(items[i]); }

//                     return page2;
//                 },

//                 totalPages: function(items, perPage) {
//                     // determine total number of pages
//                     return Math.ceil(items.length / perPage);
//                 },

//                 createBtns: function(totalPages, currentPage) {
//                     // create buttons to manipulate current page
//                     var pagination2 = $('<div class="pagination2" />');

//                     // add a "first" button
//                     pagination2.append('<span class="pagination-button2">&laquo;</span>');

//                     // add pages inbetween
//                     for (var i=1; i <= totalPages; i++) {
//                         // truncate list when too large
//                         if (totalPages > 5 && currentPage !== i) {
//                             // if on first two pages
//                             if (currentPage === 1 || currentPage === 2) {
//                                 // show first 5 pages
//                                 if (i > 5) continue;
//                             // if on last two pages
//                             } else if (currentPage === totalPages || currentPage === totalPages - 1) {
//                                 // show last 5 pages
//                                 if (i < totalPages - 4) continue;
//                             // otherwise show 5 pages w/ current in middle
//                             } else {
//                                 if (i < currentPage - 2 || i > currentPage + 2) {
//                                     continue; }
//                             }
//                         }

//                         // markup for page button
//                         var pageBtn = $('<span class="pagination-button2 page-num2" />');

//                         // add active class for current page
//                         if (i == currentPage) {
//                             pageBtn.addClass('active'); }

//                         // set text to the page number
//                         pageBtn.text(i);

//                         // add button to the container
//                         pagination2.append(pageBtn);
//                     }

//                     // add a "last" button
//                     pagination2.append($('<span class="pagination-button2">&raquo;</span>'));

//                     return pagination2;
//                 },

//                 createPage: function(items, currentPage, perPage) {
//                     // remove pagination from the page
//                     $('.pagination2').remove();

//                     // set context for the items
//                     var container2 = items.parent(),
//                         // detach items from the page and cast as array
//                         items = items.detach().toArray(),
//                         // get start position and select items for page
//                         startPos = this.startPos(currentPage - 1, perPage),
//                         page2 = this.getPage(items, startPos, perPage);

//                     // loop items and readd to page
//                     $.each(page2, function(){
//                         // prevent empty items that return as Window
//                         if (this.window === undefined) {
//                             container2.append($(this)); }
//                     });

//                     // prep pagination buttons and add to page
//                     var totalPages = this.totalPages(items, perPage),
//                         pageButtons = this.createBtns(totalPages, currentPage);

//                     container.after(pageButtons);
//                 }
//             };
    	
//     	 $.fn.paginate2 = function(perPage) {
//     	        var items = $(this);

//     	        // default perPage to 5
//     	        if (isNaN(perPage) || perPage === undefined) {
//     	            perPage = 5; }

//     	        // don't fire if fewer items than perPage
//     	        if (items.length <= perPage) {
//     	            return true; }

//     	        // ensure items stay in the same DOM position
//     	        if (items.length !== items.parent()[0].children.length) {
//     	            items.wrapAll('<div class="pagination-items2" />');
//     	        }

//     	        // paginate the items starting at page 1
//     	        paginate2.createPage(items, 1, perPage);

//     	        // handle click events on the buttons
//     	        $(document).on('click', '.pagination-button2', function(e) {
//     	            // get current page from active button
//     	            var currentPage = parseInt($('.pagination-button2.active').text(), 10),
//     	                newPage = currentPage,
//     	                totalPages = paginate.totalPages(items, perPage),
//     	                target = $(e.target);

//     	            // get numbered page
//     	            newPage = parseInt(target.text(), 10);
//     	            if (target.text() == '«') newPage = 1;
//     	            if (target.text() == '»') newPage = totalPages;

//     	            // ensure newPage is in available range
//     	            if (newPage > 0 && newPage <= totalPages) {
//     	                paginate2.createPage(items, newPage, perPage); }
//     	        });
//     	    };

//     })(jQuery);

//     /* This part is just for the demo,
//     not actually part of the plugin */
//     $('.article-loop2').paginate2(1);
    </script>
    
    
    
    
    <style>
    div.pager {
    text-align: center;
}

div.pager span {
    display: inline-block;
    width: 32px;
    height: 38px;
    text-align: center;
    cursor: pointer;
    background: #f2f2f2;
    color: #000;
    margin-top: 15px;
	font-size: 16px;
	margin-right: 0px;
	font-weight: normal;
	border: 1px solid #d9d9d9;
	float:left;
	padding-top:5px;
}

div.pager span.active {
    background: #d9d9d9;
    color: #4d88ff;
}
div.pager span:hover {
    background: #d9d9d9;
    color: #4d88ff;
}
    </style>
    
    
    
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<!--     <script src="./Carousel Template for Bootstrap_files/jquery-3.2.1.slim.min.js.download" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
     <script>
         window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')

     </script>
<!--     <script src="./Carousel Template for Bootstrap_files/popper.min.js.download"></script> -->
<!--     <script src="./Carousel Template for Bootstrap_files/bootstrap.min.js.download"></script> -->
<!--     Just to make our placeholder images work. Don't actually copy the next line! -->
<!--     <script src="./Carousel Template for Bootstrap_files/holder.min.js.download"></script> -->
<!--     IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="./Carousel Template for Bootstrap_files/ie10-viewport-bug-workaround.js.download"></script> -->
</body>
</html>