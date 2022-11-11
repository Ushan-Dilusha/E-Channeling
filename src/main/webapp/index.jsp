<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home</title>
		<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
                 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css">
                <style>.background{background:url(https://deedmed.lk/wp-content/uploads/2022/07/young-handsome-physician-medical-robe-with-stethoscope-1-2048x1366.jpg); background-repeat: no-repeat; background-size: cover; background-position:top center}
                        .main-heading{width:100%; text-align:center; color:red; margin:60px;}
                        .img-box img{width:100%;}
                        .main{display:block; overflow:hidden;}
                        .text-block{display:block; color:#fff;}
                        .text-block h2{color:red;}
                        .main{padding:100px 0; width:100%; overflow:hidden;}
                        .main.bg-t{width:100%; background:rgba(255, 255, 255, 0.2); padding:120px 0;}
                </style>
                <script>   wow = new WOW(
      {
        animateClass: 'animated',
        offset:       100,
        callback:     function(box) {
          console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
        }
      }
    );
    wow.init();
    document.getElementById('moar').onclick = function() {
      var section = document.createElement('section');
      section.className = 'section--purple wow fadeInDown';
      this.parentNode.insertBefore(section, this);
    };</script>

	</head>
	<body>
		<% if(session.getAttribute("userId") == null){ %>
	<%@include file="main_header.jsp" %>
	<%}else{ %>
	<%@include file="user_header.jsp" %>
	<%} %>
		
                <!--new-->
                <section class="main background" style="min-height:100vh">
    <div class="container">
        <div class="row">
         <div class="col-md-6">
             
             <div class="text-block wow fadeInUp" data-wow-duration="2s">
                 <h1 class="display-5"> Check the Ongoing Number of your doctor session when you place your appointment with <a href="index.jsp" class="text-light" style=" text-decoration:none;">Healthcare</a></h1>
        </div>
    </div>
        </div>
    
</div>
    
</section>
                <!--end-->
                
		<div class="container"></div>
		<%@include file="footer.jsp" %>
	</body>
</html>