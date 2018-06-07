<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    *{
        font-family: 'Jua', sans-serif;
    }
    #body{
    	width: 100%;
    }
    /*↓메뉴 관련*/
    #header{
        width: 20%;
        height: 50px;
    }
    .logo{
        width: 100%;
    }
	#header,#nav{
		float: left;
	}

	#nav{
		height: 50px;
		width: 75%;
        margin-left: 25px;
		margin-top: 25px;
	}
	#nav ul{
		list-style-type: none;
		margin: 0px;
		padding: 0px;
	}
	#menu{
        width: 70%;
        position: relative;
        z-index: 1;
    }
    /*↓로그인 메뉴쪽*/
    #login{
        width: 25%;
        height: 50px;
        display: inline-block;
        text-align: center;
    }
    .in{
        text-decoration: none;
        color: black;
        line-height: 50px;
        vertical-align: middle;
        font-size: 20px;
    }
    /*↑로그인 메뉴쪽*/
	#nav ul li{
		float: left;
		line-height: 50px;
		vertical-align: middle;
		text-align: center;
		position: relative;
	}
	.submenuLink, .topmenuLink{
		text-decoration: none;
		display: block;
		width: 160px;
		font-size: 20px;
		font-weight: bold;
	}
	.topmenuLink{
		color: black;
		font-size: 26px;
	}

	.topmenu:hover .topmenuLink{
		padding-bottom: 28px;
		border-bottom:3px solid black;
	}


	.longlink{
		width: 200px;
	}

	.submenuLink{
        color: black;
		background-color: white;
		border: 2px solid lightgray;
		border-radius: 3px;
	}
	.submenu{
		position: absolute;
		height: 0px;
		overflow: hidden;
		width: 800px;
	}
	.submenu li{
		display: inline-block;
	}
	.topmenu:hover .submenu{
		height: 70px;
	} 
	.submenuLink:hover {
		color: lightgray;
	}
    /*↑메뉴 관련*/
	.bar{
		border: 1px solid lightgray;
		margin: 0px;
		padding: 0px;
	}
    /*↓풋터 관련*/
    #footer{
        width: 100%;
        height: 100px;
        display: block;
    }
    .footer1{
        width: 15%;
        display: inline-block;
    }
    .footer2{
        width: 10%;
       display: inline-block;
    }
    .footer3{
        width: 55%;
         display: inline-block;
    }
    .footer4{
        width: 15%;
         display: inline-block;
    }
    .footerlogo{
        width:100%;
        float:left;
        padding-bottom: 10px;
    }
    /*↑풋터 관련*/
    /*↓article(내용) 관련*/
    #article{
    	width: 100%;
    }
    #container{
    	width: 1080px;
    	margin: 0px auto;
    }
    /*↑article(내용) 관련*/
    /*↓navigator(뎁스) 관련*/
    .navigator{
    	font-size: 20px;
    }
    /*navigator(뎁스) 관련*/
</style>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="js/css/jquery.bxslider.min.css"/>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.slider').bxSlider({
		    auto: true,
		    captions: false,
		    slideWidth: 960,
		    speed: 400,
		    minSlides:1,
		    maxSlides:1,
		    moveSlides:1,
		    controls: false,
		    autoControls: true
		  });
	});
</script>
</head>
<body>
	<div id="body">
	<header id="header">
		<a href="#"><img src="img/main/logo.png" class="logo"></a>
	</header>
	<nav id="nav">
		<ul id="menu">
			<li class="topmenu"><a href="#" class="topmenuLink">학원소개</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink">개요</a></li>
					<li><a href="#" class="submenuLink">인사말</a></li>
					<li><a href="#" class="submenuLink longlink">찾아오시는길</a></li>
					<li><a href="#" class="submenuLink">교수진소개</a></li>
				</ul>
			</li>
			<li class="topmenu"><a href="#" class="topmenuLink">강의소개</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink">강의목록</a></li>
					<li><a href="#" class="submenuLink">수강후기</a></li>
				</ul>
			</li>
			<li class="topmenu"><a href="#" class="topmenuLink">상담신청</a></li>
			<li class="topmenu"><a href="#" class="topmenuLink">취업센터</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink longlink">취업프로세스</a></li>
					<li><a href="#" class="submenuLink">취업정보</a></li>
					<li><a href="#" class="submenuLink">취업현황</a></li>
				</ul>
			</li>
			<li id="mymenu" class="topmenu"><a href="#" class="topmenuLink">내 메뉴</a></li>
		</ul>
		<div id="login">
			<span><a href="#" class="login in">로그인</a></span>
			<span class="login in">&nbsp;&#124;&nbsp;</span>
			<span><a href="#" class="join in">회원가입</a></span>
		</div>
	</nav>
	<!--탭 네비게이션-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr class="bar"/>
		<span class="navigator"> 홈 > 학원소개 > 교수진소개</span>
	<hr class="bar"/>
	<!--탭 네비게이션 끝-->
	<!--내용시작-->
	<article id="article">
		<br>
		<br>
		<br>
		<div id="container">
			<div>
				<img alt="teacher1" src="../img/intro/teacher1.png">
			</div>
			<div>
				<img alt="teacher2" src="../img/intro/teacher2.png">
			</div>
			<div>
				<img alt="teacher3" src="../img/intro/teacher3.png">
			</div>
		</div>
    </article>
    <!--내용끝-->
    <footer id="footer">
      <div class="footer1">
      </div>
      <div class="footer2">
          <img src="img/main/logo.png" class="footerlogo">
      </div>
      <div id="address" class="footer3">
          <address id="address">
          비트캠프 서울시 서초구 서초동 1327-15 비트아카데미빌딩사업자등록번호 : 214-85-24928 ┃ (주)비트컴퓨터 서초지점 대표이사 : 조현정
            <br>문의 : 02-3486-9600 / 팩스 : 02-6007-1245 ┃통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 권도혁
            <br>Copyright (c) 비트캠프 All rights reserved.
         </address>
      </div>
      <div class="footer4">
      </div>
    </footer>
    </div>
</body>
</html>