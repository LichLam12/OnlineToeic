<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!-- Cài đặt Font Awesome-->
    <link rel=”stylesheet” href=”https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css” />

    <!-- Icon của button login -->
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
       <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
   
      
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
//         $(document).ready(function(){
//         	alert("aaa");

//         	$('#btn_login').click(function(){
//         		alert("nb");
//         	$.post("LoginController",{username : $('#username').val(),password : $('#password').val()},
//            		function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
	 
//      		    	});
//             });  
        	
        	
//         	$('#btn_register').click(function(){
//         		var sex=0;
//         		if(document.getElementById('sex11').checked == true){
//    		        		sex=0;
// 		        }else{
//    		        		sex=1;
// 		        }
//            	 $.post("LoginController",{action: '2',username : $('#username2').val(),password : $('#password2').val(),
//            		fullName : $('#fullname2').val(),sex : sex,
//            		doB : $('#doB2').val(),phoneNumber : $('#phonenumber2').val(),
//            		email : $('#email2').val(),address : $('#address2').val()},
//            		function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
	 
//      		    });
//             });  
 
//         }); 
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
					<a class="nav-link" href="#about">ABOUT</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#classes">CLASSES</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#news">NEWS</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="LoginController?username=${perinfo.username }&password=${perinfo.password }">ACCOUNT</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#contact">CONTACT</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="HomeForward">LOG OUT</a>
				</li>
				<!--<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="http://example.com/" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu" aria-labelledby="dropdown03">
						<a class="dropdown-item" href="https://getbootstrap.com/docs/4.0/examples/navbars/#">Action</a>
						<a class="dropdown-item" href="https://getbootstrap.com/docs/4.0/examples/navbars/#">Another action</a>
						<a class="dropdown-item" href="https://getbootstrap.com/docs/4.0/examples/navbars/#">Something else here</a>
					</div>
				</li>
				-->
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

    <!-- Banner -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="" src="Style/images/banner/banner1.jpg" alt="First slide">

				<div>
					<div class="d-none d-md-block" id="banner">
						<h2>Wellcome to</h2>
						<h1 id="title">MONGGOGO! TOEIC</h1>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="" src="Style/images/banner/banner2.jpg" alt="Second slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Native teachers</h1>
						<p>There are perceptions that native speakers of English make better English language teachers. Marek Kiczkowiak , winner of the TeachingEnglish blog award, argues that those perceptions need to change..</p>
						<p><a class="btn btn-lg btn-primary" href="" role="button">Learn more</a></p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="" src="Style/images/banner/banner3.jpg" alt="Third slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Native teachers</h1>
						<p>There are perceptions that native speakers of English make better English language teachers. Marek Kiczkowiak , winner of the TeachingEnglish blog award, argues that those perceptions need to change..</p>
						<p><a class="btn btn-lg btn-primary" href="" role="button">Learn more</a></p>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
		<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
	</div>
    

    <!-- About us -->
    <div id="about" class="container marketing" style="margin-top: 50px;">
        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading" style="padding: 50px 0">Teachers hall of frame.</h2>
                <p class="lead">Monggogo Toeic is the leader in the English Language Training (ELT) industry in Vietnam with millions of learners enrolling for its English courses since its foundation.</p>
                <p class="lead">Monggogo Toeic has built up the biggest ELT staff in Vietnam with more than 1,350 highly qualified, experienced, dedicated teachers and teaching assistants. Among the teachers, 45% possess a Master’s or Ph.D. degree.</p>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-fluid mx-auto" style="width: 500px; height: 500px;" src="Style/images/teacher1.jpg" data-holder-rendered="true">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading" style="padding: 50px 0">Educational Oppotunities.</h2>
                <p class="lead">Monggogo Toeic has diverse educational oppotunities. We offer a full range of English courses from basic TOEIC to advanced levels. </p>
                <p class="lead">These include General English, Examination Preparation, Overseas Study Preparation and courses specifically designed to meet the needs pf professional working adults.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <img class="featurette-image img-fluid mx-auto" style="width: 500px; height: 500px;" src="Style/images/educational.jpg" data-holder-rendered="true">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading" style="padding: 50px 0">Teaching methods.</h2>
                <p class="lead">With research and understanding of learner psychology, we have been helping thousands of students overcome obstacles to becoming bold in Talking (Open English), Open Emotion (self-expression), Motivation (motivation), Emotion.</p>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-fluid mx-auto" style="width: 500px; height: 500px;" src="Style/images/methods.jpg" data-holder-rendered="true">
            </div>
        </div>
    </div>


    <!-- Classes -->
    <div id="classes">
        <div class="container marketing lead">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Classes</h2>
                    <b>Basic English communication:</b>
                    <p>Tuesday, Thursday (19:00 - 21:00) - Classroom 1</p>
                    <b>English communication work:</b>
                    <p>Monday, Wednesday, Friday (19:00 - 21:00) - Classroom 2</p>
                    <b>Toeic 700+:</b>
                    <p>Saturday, Sunday (17:00 - 19:00) - Classroom 4</p>
                    <b>Toeic speaking 110+:</b>
                    <p>Saturday, Sunday (19:00 - 21:00) - Classroom 5</p>
                    <a href="ForwardToClasses?username=${perinfo.username }"><h5>See more. . .</h5></a>
                </div>
                <div class="col-sm-3">
                    <h2>Benefits</h2>
                    <p></p>
                    <p><i class="fa fa-check" aria-hidden="true"></i>Free resources</p>
                    <p><i class="fa fa-check" aria-hidden="true"></i>Study every time and everywhere</p>
                    <p><i class="fa fa-check" aria-hidden="true"></i>Exclusive Monggogo software</p>
                    <p><i class="fa fa-check" aria-hidden="true"></i>Correct vocabulary</p>
                </div>
                <div class="col-sm-3">
                    <h2>Teachers</h2>
                    <p><img src="Style/images/teams/team-1.png"> Mr. Lich Lam</p>
                    <p><img src="Style/images/teams/team-2.png"> Mr. Phuc</p>
                    <p><img src="Style/images/teams/team-3.png"> Ms. Hieu</p>
                </div>
            </div>

        </div>
    </div>


    <!-- News -->
    <div id="news">
        <div class="container marketing text-center lead">
            <img src="Style/images/news.png" height="60px">
            <hr>
            <div class="new">
                <h3>Opportunity to receive valuable rewards</h3>
                <p>Take a free qualification test and have the opportunity to receive up to VND 5 million in prize money when scoring high</p>

                <p>TIME REMAINING...</p>
                <div id="clockdiv">
                    <div>
                        <span class="days"></span>
                        <div class="smalltext">Days</div>
                    </div>
                    <div>
                        <span class="hours"></span>
                        <div class="smalltext">Hours</div>
                    </div>
                    <div>
                        <span class="minutes"></span>
                        <div class="smalltext">Minutes</div>
                    </div>
                    <div>
                        <span class="seconds"></span>
                        <div class="smalltext">Seconds</div>
                    </div>
                </div>

                <script src="Style/js/countdown-clock.js"></script>
            </div>
            <!-- Three columns of text below the carousel -->
            <div class="row" style="margin-top: 60px">
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded float-left">
                    <div class="dtl05">
                        <img src="Style/images/blog/new1.jpg" alt="" class="rounded float-left">
                        <a href="ForwardToNews?username=${perinfo.username }"><div class="dtl">
                            <h3>Opening MongGOGO TOEIC 24/7</h3>
                            <p>By John Lam.</p>
							</div></a>
                    </div>
                </div>
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded mx-auto d-block">
                    <div class="dtl05">
                        <img src="Style/images/blog/new2.jpg" alt="">
                        <a href="ForwardToNews?username=${perinfo.username }"><div class="dtl">
                            <h3>BUSINESS IN BRIEF 26/12</h3>
                            <p>By John Doe.</p>
							</div></a>
                    </div>
                </div>
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded float-right">
                    <div class="dtl05">
                        <img src="Style/images/blog/new3.jpg" alt="">
                        <a href="ForwardToNews?username=${perinfo.username }"><div class="dtl">
                            <h3>Social News 26/12</h3>
                            <p>By John Doe.</p>
							</div></a>
                    </div>
                </div>
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded float-right">
                    <div class="dtl05">
                        <img src="Style/images/blog/new4.jpg" alt="">
                       <a href="ForwardToNews?username=${perinfo.username }"> <div class="dtl">
                            <h3>Visiting a 150-year-old pink church in Saigon</h3>
                            <p>By John Doe.</p>
						   </div></a>
                    </div>
                </div>
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded float-left">
                    <div class="dtl05">
                        <img src="Style/images/blog/new5.jpg" alt="" class="rounded float-left">
                      <a href="ForwardToNews?username=${perinfo.username }">  <div class="dtl">
                            <h3>What's on December 25-31</h3>
                            <p>By John Doe.</p>
						  </div></a>
                    </div>
                </div>
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded mx-auto d-block">
                    <div class="dtl05">
                        <img src="Style/images/blog/new6.jpg" alt="">
                    <a href="ForwardToNews?username=${perinfo.username }">    <div class="dtl">
                            <h3>What's on December 25-31</h3>
                            <p>By John Doe.</p>
						</div></a>
                    </div>
                </div>
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded float-right">
                    <div class="dtl05">
                        <img src="Style/images/blog/new7.jpg" alt="">
                      <a href="ForwardToNews?username=${perinfo.username }">  <div class="dtl">
                            <h3>Merry Christmas Festival 24/12</h3>
                            <p>By John Doe.</p>
						  </div></a>
                    </div>
                </div>
                <div class="item col-lg-3 col-sm-4 col-xs-6 rounded float-right">
                    <div class="dtl05">
                        <img src="Style/images/blog/new8.jpg" alt="">
                    <a href="ForwardToNews?username=${perinfo.username }">    <div class="dtl">
                            <h3>Happy Valentine with MongGOGO TOEIC</h3>
                            <p>By John Doe.</p>
						</div></a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Follow -->
   <div id="follow">
        <div class="container marketing text-center lead">
            <img src="Style/icon/logo.png">
            <h1 class="w3-container w3-center w3-animate-zoom">STAY CONNECTED WITH US</h1>
            <p>Let your email address now to subscribe to the latest news from Monggogo Toeic!</p>


            <div id="mc_embed_signup">
                <form class="validate form" id="mc-embedded-subscribe-form" action="" method="post" name="mc-embedded-subscribe-form" target="_blank" novalidate>
                    <div id="mc_embed_signup_scroll">
                <!--
                        <div class="clear" id="mce-responses">
                            <div class="response" id="mce-error-response" style="display: none;"></div>
                            <div class="response" id="mce-success-response" style="display: none;"></div>
                        </div>
                        <div style="position: absolute; left: -5000px;" aria-hidden="true">
                            <input type="text" name="" tabindex="-1" value="">
                        </div>
                -->
                        <div class="mc-field-group">
                            <input class="input required email" id="content_send" type="email" value="" name="" placeholder="Enter your email address"><input class="button send_follow" id="mc-embedded-subscribe" type="button" value="Send" name="subscribe">
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>





    <!-- Footer -->
    <footer id=contact>
        <div class="splitter"></div>
        <ul>
            <li>
                <div class="text">
                    <h4>MONGGOGO TOEIC</h4>
                    <div>
                        <p class="lead"><i class="fa fa-map" aria-hidden="true"></i>Address: 1040 Vo Van Ngan, Thu Duc District, HCMC</p>
                        <p class="lead"><i class="fa fa-address-book" aria-hidden="true"></i>Phone: (088) 6677022</p>
                        <p class="lead"><i class="fa fa-envelope-open" aria-hidden="true"></i>Email: monggogotoeic@edu.vn</p>
                        <a href="#">Read more...</a></div>
                </div>
            </li>

            <li>
                <div class="text">
                    <h4>SOCIAL</h4>
                    <p class="lead social-icons">Connect us:
                        <a href="https://www.facebook.com/" target="_blank"> <i class="fa fa-facebook-square" ></i></a>
                        <a href="https://twitter.com/?lang=vi/" class="tw" target="_blank"> <i class="fa fa-twitter-square"></i></a>
                        <a href="" class="rs"> <i class="fa fa-rss-square" target="_blank"></i></a>
                        <a href="https://www.youtube.com/" class="yt" target="_blank"> <i class="fa fa-youtube-square"></i></a>
                        <a href="https://www.linkedin.com/" class="li" target="_blank"> <i class="fa fa-linkedin-square"></i></a>
                        <a href="https://plus.google.com/discover?hl=vi/" class="gp" target="_blank"> <i class="fa fa-google-plus-square"></i></a>
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
              //Nút send ở phần Follow trang chủ
    document.getElementById("mc-embedded-subscribe").onclick=function send_follow() {

		var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
	
		if(pattern.test($("#content_send").val())) {
                alert("Email đã được gửi xác nhận.");
		} else {
            alert("Địa chỉ email không hợp lệ.");
		}
	
	}  
    </script>





    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./Carousel Template for Bootstrap_files/jquery-3.2.1.slim.min.js.download" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script>
          window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>') 
     </script> 
    <script src="./Carousel Template for Bootstrap_files/popper.min.js.download"></script>
    <script src="./Carousel Template for Bootstrap_files/bootstrap.min.js.download"></script>
<!--     Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="./Carousel Template for Bootstrap_files/holder.min.js.download"></script>
<!--     IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./Carousel Template for Bootstrap_files/ie10-viewport-bug-workaround.js.download"></script>
</body>
</html>