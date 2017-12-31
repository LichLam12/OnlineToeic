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
    <script type="text/javascript">
        $(document).ready(function(){
        	var userID = document.getElementById('yourname').innerText;
        	$.post("act_User",{action: '3',userID : userID}, 
		           		function(responseJson) { 
 		           		if (responseJson.check == "fail") {
    		                  	alert("Loaddata failed!");
    		                    return;
		       				 }
 	 		        	var birth2 = new Date(responseJson.doB); 
 	 		        			$("#studentID2").val(responseJson.userID);
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
		     		        	
		     		        	$("#phonenumber3").val(responseJson.phoneNumber);
		     		        	$("#email2").val(responseJson.email);
		     		        	$("#address2").val(responseJson.address);
		     		        	$("#luong2").val(responseJson.salary);
		     		        	$("#authorityID2").val(responseJson.authorityID);

		     		        	if(responseJson.sex==0){
  		     		        	document.getElementById('sex11').checked=true;
		     		        	}
		     		        	else{
  		     		        	document.getElementById('sex12').checked=true;
		     		        	}
		     	 		           	 event.preventDefault();

		     		    }
		           	 );        	
        	 
        $('#save_on').click(function(){ 
        	error_password2 = false;
            error_fullname2=false;
            error_address2=false;
            error_email2=false;
            error_luong2 = false;
            error_phonenumber3=false;

         	function check_password2() {

         		var password2_length = $("#password2").val().length;

         		if(password2_length ==0) {
         			$("#password_error_message2").html("Please fill out this field");
         			$("#password_error_message2").show();
         			error_password2 = true;
         		} else if(password2_length < 8) {
         			$("#password_error_message2").html("At least 8 characters");
         			$("#password_error_message2").show();
         			error_password2 = true;

         		} else {
         			$("#password_error_message2").hide();
         		}
         	}
             
             function check_fullname2() {
         		var fullname2_length = $("#fullname2").val().length;

         		if(fullname2_length ==0) {
         			$("#fullname_error_message2").html("Please fill out this field");
         			$("#fullname_error_message2").show();
         			error_fullname2 = true;
         		} else if(fullname2_length < 5 || fullname2_length > 40) {
         			$("#fullname_error_message2").html("Must be between 5-40 characters");
         			$("#fullname_error_message2").show();      
         			error_fullname2 = true;
         		}
         		else
         		{
         			$("#fullname_error_message2").hide();
         		}

         	}
              function check_address2() {
         		var address2_length = $("#address2").val().length;

         		if(address2_length == 0) {
         			$("#address_error_message2").html("Please fill out this field");
         			$("#address_error_message2").show();
         			error_address2 = true;
         		} else if(address2_length < 5 || address2_length > 50) {
         			$("#address_error_message2").html("Must be between 5-50 characters");
         			$("#address_error_message2").show();      
         			error_address2 = true;
         		}
         		else
         		{
         			$("#address_error_message2").hide();
         		}

         	}
             
             function check_email2() {

         		var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
         	
         		if(pattern.test($("#email2").val())) {
         			$("#email_error_message2").hide();
         		} else {
         			$("#email_error_message2").html("Invalid email address");
         			$("#email_error_message2").show();
         			error_email2= true;
         		}
         	
         	}
             
             function check_luong2() {
         		var luong2_length = $("#luong2").val().length;
                 var filter = /^[0-9-+]+$/;
                 
                 if(luong2_length ==0) {
         			$("#luong_error_message2").html("Please fill out this field");
         			$("#luong_error_message2").show();
         			error_luong2 = true;
         		} else if(filter.test($("#luong2").val()) <1 ) {
                     $("#luong_error_message2").html("Please enter a valid digit");
                     $("#luong_error_message2").show();
                     error_luong2 = true;
                 } else if($("#luong2").val() < 1000 || $("#luong2").val() > 50000) {
         			$("#luong_error_message2").html("Must be between 1000-50000$");
         			$("#luong_error_message2").show();      
         			error_luong2 = true;
         		}
         		else
         		{
         			$("#luong_error_message2").hide();
         		}

         	}
    		check_password2();
            check_fullname2();
            check_phonenumber3();
            check_address2();
            check_email2();
            check_luong2();
    		
      
     		if(error_password2 == false && error_fullname2 == false &&
              error_phonenumber3 == false && error_address2 == false && error_email2 == false && error_luong2==false) {
                 document.getElementById("fullname2").disabled=true;
                 document.getElementById("password2").disabled=true;
                 document.getElementById("email2").disabled=true;
                 document.getElementById("address2").disabled=true;
                 document.getElementById("doB2").disabled=true;
                 document.getElementById("sex11").disabled=true;
                 document.getElementById("sex12").disabled=true;
                 document.getElementById("luong2").disabled=true;
                 document.getElementById("save_on").disabled=true;
                 document.getElementById("edit_on").disabled=false;
                 document.getElementById("phonenumber3").disabled=true;
                 
                 var sex=0;
         		if(document.getElementById('sex11').checked == true){
         	        		sex=0;
                 }else{
         	        		sex=1;
                 }
            	 $.post("act_User",{action: '6',studentID : $('#studentID2').val(),username2 : $('#username2').val(),password : $('#password2').val(),
             		fullName : $('#fullname2').val(),sex : sex,
                		doB : $('#doB2').val(),phoneNumber : $('#phonenumber3').val(),
                		email : $('#email2').val(),address : $('#address2').val(), salary: $('#luong2').val(),authorityID: $('#authorityID2').val()},
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
            		var birth2 = new Date(responseJson.doB); 
            			$("#studentID2").val(responseJson.userID);
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
                 	$("#luong2").val(responseJson.salary);
                 	$("#authorityID2").val(responseJson.authorityID);
                 	if(responseJson.sex==0){
                 		document.getElementById('sex11').checked=true;
                 	}
                 	else{
                 		document.getElementById('sex12').checked=true;
                 	}
         		           	 event.preventDefault();
         		           	
         	                
         	               
         		    });
            	 event.preventDefault(); // Important! Prevents submitting the form 

             }
             else {
                 alert("Xin vui lòng điền tất cả thay đổi.");
             }
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



   <!-- Phần chính: personal info y chang bên student -->
    <div class="info">
        <div class="container marketing lead">
            <div class="row">
               <div class="col">
                    <h2 class="text-center per_info">PERSIONAL INFORMATION</h2>
                </div>
                <div class="col">
                    <div class="col-auto text-center operation">
                        <button type="button" id="edit_on" class="btn btn-outline-success" style="width: 100px">Edit</button>
                        <button type="button" id="save_on" class="btn btn-outline-primary" style="width: 100px" disabled>Save</button>
                    </div>
                </div>
            </div>
            <hr>
            
            <form id="login_form_user2" class="was-validated" style="font-size: 19px">
                <div class="row featurette">
                    <div class="col-md-6">
                    	<div>
                            <span class="red_right" id=""></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">UserID:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="studentID" id="studentID2" placeholder="Full name" disabled>
                            </div>
                        </div>
                        
                        <div class="top_perinfo">
                            <span class="red_right" id="username_error_message2"></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">User name:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="username" id="username2" placeholder="Username" disabled>
                            </div>
                        </div>
                        
                       <div style="margin-bottom: 40px">
                            <span class="red_right" id="fullname_error_message2"></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Full name:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="fullName" id="fullname2" placeholder="Full name" disabled>
                            </div>
                        </div>
                        
                        <div class="top_perinfo">
                            <span class="red_right" id="password_error_message2"></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-3 col-form-label">Password:</label>
                            <div class="col-sm-9">
                                <input style="width:100%;height:85%;border-color:#d3d9df;" type="password" class="form-control" name="password" id="password2" placeholder="Password" disabled>
                            </div>
                        </div>
                        
                         <div class="top_perinfo">
                            <span class="red_right" id="email_error_message2"></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Email:</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" name="email" id="email2" placeholder="Email address" disabled>
                            </div>
                        </div>
                        
                        <div class="top_perinfo">
                            <span class="red_right" id="address_error_message2"></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Address:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="address" id="address2" placeholder="Current address" disabled>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6 ">
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Sex:</label>
                            <div class="custom-controls-stacked d-block col-sm-9">
                                <label class="custom-control custom-radio">
                                    <input id="sex11" name="sex" type="radio" class="custom-control-input"
                                    required value="0" disabled>
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Male</span>
                                </label>
                                <label class="custom-control custom-radio" style="margin-left: 50px;">
                                    <input id="sex12" name="sex" type="radio" class="custom-control-input"
                                    required value="1" disabled>
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">Female</span>
                                </label>
                            </div>

                        </div>
                        
                        <div class="top_perinfo">
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Date of bird:</label>
                            <div class="col-sm-9">
                                <input type="date" id="doB2" name="doB" class="form-control" disabled required>
                            </div>
                        </div>
                        
                        <div class="top_perinfo">
                            <span class="red_right" id="phonenumber_error_message3"></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Phone Number:</label>
                            <div class="col-sm-9">
                                <input style="margin-top:5px;" type="text" class="form-control" name="phonenumber" id="phonenumber3" placeholder="Mobie phone" disabled>
                            </div>
                        </div>
                        
                        <div class="top_perinfo">
                            <span class="red_right" id="luong_error_message2"></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Salary:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="salary" id="luong2" placeholder="Mobie phone" disabled>
                            </div>
                        </div>
                        
                        <div class="top_perinfo">
                            <span class="red_right" id=""></span>
                        </div>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">AuthorityID:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="authorityID" id="authorityID2" placeholder="Mobie phone" disabled>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
   
 	<script>
 	document.getElementById("edit_on").onclick = function Edit_Click() {//nhận vào object là mybutton
        //if(document.getElementById("input_on").disabled=true){
            document.getElementById("fullname2").disabled=false;
            document.getElementById("password2").disabled=false;
            document.getElementById("email2").disabled=false;
            document.getElementById("address2").disabled=false;
            document.getElementById("doB2").disabled=false;
            document.getElementById("phonenumber3").disabled=false;
            document.getElementById("sex11").disabled=false;
            document.getElementById("sex12").disabled=false;
            document.getElementById("luong2").disabled=false;
            document.getElementById("save_on").disabled=false;
            document.getElementById("edit_on").disabled=true;
        
        //}
    };
	$("#phonenumber_error_message3").hide();
    var error_phonenumber3 = false;
    $("#phonenumber3").focusout(function() {
 		check_phonenumber3();
 	});
    function check_phonenumber3() {
 		var phonenumber2_length = $("#phonenumber3").val().length;
 		var filter = /^[0-9-+]+$/;
 		if(phonenumber2_length ==0) {
 			$("#phonenumber_error_message3").html("Please fill out this field");
 			$("#phonenumber_error_message3").show();
 			error_phonenumber3 = true;
 		} else if(filter.test($("#phonenumber3").val()) < 1) {
             $("#phonenumber_error_message3").html("Please enter a valid digit");
             $("#phonenumber_error_message3").show();
  			error_phonenumber3 = true;
         } else if(phonenumber2_length < 10 || phonenumber2_length > 13) {
 			$("#phonenumber_error_message3").html("Must be between 10-13 characters");
 			$("#phonenumber_error_message3").show();      
 			error_phonenumber3 = true;
 		}
 		else
 		{
 			$("#phonenumber_error_message3").hide();
 		}

 	}
//     document.getElementById("save_on").onclick = function Save_Click() {
    	
   	 
        
    	
     	
		 
//     }
   
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