<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<title>About Us</title>
		<link rel="shortcut icon" href="image/logoh.ico" sizes="196x196" type="image/x-icon" />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css">



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                <style>
                        .main-heading{width:100%; text-align:center; color:red; margin:60px;}
                        .img-box img{width:100%;border-radius: 10px}
                        .main{display:block; overflow:hidden;}
                        .text-block{display:block; color:#000;}
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

<% if(session.getAttribute("userId")==null){ %>
		<%@include file="main_header.jsp" %>
		<%}else{ %>
		<%@include file="user_header.jsp" %>
		<%} %>
                
<section class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-6"> 
                <div class="img-box wow fadeInUp" data-wow-duration="2s">
            <img src="image/main.png">
        </div>
    </div>
    
    <div class="col-md-6">
        <div class="text-block wow fadeInUp" data-wow-duration="2s">
            <h2 style="color:#7B113A">Health care channeling</h2>
                <p >Health care channeling led by Digital Health Private Limited is Sri Lanka's pioneering digital healthcare solution pr
                    ovider, offering medical services to subscribers at the convenience of their mobile phone and website.
                </p>
        </div>
    </div>
 </div>
    
</div>
    
</section>
<section class="main bg-t">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
        <div class="img-box  wow fadeInUp" data-wow-duration="2s">
           <img src="https://cdn.pixabay.com/photo/2014/12/10/21/01/doctor-563428_960_720.jpg">
        </div>
        </div>
    
       <div class="col-md-4">
        <div class="img-box  wow fadeInUp" data-wow-duration="2s">
           <img src="https://cdn.pixabay.com/photo/2021/12/02/22/15/x-ray-6841384_960_720.jpg">
        </div>
        </div>
    <div class="col-md-4">
        <div class="img-box  wow fadeInUp" data-wow-duration="2s">
           <img src="https://cdn.pixabay.com/photo/2016/11/08/05/29/surgery-1807541_960_720.jpg">
        </div>
    </div>
        </div>
    
</div>
    
</section>
<section class="main">
    <div class="container">
        <div class="row">
         <div class="col-md-6">
             
        <div class="text-block wow fadeInUp" data-wow-duration="2s">
            <h2 style="color:#7B113A">Our Vision</h2>
            <p>Provide best available health care facilities as much as closer to world class level at affordable prices..</p>
            <h2 style="color:#7B113A">Our Mission</h2>
            <p>Provide best available health care facilities, as much as closer to world class standard  within a multi storied  modern building
                complex through well qualified, friendly and disciplined staff using state of art equipment. It is our goal for everybody
                who come to our care to feel that they are treated friendly
                and equally at highest standard, finally they are happy that they got best facilities  with affordable comfort.</p>
        </div>
    </div>
     <div class="col-md-6"> 
        <div class="img-box  wow fadeInUp" data-wow-duration="2s">
            <img src="https://cdn.pixabay.com/photo/2014/12/10/21/01/doctor-563429_960_720.jpg">



        </div>
    </div>
        </div>
    
</div>
    
</section>
		
		
		<%@include file="footer.jsp" %>
</body>
</html>