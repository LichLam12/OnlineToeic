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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <!-- Icon của button login -->
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
      
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
        	//var spans = document.getElementsByTagName("examID")
        	var examID=document.getElementById('examID').innerText;
        	var className=document.getElementById('className').innerText;
			var kt=0;
			
			var classID;
			var markTrue;
			var endtime;
			var numQues;
        	$.post("act_ExamPage",{action : '1',examID : examID,className : className}, function(responseJson) { 
		        if (responseJson.check == "fail") {
		                    //$('#message').text("List isEmpty! Name not found!");
		                    //$('#message').css('color', 'red');
		                  	alert("Loaddata failed!");
		                    return;
		        }
// 		        mark_temp=10/(responseJson.length)
// 		        var n = parseFloat(mark_temp); //làm tròn phần sau dấu chấm
// 		        x = Math.round(n * 1000)/1000; 
// 		        //alert( x ); // 36.4
// 		        document.getElementById('mark').innerText=x+"/1 Question";

     			kt=1;
     			var endtime2=responseJson.length/12;
        		$("#set-time").val(endtime2);
        		endtime=endtime2;
        		if(kt==1){
					var minutes = $('#set-time').val();
					endtime=minutes;
					var target_date = new Date().getTime() + ((minutes * 60) * 1000); // set the countdown date
					var time_limit = ((minutes * 60) * 1000);
					//set actual timer
					setTimeout(
						function() {
							alert('Time\'s up. Let us congratulate you on finishing the test.');
							endtime=0;
							
							var studentID = document.getElementById('studentID').innerText;
					        	if(endtime==0){
					        		 var finalmark=(markTrue/(numQues-1))*10;        		
					             	var m = parseFloat(finalmark); //làm tròn phần sau dấu chấm
					     		    var mark = Math.round(m * 1000)/1000; 
					        		$.post("act_Student",{action: '8',studentID : studentID,classID : classID,
					             		 mark : mark},
					             		function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
					  	           		if (responseJson.check == "fail") {
					  	                    
					  	        		}
					       		    });
					             	 event.preventDefault(); // Important! Prevents submitting the form
						        }else{
						        }
						}, time_limit);

					var days, hours, minutes, seconds; // variables for time units

					var countdown = document.getElementById("tiles"); // get tag element

					getCountdown();

					setInterval(function() {
						getCountdown();
					}, 1000);

					function getCountdown() {

						// find the amount of "seconds" between now and target
						var current_date = new Date().getTime();
						var seconds_left = (target_date - current_date) / 1000;

						if (seconds_left >= 0) {
							console.log(time_limit);
							if ((seconds_left * 1000) < (time_limit / 2)) {
								$('#tiles').removeClass('color-full');
								$('#tiles').addClass('color-half');

							}
							if ((seconds_left * 1000) < (time_limit / 4)) {
								$('#tiles').removeClass('color-half');
								$('#tiles').addClass('color-empty');
							}

							days = pad(parseInt(seconds_left / 86400));
							seconds_left = seconds_left % 86400;

							hours = pad(parseInt(seconds_left / 3600));
							seconds_left = seconds_left % 3600;

							minutes = pad(parseInt(seconds_left / 60));
							seconds = pad(parseInt(seconds_left % 60));

							// format countdown string + set tag value
							countdown.innerHTML = "<span>" + hours + ":</span><span>" + minutes + ":</span><span>" + seconds + "</span>";
						}
					}

					function pad(n) {
						return (n < 10 ? '0' : '') + n;
					}
			}
        		
        		
		        
        		
        		
		        var $table = document.getElementById("readingTEST");
		        var quesstt=1;
		        var opstt=0;
		        var ques=0;
		        var o1="";
		        var o2="";
		        var startques=0;
		       	markTrue=0;
		        var markFalse=0;
		        $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
		        	
		        	classID=product.classID;
		        	if(index==0){
		        	var edate = new Date(product.examDate);
	        		var nowdate=new Date();
// 	        		if((nowdate.getMinutes()+endtime)<60){
// 	            		nowdate.setMinutes(nowdate.getMinutes()+endtime);
// 	        		}
// 	        		else{
// 	        			var new_minute=(nowdate.getMinutes()+endtime)-60;
// 	        			nowdate.setHours(nowdate.getHours()+1);
// 	        			nowdate.setMinutes(new_minute);
// 	        		}

			        document.getElementById('startTime').innerText=edate;
			        document.getElementById('className').innerText=product.className;
			        document.getElementById('examName').innerText=product.examName;

			        
// 			        if(edate.getDate()<10 && (edate.getMonth()+1)<10){
// 			        	alert("a1");
// 			        	document.getElementById('startTime').innerText=(edate.getHours()+":"+edate.getMinutes()+" "
// 			        			+edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-0" +edate.getDate());
			        	
// 			        	document.getElementById('endTime').innerText=(nowdate.getHours()+":"+nowdate.getMinutes()+" "
// 			        			+nowdate.getFullYear()+ "-0" +(nowdate.getMonth()+1)+ "-0" +nowdate.getDate());
			        	
// 			        	}
// 			        	else if(edate.getDate()<10 && (edate.getMonth()+1)>=10){ 	
// 			        		alert("a12");
// 			        		document.getElementById('startTime').innerText=(edate.getHours()+":"+edate.getMinutes()+" "
// 			        				edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-0" +edate.getDate());
			        		
// 			        		document.getElementById('endTime').innerText=(nowdate.getHours()+":"+nowdate.getMinutes()+" "
// 			        				nowdate.getFullYear()+ "-" +(nowdate.getMonth()+1)+ "-0" +nowdate.getDate());
	  		        	
// 			        	}
// 			        	else if((edate.getMonth()+1)<10 && edate.getDate()>=10){
// 			        		alert("a13");
// 			        		document.getElementById('startTime').innerText=(edate.getHours()+":"+edate.getMinutes()+" "
// 			        				edate.getFullYear()+ "-0" +(edate.getMonth()+1)+ "-" +edate.getDate());
			        		
// 			        		document.getElementById('endTime').innerText=(nowdate.getHours()+":"+nowdate.getMinutes()+" "
// 			        				nowdate.getFullYear()+ "-0" +(nowdate.getMonth()+1)+ "-" +nowdate.getDate());
// 			        	}
// 			        	else{
// 			        		alert("a14");
// 			        		document.getElementById('startTime').innerText=(edate.getHours()+":"+edate.getMinutes()+" "
// 			        				edate.getFullYear()+ "-" +(edate.getMonth()+1)+ "-" +edate.getDate());
			        		
// 			        		document.getElementById('endTime').innerText=(nowdate.getHours()+":"+nowdate.getMinutes()+" "
// 			        				nowdate.getFullYear()+ "-" +(nowdate.getMonth()+1)+ "-" +nowdate.getDate());
// 			        	}
			        
		        	}
			        
			        
		        	//alert(product.questionID);
		        	if(index==0){
		        		o1="Question "+quesstt;
						o2=product.contentques;
						startques=0;
		        	}
					if(ques==product.questionID){
						o1="";
				        o2="";
					}
					else{
						o1="Question "+quesstt;
						o2=product.contentques;
			        	quesstt=quesstt+1;
			        	startques=index;
			        	numQues=quesstt;
			        	document.getElementById('numberQues').innerText=quesstt-1;
					}
					var first_click=0;
					
						$("<div>").appendTo($table).addClass('bd-callout bd-callout-danger news article-loop')                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
	 		                .append($("<h5>").text(o1))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
	 		               	.append($("<p>").text(o2))
	 		               	.append($("<button>").addClass("btn_radio"))
	 		               			.click(function(){
	 		               				first_click=first_click+1;
	 		               				if(first_click%2==0){
		 		               			 	$(this).css('background','white')
	 		               				}
	 		               				else{
		 		               			 	$(this).css('background','#CCFFCC')
	 		               				}
	 		               				
	 		               				
	 		               				if(product.isAnswer == true){
		 		               				if(first_click%2==0){
			 		               			 	markTrue--;
		 		               				}
		 		               				else{
			 		               			 	markTrue++;
		 		               				}
	 		               				}
	 		               				
	 		               				if(product.isAnswer == false){
		 		               				if(first_click%2==0){
		 		               					markFalse++;
		 		               				}
		 		               				else{
			 		               			 	markFalse--;
		 		               				}
	 		               				}
// 	 		               				alert("markTrue: "+markTrue+"markFalse: "+markFalse);
	 		               			})
	 		               	.append($("<p>")
	 		               			.text(product.contentop)
	 		               			)
				ques=product.questionID;

						opstt=index;
		        });
		       $('.article-loop').paginate(9);
		    });
        	
        	
        	
        	
        	
		    
        	
        	var studentID = document.getElementById('studentID').innerText;    
        	$('#submit_button').click(function(){
        		var finalmark=(markTrue/(numQues-1))*10;        		
            	var m = parseFloat(finalmark); //làm tròn phần sau dấu chấm
    		    var mark = Math.round(m * 1000)/1000;
				if(endtime==0){
		        }
				else{
					var retVal = confirm("Do you surely want to submit?");          	
	                if( retVal == true ){
	                	$.post("act_Student",{action: '8',studentID : studentID,classID : classID,
	                  		 mark : mark},
	                  		function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
	       	           		if (responseJson.check == "fail") {
	       	                    
	       	        		}
	                  		alert("Press BACK button to comeback.");
	            		    });
	                  	 event.preventDefault(); // Important! Prevents submitting the form
	                   return true;
	                }
	                else{
	                   return false;
	                } 
				}
        		     	 
            });  
        	
        });
	</script>
</head>
<body>
	<!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="padding: 0 10px">
		<a class="navbar-brand" href="ForwardToLoginedHome2?username=${perinfo.username }"><img src="Style/icon/logo.png" height="50px" style="margin-left: 30px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse lead" id="navbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="ForwardToLoginedHome2?username=${perinfo.username }">HOME <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="ForwardToPerinfo_Student?username=${perinfo.username }">PERSIONAL INFO</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="ForwardToClass_Student?username=${perinfo.username }">CLASSES</a>
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
<style>
.label_radio {
	position: relative;
	margin: 4px;
	padding-left: 20px;
	cursor: pointer;
}

.btn_radio{
margin: 4px 10px 0px;
float:left;
width:10px;
height:15px;
-moz-border-radius: 100px;
    -webkit-border-radius: 100px;
    -ms-border-radius: 100px;
    -o-border-radius: 100px;
    border-radius: 100px;
}
.btn_radio:hover{
	background-color: red;
}
.btn_radio:focus{
	background-color: black;
}
.btn_radio:visited{
	background-color: #33CC33;
}
</style>
    <!-- Examination -->
	<main role="main" class="container exam">

		<div class="row">

			<div class="col-sm-8 blog-main" class="article-loop">

					<h1 class="blog-post-title text-center lead" id="examName"></h1>

<!-- 					<div id="listeningTEST" class="article-loop"> -->
<!-- 						<h5 class="breadcrumbh5"> -->
<!-- 							<span>LISTENING TEST</span> -->
<!-- 							<i class="fa fa-angle-right" aria-hidden="true"></i> -->
<!-- 						</h5> -->

<!-- 						<div class=" text-center"> -->
<!-- 							<audio controls preload="none"> -->
<!--   								<source id="audiolink" src="audio/Beautiful%20In%20White%20-%20Shane%20Filan.mp3" type="audio/mpeg"> -->
<!-- 							</audio> -->
<!-- 						</div> -->


<!-- 						<div id="listenques" class="bd-callout bd-callout-danger news"> -->
<!--  							<h5 id="listenques_stt">Question 1.</h5> -->
<!--  							<img id="imglink" src="http://3.bp.blogspot.com/-2dNrIQcLNng/VrB6imgiwcI/AAAAAAAAKrI/7-UWi5psenE/s1600/Toeic-Speaking-Bai-2-P-2-mo-ta-tranh-01.jpg"  -->
<!-- 										class="img-fluid rounded"> -->
<!-- 						</div> -->

<!-- 						<section class="option"> -->
<!-- 							<ul class="list"> -->
<!-- 								<li class="list__item" id="optionlist"> -->
<!-- 									<label class="label--radio"> -->
<!-- 									<input type="radio" class="radio" name="foo1">A</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</section> -->
<!-- 					</div> -->
						<h5 class="breadcrumbh5" class="article-loop">
							<span>READING TEST</span>
							<i class="fa fa-angle-right" aria-hidden="true"></i>
						</h5>
						
					<div id="readingTEST" class="paginated">
<!-- 						<div class="bd-callout bd-callout-danger news"> -->
<!-- 							<h5>Question 1.</h5> -->
<!-- 							<p></p> -->

<!-- 						<section class="option"> -->
<!-- 							<ul class="list" id="optionlist"> -->
<!-- 								<li class="list__item" > -->
<!-- 									<label class="label--radio"> -->
<!-- 									<input type="radio" class="radio" name="foo1">A</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</section> -->
<!-- 						</div> -->

						
					</div>

					<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
					<script src="Style/js/pag.js"></script>
			</div>


			<div class="col-sm-3 ml-sm-auto ">
			
				<input type="hidden" id="set-time" value="5"></input>
				<div id="countdown">

					<div id='tiles' class="color-full"></div>
					<div class="countdown-label">Time Remaining</div>
				</div>

				<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
				


				<h5>
					<i class="fa fa-info-circle" aria-hidden="true"></i> Information
				</h5>
				<p>Exam ID: <span id="examID">${examID }</span></p>
				<p>Class Name: <span id="className">${className }</span></p>
				<p>Number of question: <span id="numberQues"></span></p>
				<p>Student: <span>${perinfo.fullName }</span><span> (</span><span class="fullname_avt" id="studentID">${perinfo.studentID }</span><span>)</span></p>				
				<p>Started on: <span id="startTime"></span></p>
				
<!-- 								<p>Student: <span>Trần Tuấn Lâm</span><span>(</span><span class="fullname_avt" id="studentID">1</span><span>)</span></p> -->
				<p>Attention: Each question, you have only choose 1 option. If you choose more 1 option, you will lost that question mark.</p>
			
			<!-- Nút submit -->
			<div id="submit_button">
					<button type="button" class="btn" id="submit_btn">Submit</button>
			</div>
				<a href="ForwardToClass_Student?username=${perinfo.username }"><button type="button" class="btn" id="submit-btn">BACK</button></a>
		</div>
		</div>
	</main>
    
    
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
    $('.article-loop').paginate(3);
    </script>
    
    
    <style>
    /* Nút submit */
#submit_btn {
	margin-top: 20px;
	font-weight: bold;
	font-size: 20px;
	color: #fff;
	background-color: #05984f;
	width: 248px;
	height: 60px;
	cursor: pointer;
}

#submit_btn:hover {
  color: #fff;
  background-color: #077941;
  border-color: #077941;
}


  #submit-btn {
	margin-top: 20px;
	font-weight: bold;
	font-size: 20px;
	color: #fff;
	background-color: #BBBBBB;
	width: 248px;
	height: 60px;
	cursor: pointer;
}

#submit-btn:hover {
  color: #fff;
  background-color: #AAAAAA;
  border-color: #077941;
}  
    </style>
    
    
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