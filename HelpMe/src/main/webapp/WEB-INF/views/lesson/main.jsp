<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
   .music-image {
      background-image: url( "/helpme/resources/images/music.jpg" );
      background-size: cover; width: 100%; height: 200px;background-repeat:no-repeat;background-position:center;
   	  border-top-left-radius:10px; border-top-right-radius:10px;
   }

   .license-image {
      background-image: url( "/helpme/resources/images/license.jpg" );
      background-size: cover; width: 100%; height: 200px;background-repeat:no-repeat;background-position:center;
  	   border-top-left-radius:10px; border-top-right-radius:10px;
   }

   .study-image {
      background-image: url( "/helpme/resources/images/study.jpg" );
      background-size: cover; width: 100%; height: 200px;background-repeat:no-repeat;background-position:center;	  
  	   border-top-left-radius:10px; border-top-right-radius:10px;
   }
    .sports-image {
      background-image: url( "/helpme/resources/images/sports.jpg" );
      background-size: cover; width: 100%; height: 200px;background-repeat:no-repeat;background-position:center;	  
   	   border-top-left-radius:10px; border-top-right-radius:10px;
   }
     .school-image {
      background-image: url( "/helpme/resources/images/school.jpg" );
      background-size: cover; width: 100%; height: 200px;background-repeat:no-repeat;background-position:center;	  
   	  border-top-left-radius:10px; border-top-right-radius:10px;
   }
     .kitchen-image {
      background-image: url( "/helpme/resources/images/kitchen.jpg" );
      background-size: cover; width: 100%; height: 200px;background-repeat:no-repeat;background-position:center;	  
   	  border-top-left-radius:10px; border-top-right-radius:10px;
   }
	.total-image-first{
	display:flex;	
	justify-content:space-between;
	margin-bottom:60px;
	margin-top:80px;

	}
	.music-body,.license-body,.study-body,.sports-body,.school-body,.kitchen-body{
	width: 32%;
	 background-color : #fff ;
	  box-shadow: 0 10px 40px rgba(0,0,0,0.1);
	   border-radius:10px;
	   position:relative;
		top:0;
		transition: top 0.3s
	}
	
	.music-body:hover,.license-body:hover,.study-body:hover,.sports-body:hover,.school-body:hover,.kitchen-body:hover {
		top: -10px;
	}
	
	.title{
	text-align:center;
	}
	
	.total-image-second{
	display:flex;	
	justify-content:space-between;
	margin-bottom:80px;
	
	}
	.main-section-lesson {
	width: 1200px;
	margin: 35px auto;
	position: relative;
	left: 0;
	top: 0;
	}

	.button-box{
	width: 1200px;
	display: flex;
	flex-direction: row-reverse;
	}
	
	
}
   </style>
<div class="main-section-lesson">
<div  class="button-box">
	<c:if test="${ member.state eq '1' }">
	<button class="btn btn-info lessonlist" onclick="location.href='/helpme/lesson/reqlist.action?id=${id}'">내 요청목록</button>
	</c:if>
	<c:if test="${  member.state eq '2' }">
	<button class="btn btn-info lessonlist" onclick="location.href='/helpme/lesson/reqlistcheck.action'">내 신청목록</button>
	</c:if>
</div>
<div class="total-image-first">
	<div class="music-body" onclick="location.href='/helpme/lesson/subject.action?kind=악기'">
	<div class="music-image"></div>
	<h4 class="title">악기</h4>
	<input type="hidden" value="music" name="music">
	</div>
	<div class="license-body" onclick="location.href='/helpme/lesson/subject.action?kind=자격증'">
	<div class="license-image"></div>
	<h4 class="title">자격증</h4>
	</div>
	<div class="study-body" onclick="location.href='/helpme/lesson/subject.action?kind=학업'">
	<div class="study-image"></div>
	<h4 class="title">학업</h4>
	</div>
	</div>
<div class="total-image-second" >
	<div class="sports-body" onclick="location.href='/helpme/lesson/subject.action?kind=스포츠'">
	<div class="sports-image"></div>
	<h4 class="title">스포츠</h4>
	</div>
	<div class="school-body" onclick="location.href='/helpme/lesson/subject.action?kind=외국어'">
	<div class="school-image"></div>
	<h4 class="title">외국어</h4>
	</div>
	<div class="kitchen-body" onclick="location.href='/helpme/lesson/subject.action?kind=요리'">
	<div class="kitchen-image"></div>
	<h4 class="title">요리</h4>
	</div>
</div>

</div>  