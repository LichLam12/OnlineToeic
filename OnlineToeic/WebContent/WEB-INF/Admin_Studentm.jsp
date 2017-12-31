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
        	$("#modal-studentuser2").hide();
        	
        	
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
                   
					$pager.insertAfter($table).find('span.page-number:first').addClass('active').css({'margin-left':'50px'});
					}
				});
        	}
        	
        	
        	 $.get("act_Student", function(responseJson) {
 		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
 		        if (responseJson.check == "fail") {
		                    //$('#message').text("List isEmpty! Name not found!");
		                    //$('#message').css('color', 'red');
		                  	alert("Loaddata failed!");
		                    return;
		        }
 		        var $table = document.getElementById("row");
 		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        	var birth = new Date(product.doB); 
 		        	//birth = product.doB;
 		        	//alert((birth.getMonth() + 1) + "/" + birth.getDate() + "/" + birth.getFullYear());
 		        	
 		            $("<tr>").appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
 		                .append($("<td>").text(product.studentID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.username))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.password))
 		               	.append($("<td>").text(product.fullName))
 		               	.append($("<td>").text(product.sex))
 		               	.append($("<td>").text(birth.getDate() + "/" + (birth.getMonth() + 1) + "/" + birth.getFullYear()))
 		               	.append($("<td>").text(product.phoneNumber))
 		               	.append($("<td>").text(product.email))
 		               	.append($("<td>").text(product.address))
 		               	.append($("<td>").text(product.authorityID))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_Student",{action: '3',studentID : product.studentID}, 
 		                		           		function(responseJson) { 
	 		                		           		if (responseJson.check == "fail") {
		 		               		                  	alert("Loaddata failed!");
		 		               		                    return;
	 		               		       				 }
	 		                	 		        	var birth2 = new Date(responseJson.doB); 

 		                		     		        	$("#studentID2").val(responseJson.studentID);
 		                		     		        	$("#username2").val(responseJson.username);
 		                		     		        	$("#password2").val(responseJson.password);
 		                		     		        	$("#fullname2").val(responseJson.fullName);
 		                		     		        	
 		                		     		        	//birth2.setDate(birth2.getDate());
 		                		     		       		//birth2.setMonth(birth2.getMonth()+1);
		                		     		        	//birth2.setFullYear(birth2.getFullYear());
		                		     		        	//alert(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
 		                		     		        	if(birth2.getDate()<10 && (birth2.getMonth()+1)<10){
 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
 		                		     		        	}
 		                		     		        	else if(birth2.getDate()<10 && (birth2.getMonth()+1)>=10){ 	
 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
 		                		     		        	}
 		                		     		        	else if((birth2.getMonth()+1)<10 && birth2.getDate()>=10){
 		                		     		        		$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
 		                		     		        	}
 		                		     		        	else{
 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
 		                		     		        	}
 		                		     		        	
 		                		     		        	$("#phonenumber2").val(responseJson.phoneNumber);
 		                		     		        	$("#email2").val(responseJson.email);
 		                		     		        	$("#address2").val(responseJson.address);
														
 		                		     		        	if(product.sex==0){
 	 		                		     		        	document.getElementById('sex21').checked=true;
 		                		     		        	}
 		                		     		        	else{
 	 		                		     		        	document.getElementById('sex22').checked=true;
 		                		     		        	}
 		                		     	 		           	 event.preventDefault();

 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-studentuser2").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Student",{action: '4',studentID : product.studentID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
	   		                							reload();
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
 		        });
 		        autopage();
 		    });
 			
        	 
        	 
        	 function reload(){
        		 $.get("act_Student", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
      		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
      		        if (responseJson.check == "fail") {
      		        	alert("Loaddata failed!");
		                return;       		                  	
	 		        }
      		        var $table = document.getElementById("row");
      		      	$.each(responseJson, function(index, product) { 
             			$("#productTable > tbody > tr").remove();
             		 });
      		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
      		        	var birth = new Date(product.doB);
      		        	$("<tr>").appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
      		          	.append($("<td>").text(product.studentID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
		                .append($("<td>").text(product.username))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
		               	.append($("<td>").text(product.password))
		               	.append($("<td>").text(product.fullName))
		               	.append($("<td>").text(product.sex))
 		               	.append($("<td>").text(birth.getDate() + "/" + (birth.getMonth() + 1) + "/" + birth.getFullYear()))
		               	.append($("<td>").text(product.phoneNumber))
		               	.append($("<td>").text(product.email))
		               	.append($("<td>").text(product.address))
		               	.append($("<td>").text(product.authorityID))
      		                .append($("<td>")
      		                		.append($("<a>")
      		                				.append($("<i>").addClass("fa fa-pencil edit"))
      		                			   )
      		                				.click(function(){
      		                		           	 $.post("act_Student",{action: '3',studentID : product.studentID},
      		                		           		function(responseJson) {   
			      		                		           	if (responseJson.check == "fail") {
			      		                    		        	alert("Loaddata failed!");
			      		              		                	return;       		                  	
			      		              	 		      		}
			      		                		          	$("#studentID2").val(responseJson.studentID);
	 		                		     		        	$("#username2").val(responseJson.username);
	 		                		     		        	$("#password2").val(responseJson.password);
	 		                		     		        	$("#fullname2").val(responseJson.fullName);
	 		                		     		        	var birth2 = new Date(responseJson.doB); 

	 		                		     		        	$("#studentID2").val(responseJson.studentID);
	 		                		     		        	$("#username2").val(responseJson.username);
	 		                		     		        	$("#password2").val(responseJson.password);
	 		                		     		        	$("#fullname2").val(responseJson.fullName);
	 		                		     		        	
	 		                		     		        	//birth2.setDate(birth2.getDate());
	 		                		     		       		//birth2.setMonth(birth2.getMonth()+1);
			                		     		        	//birth2.setFullYear(birth2.getFullYear());
			                		     		        	//alert(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
	 		                		     		        	if(birth2.getDate()<10 && (birth2.getMonth()+1)<10){
	 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
	 		                		     		        	}
	 		                		     		        	else if(birth2.getDate()<10 && (birth2.getMonth()+1)>=10){ 	
	 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
	 		                		     		        	}
	 		                		     		        	else if((birth2.getMonth()+1)<10 && birth2.getDate()>=10){
	 		                		     		        		$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
	 		                		     		        	}
	 		                		     		        	else{
	 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
	 		                		     		        	}
	 		                		     		        	$("#phonenumber2").val(responseJson.phoneNumber);
	 		                		     		        	$("#email2").val(responseJson.email);
	 		                		     		        	$("#address2").val(responseJson.address);
															
	 		                		     		        	if(product.sex==0){
	 	 		                		     		        	document.getElementById('sex21').checked=true;
	 		                		     		        	}
	 		                		     		        	else{
	 	 		                		     		        	document.getElementById('sex22').checked=true;
	 		                		     		        	}
      		                		     		    }
      		                		           	 );
      		                		           	 event.preventDefault();
       		                					$("#modal-studentuser2").show();

      		                				})
      		                )
      		                .append($("<td>")
      		                		.append($("<a>")
      		                				.append($("<i>").addClass("fa fa-trash remove"))
      		                				)
      		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Student",{action: '4',studentID : product.studentID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
	   		                							reload();
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
      		    });
        	 }
        	 
	        
        	$('#add1').click(function(){
        		var sex=0;
        		if(document.getElementById('sex11').checked == true){
   		        		sex=0;
		        }else{
   		        		sex=1;
		        }
           	 $.post("act_Student",{action: '1',username2 : $('#username').val(),password : $('#password').val(),
           		fullName : $('#fullname').val(),sex : sex,
           		doB : $('#doB').val(),phoneNumber : $('#phonenumber').val(),
           		email : $('#email').val(),address : $('#address').val()},
           		function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
	           		if (responseJson.check == "fail") {
	                    var retVal = confirm("Please enter your full details with your request!\nDo you want to continute?");          	
	                    if( retVal == true ){
	                    	$("#modal-studentuser").show();
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
           			var birth = new Date(product.doB);	
           			 $("#productTable > tbody").append(
     		        	$("<tr>")                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        	.append($("<td>").text(product.studentID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.username))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.password))
 		               	.append($("<td>").text(product.fullName))
 		               	.append($("<td>").text(product.sex))
 		               	.append($("<td>").text(birth.getDate() + "/" + (birth.getMonth() + 1) + "/" + birth.getFullYear()))
 		               	.append($("<td>").text(product.phoneNumber))
 		               	.append($("<td>").text(product.email))
 		               	.append($("<td>").text(product.address))
 		               	.append($("<td>").text(product.authorityID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
   		                .append($("<td>")
   		                		.append($("<a>")
   		                				.append($("<i>").addClass("fa fa-pencil edit"))
   		                			   )
   		                				.click(function(){
   		                					$.post("act_Student",{action: '3',studentID : product.studentID}, 
   		                						function(responseJson) {   
	   		                						if (responseJson.check == "fail") {
	   		                	      		        	alert("Loaddata failed!");
	   		                			                return;       		                  	
	   		                		 		        }
	   		                						$("#studentID2").val(responseJson.studentID);
	                		     		        	$("#username2").val(responseJson.username);
	                		     		        	$("#password2").val(responseJson.password);
	                		     		        	$("#fullname2").val(responseJson.fullName);
	                		     		        	var birth2 = new Date(responseJson.doB); 

		                		     		        	$("#studentID2").val(responseJson.studentID);
		                		     		        	$("#username2").val(responseJson.username);
		                		     		        	$("#password2").val(responseJson.password);
		                		     		        	$("#fullname2").val(responseJson.fullName);
		                		     		        	
		                		     		        	//birth2.setDate(birth2.getDate());
		                		     		       		//birth2.setMonth(birth2.getMonth()+1);
	                		     		        	//birth2.setFullYear(birth2.getFullYear());
	                		     		        	//alert(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
		                		     		        	if(birth2.getDate()<10 && (birth2.getMonth()+1)<10){
	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
		                		     		        	}
		                		     		        	else if(birth2.getDate()<10 && (birth2.getMonth()+1)>=10){ 	
	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
		                		     		        	}
		                		     		        	else if((birth2.getMonth()+1)<10 && birth2.getDate()>=10){
		                		     		        		$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
		                		     		        	}
		                		     		        	else{
	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
		                		     		        	}
	                		     		        	$("#phonenumber2").val(responseJson.phoneNumber);
	                		     		        	$("#email2").val(responseJson.email);
	                		     		        	$("#address2").val(responseJson.address);
												
	                		     		        	if(product.sex==0){
	 		                		     		        	document.getElementById('sex21').checked=true;
		                		     		        	}
		                		     		        	else{
	 		                		     		        	document.getElementById('sex22').checked=true;
		                		     		        	}
	                		     		    	}
	                		           	 	);
	                		           	 	event.preventDefault();
	                						$("#modal-studentuser2").show();
   		                				})
   		                )
   		                .append($("<td>")
   		                		.append($("<a>")
   		                				.append($("<i>").addClass("fa fa-trash remove"))
   		                				)
   		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Student",{action: '4',studentID : product.studentID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
	   		                							reload();
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
     		    });
           	 event.preventDefault(); // Important! Prevents submitting the form
            });  
        	
        	
        	$('#edit1').click(function(){
        		var sex=0;
        		if(document.getElementById('sex21').checked == true){
   		        		sex=0;
		        }else{
   		        		sex=1;
		        }
           	 $.post("act_Student",{action: '2',studentID : $('#studentID2').val(),username2 : $('#username2').val(),password : $('#password2').val(),
            		fullName : $('#fullname2').val(),sex : sex,
               		doB : $('#doB2').val(),phoneNumber : $('#phonenumber2').val(),
               		email : $('#email2').val(),address : $('#address2').val()},
           	 function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
           		if (responseJson.check == "fail") {
                    var retVal = confirm("Please enter your full details with your request!\nDo you want to continute?");          	
                    if( retVal == true ){
                    	$("#modal-studentuser2").show();
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
           			var birth = new Date(product.doB);	
           			 $("#productTable > tbody").append(
     		        	$("<tr>")                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        	.append($("<td>").text(product.studentID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.username))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.password))
 		               	.append($("<td>").text(product.fullName))
 		               	.append($("<td>").text(product.sex))
 		               	.append($("<td>").text(birth.getDate() + "/" + (birth.getMonth() + 1) + "/" + birth.getFullYear()))
 		               	.append($("<td>").text(product.phoneNumber))
 		               	.append($("<td>").text(product.email))
 		               	.append($("<td>").text(product.address))
 		               	.append($("<td>").text(product.authorityID))     // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
   		                .append($("<td>")
   		                		.append($("<a>")
   		                				.append($("<i>").addClass("fa fa-pencil edit"))
   		                			   )
   		                				.click(function(){
   		                					$.post("act_Student",{action: '3',studentID : product.studentID}, 
   		                						function(responseJson) {   
	   		                						if (responseJson.check == "fail") {
	   		                	      		        	alert("Loaddata failed!");
	   		                			                return;       		                  	
	   		                		 		        }
	   		                							$("#studentID2").val(responseJson.studentID);
		                		     		        	$("#username2").val(responseJson.username);
		                		     		        	$("#password2").val(responseJson.password);
		                		     		        	$("#fullname2").val(responseJson.fullName);
		                		     		        	var birth2 = new Date(responseJson.doB); 

 		                		     		        	$("#studentID2").val(responseJson.studentID);
 		                		     		        	$("#username2").val(responseJson.username);
 		                		     		        	$("#password2").val(responseJson.password);
 		                		     		        	$("#fullname2").val(responseJson.fullName);
 		                		     		        	
 		                		     		        	//birth2.setDate(birth2.getDate());
 		                		     		       		//birth2.setMonth(birth2.getMonth()+1);
		                		     		        	//birth2.setFullYear(birth2.getFullYear());
		                		     		        	//alert(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
 		                		     		        	if(birth2.getDate()<10 && (birth2.getMonth()+1)<10){
 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
 		                		     		        	}
 		                		     		        	else if(birth2.getDate()<10 && (birth2.getMonth()+1)>=10){ 	
 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-0" +birth2.getDate());
 		                		     		        	}
 		                		     		        	else if((birth2.getMonth()+1)<10 && birth2.getDate()>=10){
 		                		     		        		$("#doB2").val(birth2.getFullYear()+ "-0" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
 		                		     		        	}
 		                		     		        	else{
 	 		                		     		        	$("#doB2").val(birth2.getFullYear()+ "-" +(birth2.getMonth()+1)+ "-" +birth2.getDate());
 		                		     		        	}
 		                		     		        	
		                		     		        	$("#phonenumber2").val(responseJson.phoneNumber);
		                		     		        	$("#email2").val(responseJson.email);
		                		     		        	$("#address2").val(responseJson.address);
													
		                		     		        	if(product.sex==0){
 	 		                		     		        	document.getElementById('sex21').checked=true;
 		                		     		        	}
 		                		     		        	else{
 	 		                		     		        	document.getElementById('sex22').checked=true;
 		                		     		        	}
	                		     		    	}
	                		           	 	);
	                		           	 	event.preventDefault();
	                						$("#modal-studentuser2").show();
   		                				})
   		                )
   		                .append($("<td>")
   		                		.append($("<a>")
   		                				.append($("<i>").addClass("fa fa-trash remove"))
   		                				)
   		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_Student",{action: '4',studentID : product.studentID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
	   		                							reload();
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
					<a class="nav-link" href="ForwardToPerinfo?username=${perinfo.username }">PERSIONAL INFO</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MANAGEMENT</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
						<a class="dropdown-item" href="ForwardToAuthority?username=${perinfo.username }">AUTHORITY</a>
						<a class="dropdown-item" href="ForwardToClass?username=${perinfo.username }">CLASS</a>
						<a class="dropdown-item" href="ForwardToStudent?username=${perinfo.username }">STUDENT</a>
						<a class="dropdown-item" href="ForwardToUser?username=${perinfo.username }">USER</a>
						<a class="dropdown-item" href="ForwardToStuClass?username=${perinfo.username }">STUDENT&CLASS</a>						
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

   
   <!-- Form add student -->
    <div class="md-modal md-effect-7" id="modal-studentuser">
        <div class="md-content">
            <h4>
                <span>
                        Add Student 
                        <button type="button" class="close" data-dismiss="modal-studentuser" aria-label="Close" id="closebtn">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_studentuser" class="was-validated pre-scrollable2" action="" method="">
                <fieldset>
                    <div id="left_hiddenform">
                        <div>
                            <label for="text">Username</label>
                            <span class="red_right" id="username_error_message"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="username" id="username" placeholder="Enter Username">
                        </div>

                        <div>
                            <label for="text">Password</label>
                            <span class="red_right" id="password_error_message"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="password" id="password" placeholder="Enter Password">
                        </div>
                        
                        <div>
                            <label for="text">Fullname</label>
                            <span class="red_right" id="fullname_error_message"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="fullName" id="fullname" placeholder="Enter Fullname">
                        </div>
                        
                        <div>
                            <label for="text">Email</label>
                            <span class="red_right" id="email_error_message"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="email" id="email" placeholder="Enter Email">
                        </div>
                    </div>
                    <!-- end left_hiddenform -->

                    <div id="right_hiddenform">
                        <div>
                            <label for="text">Address</label>
                            <span class="red_right" id="address_error_message"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="address" id="address" placeholder="Enter Address">
                        </div>
                        
                       <div>
                            <label for="text">Phone Number</label>
                            <span class="red_right" id="phonenumber_error_message"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div class="phonenumber2">
                            <input type="text" name="phoneNumber" id="phonenumber" placeholder="Enter Phone Number">
                        </div>
                        
                        <div class="custom-controls-stacked d-block my-3">
                            <label for="text" class="sex">Sex</label> 
                            <label class="custom-control custom-radio">
                                  <input id="sex11" name="sex" type="radio" class="custom-control-input"
                                   required value="0">
                                  <span class="custom-control-indicator"></span>
                                  <span class="custom-control-description">Male</span>
                            </label>
                            <label class="custom-control custom-radio">
                                  <input id="sex12" name="sex" type="radio" class="custom-control-input"
                                   required value="1">
                                  <span class="custom-control-indicator"></span>
                                  <span class="custom-control-description">Female</span>
                            </label>
                          </div>
                          
                           <div>
                                <label for="time" class="lbl_time">Date of birth</label> 
                                <input name="doB" type="date" id="doB" class="input_time" required />
                            </div>                    

                    </div>
                    <!-- end right_hiddenform -->

                </fieldset>
                <div>
                    <div id="btn">
                    	<div id="add1" style="float:left;">
                        <input class="animated" type="submit" value="ADD">
                        </div>
                           <input id="closebtn_form2" data-dismiss="modal-studentuser" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form2").onclick = function abc3() {
                                      $("#modal-studentuser").hide();
                                  };
                   document.getElementById("add1").onclick = function abc3() {
                                      $("#modal-studentuser").hide();
                                  };
                    </script>
                </div>
            </form>
        </div>
    </div>
    <!-- end form add Authority  -->
    
	                                        
    <!-- Form repair student -->
    <div class="md-modal114" id="modal-studentuser2">
        <div class="md-content">
            <h4>
                <span>
                        Edit Student
                        <button type="button" class="close" data-dismiss="modal-studentuser2" aria-label="Close" id="closebtn1">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_studentuser2" class="was-validated pre-scrollable2" action="" method="">
                <fieldset>
                    <div id="left_hiddenform">
                    	<div>
                            <label for="text">StudentID</label>
                        </div>
                        <div>
                            <input type="text" name="studentID" id="studentID2" placeholder="Enter Username" disabled>
                        </div>
                        
                        <div>
                            <label for="text">Username</label>
                        </div>
                        <div>
                            <input type="text" name="username" id="username2" placeholder="Enter Username" disabled>
                        </div>

                        <div>
                            <label for="text">Password</label>
                            <span class="red_right" id="password_error_message2"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="password" id="password2" placeholder="Enter Password">
                        </div>
                        
                        <div>
                            <label for="text">Fullname</label>
                            <span class="red_right" id="fullname_error_message2"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="fullName" id="fullname2" placeholder="Enter Fullname">
                        </div>
                        
                        <div>
                            <label for="text">Email</label>
                            <span class="red_right" id="email_error_message2"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="email" id="email2" placeholder="Enter Email">
                        </div>
                    </div>
                    <!-- end left_hiddenform -->

                    <div id="right_hiddenform">
                        <div>
                            <label for="text">Address</label>
                            <span class="red_right" id="address_error_message2"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div>
                            <input type="text" name="address" id="address2" placeholder="Enter Address">
                        </div>
                        
                       <div>
                            <label for="text">Phone Number</label>
                            <span class="red_right" id="phonenumber_error_message2"></span>
                            <!-- cột hiện lỗi validate -->
                        </div>
                        <div class="phonenumber2">
                            <input type="text" name="phoneNumber" id="phonenumber2" placeholder="Enter Phone Number">
                        </div>            
                        
                        <div class="custom-controls-stacked d-block my-3">
                            <label for="text" class="sex">Sex</label> 
                            <label class="custom-control custom-radio">
                                  <input id="sex21" name="sex" type="radio" class="custom-control-input"
                                   required checked>
                                  <span class="custom-control-indicator"></span>
                                  <span class="custom-control-description">Male</span>
                            </label>
                            <label class="custom-control custom-radio">
                                  <input id="sex22" name="sex" type="radio" class="custom-control-input"
                                   required>
                                  <span class="custom-control-indicator"></span>
                                  <span class="custom-control-description">Female</span>
                            </label>
                          </div>
                          
                           <div>
                                <label for="time" class="lbl_time">Date of birth</label> 
                                <input type="date" name="doB" id="doB2" value="1998-03-03" class="input_time" required />
                            </div>
                    </div>
                    <!-- end right_hiddenform -->

                </fieldset>
                <div>
                    <div id="btn">
                        <div id="edit1" style="float:left;">
                        	<input class="animated" type="submit" value="EDIT">
                        </div>
                        <input id="closebtn_form" data-dismiss="modal-studentuser2" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form").onclick = function abc3() {
                                      $("#modal-studentuser2").hide();
                                  };
                   document.getElementById("edit1").onclick = function abc3() {
                                      $("#modal-studentuser2").hide();
                                  };
                    </script>
                </div>
            </form>
        </div>
    </div>
    <!-- end form repair Authority  -->
  
  <style>
  	.md-modal114 {
	position: fixed;
	top: 0%;
	left: 0;
	right: 0;
	width: 50%;
	max-width: 785px;
	min-width: 320px;
	height: auto;
	z-index: 2000;
}
  </style>
   
    <!-- Authority Manegement -->
    
     <div class="container tieude" id="content-gr" style="margin-left:100px;margin-right:100px;">
         		<h2 class="text-center" style="color: red;font-weight: bold;margin-bottom: 20px !important;">STUDENT MANEGEMENT</h2>
        <p class="text-right">
        <a class="md-trigger btn" data-modal="modal-studentuser" id="btn_left"><button type="submit" class="btn add-employee">
        	<i class="fa fa-plus" aria-hidden="true"></i>Add Student</button></a>
        </p>
	
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped pre-scrollable2 paginated" id="productTable">
						<thead>
							<tr class="text-center">
								<th class="text-center">Student ID</th>
                                <th class="text-center">Username</th>
		                        <th class="text-center">Password</th>
		                        <th class="text-center">Fullname</th>
		                        <th class="text-center">Sex</th>
		                        <th class="text-center">Date of Birth</th>
		                        <th class="text-center">Phone Number</th>
		                        <th class="text-center">Address</th>
		                        <th class="text-center">Email</th>
		                        <th class="text-center">Authority ID</th>
							</tr>
						</thead>
						<tbody id="row" class="text-center">
						
						
						
						</tbody>
					</table>
				
				</div>
		<script src="Style/js/classie.js"></script>
   	<script src="Style/js/modalEffects.js"></script>
    </div>
    
    <style>
    #content-gr{
  		overflow-y: auto;
    }
    </style>
    <script>
    $(window).resize(function() { /*nếu như size của cửa sổ HTML thay đổi thì ẩn thanh underbanner đi*/
        if($(window).width()<1024){
        	$('#content-gr').css({'margin-left':'70px','margin-right':'20px'});
        }
        else{
        	$('#content-gr').css({'margin-left':'100px','margin-right':'100px'});

        }
}); 
    </script>
     
     
      <!-- javascript xử lý cái nút close -->
        <script type="text/javascript">
            //nút close của add
                document.getElementById("btn_left").onclick = function abc2() {
                        $("#modal-studentuser").show();
                        $("#username").val("");
                        $("#password").val("");
                        $("#fullname").val("");
                        $("#doB").val("");
                        $("#phonenumber").val("");
                        $("#email").val("");
                        $("#address").val("");
                        $("#authorityID").val("");
                    };
                document.getElementById("closebtn").onclick = function abc() {
                        $("#modal-studentuser").hide();
                    };
            //nút close của repair với 6 cột tương đương 6 nút edit
              document.getElementById("closebtn1").onclick = function abc3() {
                        $("#modal-studentuser2").hide();
                    };
                document.getElementById("btn_left1").onclick = function abc4() {
                        $("#modal-studentuser2").show();
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

<!--     <script src="./Carousel Template for Bootstrap_files/popper.min.js.download"></script> -->
<!--     <script src="./Carousel Template for Bootstrap_files/bootstrap.min.js.download"></script> -->
<!--     Just to make our placeholder images work. Don't actually copy the next line! -->
<!--     <script src="./Carousel Template for Bootstrap_files/holder.min.js.download"></script> -->
<!--     IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="./Carousel Template for Bootstrap_files/ie10-viewport-bug-workaround.js.download"></script> -->
</body>
</html>