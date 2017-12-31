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
                   
					$pager.insertAfter($table).find('span.page-number:first').addClass('active').css({'margin-left':'50px'});
					}
				});
        	}
        	
        	$.post("act_Examination",{action: '5'},function(responseJson) {
     			 if (responseJson.check == "fail") {
    		        	alert("Loaddata failed!");
		                return;       		                  	
	 		        }
     			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
    		        	$("#classID > option").remove();
    		        	$("#classID3 > option").remove();
      		 	});
     			 
     			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
   		        	$("#classID").append($("<option>").val(product.contentGrName)
	     		       				.text(product.contentGrName))
	     		    $("#classID3").append($("<option>").val(product.contentGrName)
	     		       				.text(product.contentGrName))
	     		       	
     		 	});
     		 });
        	
        	$('#classID').change(function(){
	        	$.post("act_Examination",{action: '6', contentGrName: $("#classID").val()},function(responseJson) {
	    			 if (responseJson.check == "fail") {
	    		        	alert("Loaddata failed. This ContentGroup don't have any question!");
			                return;       		                  	
		 		        }
	    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	   		        	$("#numQues > option").remove();
	     		 	});
	    			 
	    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	  		        	$("#numQues").append($("<option>").val(product.questionID)
		     		       				.text(product.questionID))       	
	    		 	});
	    		 });
        	});
        	
        	$('#classID3').change(function(){
	        	$.post("act_Examination",{action: '6', contentGrName: $("#classID3").val()},function(responseJson) {
	    			 if (responseJson.check == "fail") {
	    		        	alert("Loaddata failed. This ContentGroup don't have any question!");
			                return;       		                  	
		 		        }
	    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	   		        	$("#numQues3 > option").remove();
	     		 	});
	    			 
	    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	  		        	$("#numQues3").append($("<option>").val(product.questionID)
		     		       				.text(product.questionID))       	
	    		 	});
	    		 });
        	});
        	

        	
        	 $.get("act_Examination", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
 		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
 		        if (responseJson.check == "fail") {
		                    //$('#message').text("List isEmpty! Name not found!");
		                    //$('#message').css('color', 'red');
		                  	alert("Loaddata failed!");
		                    return;
		        }
 		        
  			 
 		        var $table = document.getElementById("row");
 		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        	var edate = new Date(product.examDate);
 		        	//alert(edate.getHours()+":"+edate.getMinutes()+":"+edate.getSeconds());

 		        	$("<tr>").appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
 		                .append($("<td>").text(product.examID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.examName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.examTime))
 		               	.append($("<td>").text(edate.getDate() + "/" + (edate.getMonth() + 1) + "/" + edate.getFullYear()))
 		               	.append($("<td>").text(product.contentGrName))
 		               	.append($("<td>").text(product.numQues))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_Examination",{action: '3',examID : product.examID,contentGrName : product.contentGrName}, 
 		                		           		function(responseJson) { 
	 		                		           		if (responseJson.check == "fail") {
		 		               		                  	alert("Loaddata failed!");
		 		               		                    return;
	 		               		       				 }
 		                		     		        	$("#contentGrID2").val(responseJson.examID);
 		                		     		        	$("#contentGrName2").val(responseJson.examName);
 		                		     		        	
 		                		     		        	if(edate.getHours()==9 && edate.getMinutes()==0 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("90000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==9 && edate.getMinutes()==30 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("93000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==10 && edate.getMinutes()==0 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("100000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==0 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("130000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==30 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("133000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==0 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("140000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==30 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("143000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==0 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("150000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==30 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("153000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==0 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("160000");
 		                		     		        	}
 		                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==30 && edate.getSeconds()==0){
 	 		                		     		        	$("#examTime2").val("163000");
 		                		     		        	}
 		                		     		        	
 		                		     		        	//$("#examDate2").val(responseJson.examDate);
 		                		     		        	$("#classID2").val(responseJson.contentGrName);
	 		                		     		        $("#numQues2").val(responseJson.numQues);
	 		                		     		        
	 		                		     		      	if(edate.getDate()<10 && (edate.getMonth()+1)<10){
	 		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-0" +edate.getDate());
		                		     		        	}
		                		     		        	else if(edate.getDate()<10 && (edate.getMonth()+1)>=10){ 	
	 		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-0" +edate.getDate());
	 		                		     		        	
		                		     		        	}
		                		     		        	else if((edate.getMonth()+1)<10 && edate.getDate()>=10){
		                		     		        		$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-" +edate.getDate());
		                		     		        	}
		                		     		        	else{
	 		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-" +edate.getDate());
		                		     		        	}
	 		                		     		      
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
	 		           	                    	$.post("act_Examination",{action: '4',examID : product.examID,contentGrName : product.contentGrName}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
	   		                							reload();
	   		                							reload2();
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
     		    autopage2();
 		    });
 			
        	 
        	 
        	 function reload(){
        		 $.get("act_Examination", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
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
      		        	var edate = new Date(product.examDate);
      		        	$("<tr>").appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
      		          .append($("<td>").text(product.examID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
		                .append($("<td>").text(product.examName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
		               	.append($("<td>").text(product.examTime))
 		               	.append($("<td>").text(edate.getDate() + "/" + (edate.getMonth() + 1) + "/" + edate.getFullYear()))
		               	.append($("<td>").text(product.contentGrName))
		               	.append($("<td>").text(product.numQues))
		                .append($("<td>")
		                		.append($("<a>")
		                				.append($("<i>").addClass("fa fa-pencil edit"))
		                			   )
		                				.click(function(){
		                		           	 $.post("act_Examination",{action: '3',examID : product.examID,contentGrName : product.contentGrName}, 
		                		           		function(responseJson) { 
	 		                		           		if (responseJson.check == "fail") {
		 		               		                  	alert("Loaddata failed!");
		 		               		                    return;
	 		               		       				 }
	 		                		           	$("#contentGrID2").val(responseJson.examID);
	                		     		        	$("#contentGrName2").val(responseJson.examName);
	                		     		        	
	                		     		        	if(edate.getHours()==9 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("90000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==9 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("93000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==10 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("100000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("130000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("133000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("140000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("143000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("150000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("153000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("160000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("163000");
	                		     		        	}
	                		     		        	
	                		     		        	//$("#examDate2").val(responseJson.examDate);
	                		     		        	$("#classID2").val(responseJson.contentGrName);
		                		     		        $("#numQues2").val(responseJson.numQues);
		                		     		        
		                		     		      	if(edate.getDate()<10 && (edate.getMonth()+1)<10){
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-0" +edate.getDate());
                		     		        	}
                		     		        	else if(edate.getDate()<10 && (edate.getMonth()+1)>=10){ 	
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-0" +edate.getDate());
		                		     		        	
                		     		        	}
                		     		        	else if((edate.getMonth()+1)<10 && edate.getDate()>=10){
                		     		        		$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-" +edate.getDate());
                		     		        	}
                		     		        	else{
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-" +edate.getDate());
                		     		        	}
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
	 		           	                    	$.post("act_Examination",{action: '4',examID : product.examID,contentGrName : product.contentGrName}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();
	   		                							reload2();
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
      		    autopage2();
      		    });
        	 }
        	 
	        
        	$('#add2').click(function(){
           	 $.post("act_Examination",{action: '1',examID : $('#contentGrID').val(),examName : $('#contentGrName').val(),
            		examTime : $('#examTime').val(),examDate : $('#examDate').val(),contentGrName : $('#classID').val(),
               		numQues : $('#numQues').val()},
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
           		
					reload2();
           		 //xóa table cũ đi
           		 $.each(responseJson, function(index, product) { 
           			$("#productTable > tbody > tr").remove();
           		 });
           	 //Load lại toàn bộ dữ liệu mới sau khi insert
           		 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
           			var edate = new Date(product.examDate);	
           			 $("#productTable > tbody").append(
     		        	$("<tr>")                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        	 .append($("<td>").text(product.examID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
  		                .append($("<td>").text(product.examName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
  		               	.append($("<td>").text(product.examTime))
 		               	.append($("<td>").text(edate.getDate() + "/" + (edate.getMonth() + 1) + "/" + edate.getFullYear()))
  		               	.append($("<td>").text(product.contentGrName))
  		               	.append($("<td>").text(product.numQues))
  		                .append($("<td>")
  		                		.append($("<a>")
  		                				.append($("<i>").addClass("fa fa-pencil edit"))
  		                			   )
  		                				.click(function(){
  		                		           	 $.post("act_Examination",{action: '3',examID : product.examID,contentGrName : product.contentGrName}, 
  		                		           		function(responseJson) { 
 	 		                		           		if (responseJson.check == "fail") {
 		 		               		                  	alert("Loaddata failed!");
 		 		               		                    return;
 	 		               		       				 }
 	 		                		           	$("#contentGrID2").val(responseJson.examID);
	                		     		        	$("#contentGrName2").val(responseJson.examName);
	                		     		        	
	                		     		        	if(edate.getHours()==9 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("90000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==9 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("93000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==10 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("100000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("130000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("133000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("140000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("143000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("150000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("153000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("160000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("163000");
	                		     		        	}
	                		     		        	
	                		     		        	//$("#examDate2").val(responseJson.examDate);
	                		     		        	$("#classID2").val(responseJson.contentGrName);
		                		     		        $("#numQues2").val(responseJson.numQues);
		                		     		        
		                		     		      	if(edate.getDate()<10 && (edate.getMonth()+1)<10){
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-0" +edate.getDate());
                		     		        	}
                		     		        	else if(edate.getDate()<10 && (edate.getMonth()+1)>=10){ 	
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-0" +edate.getDate());
		                		     		        	
                		     		        	}
                		     		        	else if((edate.getMonth()+1)<10 && edate.getDate()>=10){
                		     		        		$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-" +edate.getDate());
                		     		        	}
                		     		        	else{
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-" +edate.getDate());
                		     		        	}
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
 	 		           	                    	$.post("act_Examination",{action: '4',examID : product.examID,contentGrName : product.contentGrName}, 
 	   		                						function(responseJson) {  
 		   		                						if (responseJson.check == "fail") {
 			 		               		                  	alert("Deleting failed!");
 			 		               		                    return;
 		 		               		       				 }
 		   		                					reload();
   		                							reload2();
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
           		aautopage();
      		    autopage2();
     		    });
           	 event.preventDefault(); // Important! Prevents submitting the form
            });  
        	
        	
        	$('#edit1').click(function(){
           	 $.post("act_Examination",{action: '2',examID : $('#contentGrID2').val(),examName : $('#contentGrName2').val(),
           		examTime : $('#examTime2').val(),examDate : $('#examDate2').val(),contentGrName : $('#classID2').val(),
           		numQues : $('#numQues2').val()},
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
					reload2();
           		
           		 //xóa table cũ đi
           		 $.each(responseJson, function(index, product) { 
           			$("#productTable > tbody > tr").remove();
           		 });
           	 //Load lại toàn bộ dữ liệu mới sau khi insert
           		 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
           			var edate = new Date(product.examDate);	
           			 $("#productTable > tbody").append(
     		        	$("<tr>")                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
     		        	 .append($("<td>").text(product.examID))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
  		                .append($("<td>").text(product.examName))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
  		               	.append($("<td>").text(product.examTime))
 		               	.append($("<td>").text(edate.getDate() + "/" + (edate.getMonth() + 1) + "/" + edate.getFullYear()))
  		               	.append($("<td>").text(product.contentGrName))
  		               	.append($("<td>").text(product.numQues))
  		                .append($("<td>")
  		                		.append($("<a>")
  		                				.append($("<i>").addClass("fa fa-pencil edit"))
  		                			   )
  		                				.click(function(){
  		                		           	 $.post("act_Examination",{action: '3',examID : product.examID,contentGrName : product.contentGrName}, 
  		                		           		function(responseJson) { 
 	 		                		           		if (responseJson.check == "fail") {
 		 		               		                  	alert("Loaddata failed!");
 		 		               		                    return;
 	 		               		       				 }
 	 		                		           	$("#contentGrID2").val(responseJson.examID);
	                		     		        	$("#contentGrName2").val(responseJson.examName);
	                		     		        	
	                		     		        	if(edate.getHours()==9 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("90000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==9 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("93000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==10 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("100000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("130000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==13 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("133000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("140000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==14 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("143000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("150000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==15 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("153000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==0 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("160000");
	                		     		        	}
	                		     		        	else if(edate.getHours()==16 && edate.getMinutes()==30 && edate.getSeconds()==0){
		                		     		        	$("#examTime2").val("163000");
	                		     		        	}
	                		     		        	
	                		     		        	//$("#examDate2").val(responseJson.examDate);
	                		     		        	$("#classID2").val(responseJson.contentGrName);
		                		     		        $("#numQues2").val(responseJson.numQues);
		                		     		        
		                		     		      	if(edate.getDate()<10 && (edate.getMonth()+1)<10){
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-0" +edate.getDate());
                		     		        	}
                		     		        	else if(edate.getDate()<10 && (edate.getMonth()+1)>=10){ 	
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-0" +edate.getDate());
		                		     		        	
                		     		        	}
                		     		        	else if((edate.getMonth()+1)<10 && edate.getDate()>=10){
                		     		        		$("#examDate2").val(edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-" +edate.getDate());
                		     		        	}
                		     		        	else{
		                		     		        	$("#examDate2").val(edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-" +edate.getDate());
                		     		        	}
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
 	 		           	                    	$.post("act_Examination",{action: '4',examID : product.examID,contentGrName : product.contentGrName}, 
 	   		                						function(responseJson) {  
 		   		                						if (responseJson.check == "fail") {
 			 		               		                  	alert("Deleting failed!");
 			 		               		                    return;
 		 		               		       				 }
 	   		                							reload();
 	   		                							reload2();
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
	        
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	$("#modal-7options").hide();
        	
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
        	

     	   
     	  $('#btn_left6').click(function(){
     		  
     		 $.post("act_Examination",{action: '7'},function(responseJson) {
	   			 if (responseJson.check == "fail") {
	  		        	alert("Loaddata failed!");
			                return;       		                  	
		 		        }
	   			 
	   			$.each(responseJson, function(index, product) {    // Iterate over the JSON array.
  		        	$("#examlist > option").remove();
    		 	});
   			 
   				 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        	$("#examlist").append($("<option>").val(product.examID)
	     		       				.text(product.examID))       	
   		 		});
	   		 });
     		 
     		 $("#modal-6options").show();
     	  });
        	
        	$.get("act_ExamDetails", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
 		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
 		        if (responseJson.check == "fail") {
		                    //$('#message').text("List isEmpty! Name not found!");
		                    //$('#message').css('color', 'red');
		                  	alert("Loaddata failed!");
		                    return;
		        }
		 
 		        var $table = document.getElementById("row2");
 		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        	$("<tr>").appendTo($table).addClass('article-loop')                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
 		                .append($("<td>").text(product.detail_ID).css('width','300px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.examID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.contentGrName))
 		               	.append($("<td>").text(product.questionID))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_ExamDetails",{action: '3',detail_ID : product.detail_ID}, 
 		                		           		function(responseJson) { 
	 		                		           		if (responseJson.check == "fail") {
		 		               		                  	alert("Loaddata failed!");
		 		               		                    return;
	 		               		       				 }
	 		                		           			$("#detail_ID").val(responseJson.detail_ID);
 		                		     		        	$("#examID_detail").val(responseJson.examID);
 		                		     		        	$("#classID4").val(responseJson.contentGrName);
 		                		     		        	
 		                		     		        	$.post("act_ExamDetails",{action: '6', contentGrName: responseJson.contentGrName},function(responseJson) {
 		                		     		    			 if (responseJson.check == "fail") {
 		                		     		    		        	alert("Loaddata failed. This ContentGroup don't have any question2!");
 		                		     		 		                return;       		                  	
 		                		     		 	 		        }
 		                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		                		     		   		        	$("#numQues4 > option").remove();
 		                		     		     		 	});
 		                		     		    			 
 		                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		                		     		  		        	$("#numQues4").append($("<option>").val(product.questionID)
 		                		     		 	     		       				.text(product.questionID))       	
 		                		     		    		 	});
 		                		     		    		 });
	 		                		     		        $("#numQues4").val(responseJson.questionID);
 		                		     	 		           	 event.preventDefault();

 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-7options").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_ExamDetails",{action: '4',detail_ID : product.detail_ID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();
	   		                							reload2();
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
     		    autopage2();$('.article-loop').paginate(6);
 		    });
 			
        	 
        	 
        	 function reload2(){
        		 $.get("act_ExamDetails", function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
      		        //var $table = $("<table>").appendTo($("#somediv")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
      		        if (responseJson.check == "fail") {
      		        	alert("Loaddata failed!");
		                return;       		                  	
	 		        }    		        
        		      var $table = document.getElementById("row2");

      		      	$.each(responseJson, function(index, product) { 
             			$("#productTable2 > tbody > tr").remove();
             		 });
      		      	
   		        	$.each(responseJson, function(index, product) {    // Iterate over the JSON array.
   		        		$("<tr>").appendTo($table).addClass('article-loop')                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
   		                .append($("<td>").text(product.detail_ID).css('width','300px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
   		                .append($("<td>").text(product.examID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
   		               	.append($("<td>").text(product.contentGrName))
   		               	.append($("<td>").text(product.questionID))
   		                .append($("<td>")
   		                		.append($("<a>")
   		                				.append($("<i>").addClass("fa fa-pencil edit"))
   		                			   )
   		                				.click(function(){
   		                		           	 $.post("act_ExamDetails",{action: '3',detail_ID : product.detail_ID}, 
   		                		           		function(responseJson) { 
  	 		                		           		if (responseJson.check == "fail") {
  		 		               		                  	alert("Loaddata failed!");
  		 		               		                    return;
  	 		               		       				 }
  	 		                		           			$("#detail_ID").val(responseJson.detail_ID);
   		                		     		        	$("#examID_detail").val(responseJson.examID);
   		                		     		        	$("#classID4").val(responseJson.contentGrName);
   		                		     		        	
   		                		     		        $.post("act_ExamDetails",{action: '6', contentGrName: responseJson.contentGrName},function(responseJson) {
	                		     		    			 if (responseJson.check == "fail") {
	                		     		    		        	alert("Loaddata failed. This ContentGroup don't have any question2!");
	                		     		 		                return;       		                  	
	                		     		 	 		        }
	                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	                		     		   		        	$("#numQues4 > option").remove();
	                		     		     		 	});
	                		     		    			 
	                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
	                		     		  		        	$("#numQues4").append($("<option>").val(product.questionID)
	                		     		 	     		       				.text(product.questionID))       	
	                		     		    		 	});
	                		     		    		 });
   		                		     		        
  	 		                		     		        $("#numQues4").val(responseJson.questionID);
   		                		     	 		           	 event.preventDefault();

   		                		     		    }
   		                		           	 );
   		                		           	 event.preventDefault();
    		                					$("#modal-7options").show();

   		                				})
   		                )
   		                .append($("<td>")
   		                		.append($("<a>")
   		                				.append($("<i>").addClass("fa fa-trash remove"))
   		                				)
   		                				.click(function(){
   		                					var retVal = confirm("Do you really want to delete this?");          	
  	 		           	                    if( retVal == true ){
  	 		           	                    	$.post("act_ExamDetails",{action: '4',detail_ID : product.detail_ID}, 
  	   		                						function(responseJson) {  
  		   		                						if (responseJson.check == "fail") {
  			 		               		                  	alert("Deleting failed!");
  			 		               		                    return;
  		 		               		       				 }
  		   		                					reload();
   		                							reload2();
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
   	      		    autopage2();$('.article-loop').paginate(6);
      		    });
        	 }
        	 
	        
        	$('#add6').click(function(){
           	 $.post("act_ExamDetails",{action: '1',examID : $('#examlist').val(),contentGrName : $('#classID3').val(),
               		questionID : $('#numQues3').val()},
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
	           		reload();
	           	  var $table = document.getElementById("row2");

    		      	$.each(responseJson, function(index, product) { 
           			$("#productTable2 > tbody > tr").remove();
           		 });
    		      	
 		        	$.each(responseJson, function(index, product) {    // Iterate over the JSON array.
 		        		$("<tr>").appendTo($table).addClass('article-loop')                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
 		                .append($("<td>").text(product.detail_ID).css('width','300px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
 		                .append($("<td>").text(product.examID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
 		               	.append($("<td>").text(product.contentGrName))
 		               	.append($("<td>").text(product.questionID))
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-pencil edit"))
 		                			   )
 		                				.click(function(){
 		                		           	 $.post("act_ExamDetails",{action: '3',detail_ID : product.detail_ID}, 
 		                		           		function(responseJson) { 
	 		                		           		if (responseJson.check == "fail") {
		 		               		                  	alert("Loaddata failed!");
		 		               		                    return;
	 		               		       				 }
	 		                		           			$("#detail_ID").val(responseJson.detail_ID);
 		                		     		        	$("#examID_detail").val(responseJson.examID);
 		                		     		        	$("#classID4").val(responseJson.contentGrName);
 		                		     		        	
 		                		     		        	$.post("act_ExamDetails",{action: '6', contentGrName: responseJson.contentGrName},function(responseJson) {
		                		     		    			 if (responseJson.check == "fail") {
		                		     		    		        	alert("Loaddata failed. This ContentGroup don't have any question2!");
		                		     		 		                return;       		                  	
		                		     		 	 		        }
		                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
		                		     		   		        	$("#numQues4 > option").remove();
		                		     		     		 	});
		                		     		    			 
		                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
		                		     		  		        	$("#numQues4").append($("<option>").val(product.questionID)
		                		     		 	     		       				.text(product.questionID))       	
		                		     		    		 	});
		                		     		    		 });
 		                		     		        	
	 		                		     		        $("#numQues4").val(responseJson.questionID);
 		                		     	 		           	 event.preventDefault();

 		                		     		    }
 		                		           	 );
 		                		           	 event.preventDefault();
  		                					$("#modal-7options").show();

 		                				})
 		                )
 		                .append($("<td>")
 		                		.append($("<a>")
 		                				.append($("<i>").addClass("fa fa-trash remove"))
 		                				)
 		                				.click(function(){
 		                					var retVal = confirm("Do you really want to delete this?");          	
	 		           	                    if( retVal == true ){
	 		           	                    	$.post("act_ExamDetails",{action: '4',detail_ID : product.detail_ID}, 
	   		                						function(responseJson) {  
		   		                						if (responseJson.check == "fail") {
			 		               		                  	alert("Deleting failed!");
			 		               		                    return;
		 		               		       				 }
		   		                						reload();
	   		                							reload2();
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
 		        	autopage();$('.article-loop').paginate(6);
 	      		    autopage2();
     		    });
           	 event.preventDefault(); // Important! Prevents submitting the form
            });  
        	
        	
        	$('#edit7').click(function(){
           	 $.post("act_ExamDetails",{action: '2',detail_ID : $('#detail_ID').val(),
            		questionID : $('#numQues4').val()},
           	 function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
           		if (responseJson.check == "fail") {
                    var retVal = confirm("Please enter your full details with your request!\nDo you want to continute?");          	
                    if( retVal == true ){
                    	$("#modal-7options").show();
                       return true;
                    }
                    else{
                       return false;
                    }
        		}
           		reload();
           		var $table = document.getElementById("row2");

		      	$.each(responseJson, function(index, product) { 
       			$("#productTable2 > tbody > tr").remove();
       		 });
		      	
		        	$.each(responseJson, function(index, product) {    // Iterate over the JSON array.
		        		$("<tr>").appendTo($table).addClass('article-loop')                      // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
		                .append($("<td>").text(product.detail_ID).css('width','300px'))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
		                .append($("<td>").text(product.examID))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
		               	.append($("<td>").text(product.contentGrName))
		               	.append($("<td>").text(product.questionID))
		                .append($("<td>")
		                		.append($("<a>")
		                				.append($("<i>").addClass("fa fa-pencil edit"))
		                			   )
		                				.click(function(){
		                		           	 $.post("act_ExamDetails",{action: '3',detail_ID : product.detail_ID}, 
		                		           		function(responseJson) { 
 		                		           		if (responseJson.check == "fail") {
	 		               		                  	alert("Loaddata failed!");
	 		               		                    return;
 		               		       				 }
 		                		           			$("#detail_ID").val(responseJson.detail_ID);
		                		     		        	$("#examID_detail").val(responseJson.examID);
		                		     		        	$("#classID4").val(responseJson.contentGrName);
		                		     		        	
		                		     		        	$.post("act_ExamDetails",{action: '6', contentGrName: responseJson.contentGrName},function(responseJson) {
		                		     		    			 if (responseJson.check == "fail") {
		                		     		    		        	alert("Loaddata failed. This ContentGroup don't have any question2!");
		                		     		 		                return;       		                  	
		                		     		 	 		        }
		                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
		                		     		   		        	$("#numQues4 > option").remove();
		                		     		     		 	});
		                		     		    			 
		                		     		    			 $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
		                		     		  		        	$("#numQues4").append($("<option>").val(product.questionID)
		                		     		 	     		       				.text(product.questionID))       	
		                		     		    		 	});
		                		     		    		 });
		                		     		        	
 		                		     		        $("#numQues4").val(responseJson.questionID);
		                		     	 		           	 event.preventDefault();

		                		     		    }
		                		           	 );
		                		           	 event.preventDefault();
		                					$("#modal-7options").show();

		                				})
		                )
		                .append($("<td>")
		                		.append($("<a>")
		                				.append($("<i>").addClass("fa fa-trash remove"))
		                				)
		                				.click(function(){
		                					var retVal = confirm("Do you really want to delete this?");          	
 		           	                    if( retVal == true ){
 		           	                    	$.post("act_ExamDetails",{action: '4',detail_ID : product.detail_ID}, 
   		                						function(responseJson) {  
	   		                						if (responseJson.check == "fail") {
		 		               		                  	alert("Deleting failed!");
		 		               		                    return;
	 		               		       				 }
	   		                						reload();
   		                							reload2();
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
					<a class="nav-link" href="ForwardToPerinfo_Exam?username=${perinfo.username }">PERSIONAL INFO</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MANAGEMENT</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
						<a class="dropdown-item" href="ForwardToExam?username=${perinfo.username }">EXAMINATION</a>
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
                        Add Examination 
                        <button type="button" class="close" data-dismiss="modal-3options" aria-label="Close" id="closebtn">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_contentGr" class="was-validated" action="" method="">
                <fieldset>
                		<div>
                            <label for="text" class="lbl_contentgr">Exam ID</label>
                            <span class="red_right_add2e" id="contentGrID_error_message"></span>
                        </div>
                        <div>
                            <input type="text" name="examID" id="contentGrID" placeholder="Enter ExamID">
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Exam Name</label>
                            <span class="red_right_add2e" id="contentGrName_error_message"></span>
                        </div>
                        <div>
                            <input type="text" name="examName" id="contentGrName" placeholder="Enter ExamID">
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Time of Exam</label>
                            <select name="examTime" id="examTime" class="custom-select d-block my-3 select_contentgr" required>
                                        <option value="90000">9h00</option>
                                        <option value="93000">9h30</option>
                                        <option value="100000">10h00</option>
                                        <option value="130000">13h00</option>
                                        <option value="133000">13h30</option>
                                        <option value="140000">14h00</option>
                                        <option value="143000">14h30</option>
                                        <option value="150000">15h00</option>
                                        <option value="153000">15h30</option>
                                        <option value="160000">16h00</option>
                                        <option value="163000">16h30</option>
                             </select>
                        </div>
                        
                        <div>
                                <label for="time" class="lbl_time">Day of Exam</label> 
                                <input name="examDate" type="date" id="examDate" class="input_time" required />
                        </div>
                        
                        <a class="md-trigger btn" data-modal="modal-5options" id="btn_left2">
                        <button type="button" class="btn add-employee">
                	<i class="fa fa-plus" aria-hidden="true"></i>Add Question for Exam</button></a>            
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
    
    
    
    <!-- Form add question for exam -->
    <div class="md-modal5 md-effect-7" id="modal-5options">
        <div class="md-content">
            <h4>
                <span>
                        Add Question for Exam
                        <button type="button" class="close" data-dismiss="modal-5options" aria-label="Close" id="closebtn2">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_option" class="was-validated" action="" method="">
                <fieldset>  
                        <div>
                            <label for="text" class="lbl_contentgr">ContentGroup Name</label>
                            <select id="classID" class="custom-select d-block my-3 select_contentgr" required>
                                        <!--  <option value="">Choose Exam ID</option>
                                        <option value="1">Exam 01</option>
                                        <option value="2">Exam 02</option>
                                        <option value="3">Exam 03</option>
                                        <option value="4">Exam 04</option>
                                        <option value="5">Exam 05</option>
                                        <option value="6">Exam 06</option>
                                        <option value="7">Exam 07</option>
                                        <option value="8">Exam 08</option>
                                        <option value="9">Exam 09</option> -->
                             </select>
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Question ID</label>
                            <select id="numQues" class="custom-select d-block my-3 select_contentgr" required>
                                       
                             </select>
                        </div> 
                </fieldset>
                <div>
                    <div id="btn">
                    	<div id="add2" style="float:left;">
                        <input class="animated" type="button" value="ADD">
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
    <!-- end form add question for exam  -->
    
    <script>
	document.getElementById("closebtn2").onclick = function abc5() {
	       $("#modal-5options").hide();
	   };
	   document.getElementById("btn_left2").onclick = function abc6() {
	       $("#modal-5options").show();
	   };
	</script>
	                                        
    <!-- Form repair Authority, sử dụng chung với content group -->
    <div class="md-modal118" id="modal-4options">
        <div class="md-content">
            <h4 class="h4-repair-contentGr">
                <span>
                        Edit Exam
                        <button type="button" class="close" data-dismiss="modal-4options" aria-label="Close" id="closebtn1">
                              <span aria-hidden="true">&times;</span>
                        </button>                
                </span>
            </h4>

            <form id="login_form_contentGr2" class="was-validated" action="" method="post">
                <fieldset>
                        <div>
                            <label for="text" class="lbl_contentgr">Exam ID</label>
                            <span class="red_right_add2e" id="contentGrID_error_message2"></span>
                        </div>
                        <div>
                            <input type="text" name="examID" id="contentGrID2" placeholder="Enter ExamID" disabled>
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Exam Name</label>
                            <span class="red_right_add2e" id="contentGrName_error_message2"></span>
                        </div>
                        <div>
                            <input type="text" name="examName" id="contentGrName2" placeholder="Enter ExamID">
                        </div>                                             
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Time of Exam</label>
                            <select name="examTime" id="examTime2" class="custom-select d-block my-3 select_contentgr" required>
                                        <option value="90000">9h00</option>
                                        <option value="93000">9h30</option>
                                        <option value="100000">10h00</option>
                                        <option value="130000">13h00</option>
                                        <option value="133000">13h30</option>
                                        <option value="140000">14h00</option>
                                        <option value="143000">14h30</option>
                                        <option value="150000">15h00</option>
                                        <option value="153000">15h30</option>
                                        <option value="160000">16h00</option>
                                        <option value="163000">16h30</option>
                             </select>
                        </div>
                        
                        <div>
                                <label for="time" class="lbl_time">Day of Exam</label> 
                                <input name="doB" type="date" id="examDate2" class="input_time" required />
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">ContentGroup Name</label>
                            <input type="text" id="classID2" required disabled>
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Number of question</label>
                            <input type="text" id="numQues2" required disabled>
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
  
   
    <!-- Authority Manegement -->
    
     <div class="container tieude" id="content-gr">
         		<h2 class="text-center" style="color: red;font-weight: bold;margin-bottom: 20px !important;">EXAMINATION MANEGEMENT</h2>
        <p class="text-right">
        <a class="md-trigger btn" data-modal="modal-3options" id="btn_left"><button type="submit" class="btn add-employee">
        	<i class="fa fa-plus" aria-hidden="true"></i>Add Examination</button></a>
        </p>
	
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped pre-scrollable2 paginated" id="productTable">
						<thead>
							<tr class="text-center">
								<th class="text-center">Exam ID</th>
                                <th class="text-center">Exam Name</th>
                                <th class="text-center">Time of Exam</th>
                                <th class="text-center">Day of Exam</th>
                                <th class="text-center">ContentGroup Name</th>
                                <th class="text-center">Number of Question</th>
							</tr>
						</thead>
						<tbody id="row" class="text-center">
						
						
						
						</tbody>
					</table>
				
				</div>
		<script src="Style/js/classie.js"></script>
   	<script src="Style/js/modalEffects.js"></script>
    </div>
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
      <!-- Form add Option, sử dụng chung với content group -->
    <div class="md-modal5 md-effect-7" id="modal-6options">
        <div class="md-content">
            <h4>
                <span>
                        Add Detail for Exam
                        <button type="button" class="close" data-dismiss="modal-6options" aria-label="Close" id="closebtn6">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_5options" class="was-validated" action="" method="">
                <fieldset>  
                        <div>
                            <label for="text" class="lbl_contentgr">Exam ID</label>
                            <select id="examlist" class="custom-select d-block my-3 select_contentgr" required>
                                     
                            </select>
                        </div>

                        <div>
                            <label for="text" class="lbl_contentgr">ContentGroup Name</label>
                            <select id="classID3" class="custom-select d-block my-3 select_contentgr" required>
                                        <!--  <option value="">Choose Exam ID</option>
                                        <option value="1">Exam 01</option>
                                        <option value="2">Exam 02</option>
                                        <option value="3">Exam 03</option>
                                        <option value="4">Exam 04</option>
                                        <option value="5">Exam 05</option>
                                        <option value="6">Exam 06</option>
                                        <option value="7">Exam 07</option>
                                        <option value="8">Exam 08</option>
                                        <option value="9">Exam 09</option> -->
                             </select>
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Question ID</label>
                            <select id="numQues3" class="custom-select d-block my-3 select_contentgr" required>
                                       
                             </select>
                        </div> 
                </fieldset>
                <div>
                    <div id="btn">
                    	<div id="add6" style="float:left;">
                        <input class="animated" type="submit" value="ADD">
                        </div>
                           <input id="closebtn_form6" data-dismiss="modal-6options" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form6").onclick = function abc3() {
                                      $("#modal-6options").hide();
                                  };
                   document.getElementById("add6").onclick = function abc3() {
                                      $("#modal-6options").hide();
                                  };
                    </script>
                </div>
              </form>           
        </div>
    </div>
    <!-- end form add Authority  -->
     
     <style>
     #modal-7options {
	margin: 60px auto 20px auto;
	width: 70%; /*hiá»ƒn thá»‹ 70% lÃ  cÃ¢n báº±ng khi thu nhá»�*/
}
/*pháº§n tÃªn form vÃ  má»¥c select*/
#modal-7options h4 {
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
#modal-7options #login_form_4option{
    background-color: #fff;
    padding: 32px 0px 35px 25px;
    display: inline-block;
    color: #343536;
    line-height: 27px;
    width: 100%;
    border: 1px solid #9b9999;
        /*bo trÃ²n 2 gÃ³c dÆ°á»›i*/
    -webkit-border-radius: 0 0 5px 5px;
	-moz-border-radius: 0 0 5px 5px;
	border-radius: 0 0 5px 5px;   
}
#modal-7options fieldset input[type="text"], #modal-7options fieldset input[type="password"] {
	width: 90%;
    color: #5a6265;
	padding: 4px 5px;
    border: 1px solid #9b9999;
    -webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
    margin-bottom: 5px;
}
#modal-7options #login_form_4option input[type="submit"] {
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
/*2 button add vÃ  cancel*/
#modal-7options #login_form_4option #btn {
    float: right;
    padding-top: 35px;
} 
#modal-7options #login_form_4option #btn .animated:hover{
    color: #fff;
    background: #2582b4;
}
#modal-7options #login_form_4option #btn .md-close {
    margin-left: 35px;
    margin-right: 50px;
    color: #fff;
    background: #87969f;
}
#modal-7options #login_form_4option #btn .md-close:hover {
    color: #fff;
    background: #798389;
}
     </style>
     
     <!-- Form add Option, sử dụng chung với content group -->
    <div class="md-modal118" id="modal-7options">
        <div class="md-content">
            <h4>
                <span>
                        Edit Exam Detail
                        <button type="button" class="close" data-dismiss="modal-7options" aria-label="Close" id="closebtn7">
                              <span aria-hidden="true">&times;</span>
                        </button>
                </span>
            </h4>

            <form id="login_form_4option" class="was-validated" action="" method="">
                <fieldset>
                		<div>
                            <label for="text" class="lbl_contentgr">Detail ID</label>
                            <input name="detail_ID" type="text" id="detail_ID" class="input_time" required disabled />
                        </div> 
                         
                        <div>
                            <label for="text" class="lbl_contentgr">Exam ID</label>
                            <input name="examID" type="text" id="examID_detail" class="input_time" required disabled />
                        </div>

                        <div>
                            <label for="text" class="lbl_contentgr">ContentGroup Name</label>
                            <input name="contentGrName" type="text" id="classID4" class="input_time" required disabled />
                        </div>
                        
                        <div>
                            <label for="text" class="lbl_contentgr">Question ID</label>
                            <select id="numQues4" class="custom-select d-block my-3 select_contentgr" required>
                                       
                             </select>
                        </div> 
                </fieldset>
                <div>
                    <div id="btn">
                    	<div id="edit7" style="float:left;">
                        <input class="animated" type="submit" value="EDIT">
                        </div>
                           <input id="closebtn_form7" data-dismiss="modal-7options" aria-label="Close"
                         class="animated md-close" type="button" value="CANCEL">
                    </div>
                    <script>
                    //btn cancel của edit form
                    document.getElementById("closebtn_form7").onclick = function abc3() {
                                      $("#modal-7options").hide();
                                  };
                   document.getElementById("edit7").onclick = function abc3() {
                                      $("#modal-7options").hide();
                                  };
                    </script>
                </div>
              </form>           
        </div>
    </div>
    <!-- end form add Authority  -->
     
     
     
     <hr style="margin:50px 0 60px;">
     <div class="container tieude" id="content-gr2">
         		<h2 class="text-center" style="color: red;font-weight: bold;margin-bottom: 20px !important;">EXAMDETAILS MANEGEMENT</h2>
        <p class="text-right">
        <a class="md-trigger btn" data-modal="modal-6options" id="btn_left6"><button type="button" class="btn add-employee">
        	<i class="fa fa-plus" aria-hidden="true"></i>Add ExamDetails</button></a>
        </p>
	
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-striped pre-scrollable2 paginated2" id="productTable2">
						<thead>
							<tr class="text-center">
								<th class="text-center">Detail ID</th>
                                <th class="text-center">Exam ID</th>
                                <th class="text-center">ContentGroup Name</th>
                                <th class="text-center">Question ID</th>
							</tr>
						</thead>
						<tbody id="row2" class="text-center">
						
						
						
						</tbody>
					</table>
				
				</div>
		<script src="Style/js/classie.js"></script>
   	<script src="Style/js/modalEffects.js"></script>
    </div>
    
     
      <!-- javascript xử lý cái nút close -->
        <script type="text/javascript">
            //nút close của add
                document.getElementById("btn_left").onclick = function abc2() {
                        $("#modal-3options").show();
                        $("#contentGrID").val("");
                        $("#contentGrName").val("");
                        $("#examTime").val("");
                        $("#examDate").val("");
                        $("#classID").val("");
                        $("#numQues").val("");
                    };
                document.getElementById("closebtn").onclick = function abc() {
                        $("#modal-3options").hide();
                    };
            //nút close của repair với 6 cột tương đương 6 nút edit
              document.getElementById("closebtn1").onclick = function abc3() {
                        $("#modal-4options").hide();
                    };
                document.getElementById("btn_left1").onclick = function abc4() {
                        $("#modal-4options").show();
                    };

                                              
        </script>

<script>
	document.getElementById("closebtn6").onclick = function abc5() {
	       $("#modal-6options").hide();
	   };
	   
	   
	   document.getElementById("closebtn7").onclick = function abc5() {
	       $("#modal-7options").hide();
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
/* =========================== Bảng student của admin 20/12/2017 ======================*/
div.pager {
    text-align: center;
}

div.pager span {
    display: inline-block;
    width: 42px;
    height: 38px;
    line-height: 2.3;
    text-align: center;
    cursor: pointer;
    background: #343a40;
    color: #fff;
    margin-right: 10px;
    margin-top: 15px;
	border-radius: 5px;
	font-weight: bold;
	padding:0px 4px;
}

div.pager span.active {
    background: #129950;
}
</style>

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