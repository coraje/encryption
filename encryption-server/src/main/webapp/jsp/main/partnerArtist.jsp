<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script type="text/javascript">

window.onload=function(){ dancer() }

function dancer() {
	
	 $('#dancer').show();
	 $('#musician').hide();

}
function musician() {
	 
	 $('#dancer').hide();
	 $('#musician').show();

}

function check_only(chk){
    var obj = document.getElementsByName("artist");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
</script>

<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>협력아티스트</strong></h2>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="artist" style="vertical-align: -1px" onclick="javascript:dancer()" checked />DANCE&nbsp;&nbsp;
		<input type="radio" name="artist" style="vertical-align: -1px" onclick="javascript:musician()"/>MUSIC
		</h3>
		<div id="dancer" class="combine">
			<h3>통째로 빌렸다와 함께하는 아티스트입니다.</h3>
			<ul class="thumb_list02">
			<li>
				<p><img src="./images/sub/artist_earthquake.jpg" alt="EarthQuake" /></p>
				<dl>
					<dt><strong>EarthQuake</strong><span><a href=# onclick="window.open('https://www.facebook.com/street.eq');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('https://www.facebook.com/street.eq');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>- 2012년 頂點 Vol.1 , Vol.2 스트릿 댄스 배틀</dd>
					<dd>- 2013년 SHOW ZONE Vol.1 퍼포먼스 오디션</dd>
					<dd>- 2013년 MOVE THE STREET 2013 자유로운 거리공연</dd>
					<dd>- 2013년 CONTACT THE SOUL Vol.4 스트릿 콘서트</dd>
					<dd>- 2013년 포천 오뚜기 한마음 축제 참가</dd>
					<dd>- 2013년 頂點 Vol.3 스트릿 댄스 배틀</dd>
					<dd>- 2013년 고양호수예술축제 60인의 아티스트</dd>
					<dd>- 2013년 광화문 차 없는 거리 “혈액형 올림픽 혈액형 댄스배틀”</dd>
				</dl>
			</li>
			<li>
				<p><img src="./images/sub/artist_justjerk.jpg" alt="JUST JERK" /></p>
				<dl>
					<dt><strong>JUST JERK</strong><span><a href=# onclick="window.open('https://www.facebook.com/JustJerk122411');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('http://youtu.be/vygt_exbhIA');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>- 데프댄스스쿨 및 Urban Play dance Academy 외<br/>다수의 댄스아카데미 전,현직 강사</dd>
					<dd>- 서울공연예술 고등학교, 한림연예예술 고등학교 강사</dd>
					<dd>- 2009년 이후 22개 대회 참가 및 심사</dd>
					<dd>- 티아라, 인피니트 등 안무</dd>
					<dd>- 스타킹, 슈퍼스타k(트레이너) 등 출연</dd>
					<dd>- JYP 등 엔터테인먼트 트레이너</dd>
				</dl>
			</li>
			<li>
				<p><img src="./images/sub/artist_joywaackqueen.jpg" alt="JOY WAACKQUEEN" /></p>
				<dl>
					<dt><strong>JOY WAACKQUEEN</strong><span><a href=# onclick="window.open('https://www.facebook.com/waackqueen');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('http://www.youtube.com/embed/aYZGVLxqigg?feature=player_detailpage');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>- 2013 Singapore Floor the Love waacking workshop.</dd>
					<dd>- 2013 under ground session “Born to be garbo” guest show.</dd>
					<dd>- 2013 Pride of waack in busan judge.</dd>
					<dd>- 2013.Battle donation vol.1 Guest Show. (Born to be gab)</dd>
					<dd>- 2013.the Track vol.5 (House music) Judge.</dd>
					<dd>- 2013.China AllElementz studio special workshop.</dd>
					<dd>- 2014.Hongkong Choreography & waacking special workshop.</dd>
				</dl>
			</li>
			<li>
				<p><img src="./images/sub/artist_waacker.jpg" alt="Waacker O's" /></p>
				<dl>
					<dt><strong>Waacker O's</strong><span><a href=# onclick="window.open('https://www.facebook.com/waacker.os');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('http://youtu.be/4_WiT8l8WL0');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>- 2012 정점 vol.1 winner</dd>
					<dd>- 2013 Street universiade vol.1 winner</dd>
					<dd>- 2013 Street All-round Championship vol.1 winner</dd>
					<dd>- 2013 슈퍼댄서K winner</dd>
					<dd>- 2013 AZAR vol.3 winner</dd>
					<dd>- 2013 UDA 일반부 hiphop 금상</dd>
					<dd>- 前 코어 컨텐츠 ENT 연습생 안무지도 강사</dd>
					<dd>- 現 Earthquake, Waacking assassin, Royalty waackers 활동</dd>
				</dl>
			</li>
			<li>
				<p><img src="./images/sub/artist_funkylia.jpg" alt="Funky lia" /></p>
				<dl>
					<dt><strong>Funky lia</strong><span><a href=# onclick="window.open('https://www.facebook.com/BGirlFunkyLia');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('http://youtu.be/3aKgXXIV6ns');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>- 2007년 제1회 4DA 넥스트레벨 세계대회 락킹부문 우승</dd>
					<dd>- 2007년 UK 비보이챔피언십 팝핀부문 준우승</dd>
					<dd>- 2008년 팝락 레이디스 팝핀부문 우승</dd>
					<dd>- 2008년 제2회 4DA 넥스트 레벨 세계대회 락킹부문 준우승,<br/>팝핀부문 우승</dd>
					<dd>- 스트릿 댄서로 시작해 세계 유명 댄스경연대회에서 수차례입상,<br/>이효리 춤선생으로 SBS 스타킹에 출연해 큰 화제를 모음</dd>
				</dl>
			</li>
			</ul>
		</div>
		
		<div id="musician" class="combine">
			<h3>통째로 빌렸다와 함께하는 아티스트입니다.</h3>
			<ul class="thumb_list02">
			<li>
				<p><img src="./images/sub/찰떡궁합사운드.png" alt="찰떡궁합사운드" /></p>
				<dl>
					<dt><strong>찰떡궁합사운드</strong><span><a href=#><a href=# onclick="window.open('https://www.facebook.com/chalgoongsa');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('https://www.youtube.com/channel/UCJQVKasD-BrEpt6Q_f-Yw5g');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>홍대와 분당을 중심으로 부드러운 목소리와 감미로운 기타연주를 들려주는 어쿠스틱 듀오</dd>
					<dd>- 리더 / 보컬 / 멜로디언 : 영덕</dd>
					<dd>- 기타 / 피아노 / 코러스 : 이형</dd>
				</dl>
			</li>
			<li>
				<p><img src="./images/sub/규목.png" alt="규목" /></p>
				<dl>
					<dt><strong>규목</strong><span><a href=#><a href=# onclick="window.open('https://www.facebook.com/kyumock');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('https://www.youtube.com/channel/UCJQVKasD-BrEpt6Q_f-Yw5g');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>꾸며지지 않은 소리로 평범하지만 특별한 이야기를 들려주는 싱어송라이터</dd>
					<dd>- 기타 / 노래 : 규목</dd>
				</dl>
			</li>
			<li>
				<p><img src="./images/sub/여자둘피리피그.png" alt="여자둘 피리피그" /></p>
				<dl>
					<dt><strong>여자둘 피리피그</strong><span><a href=# onclick="window.open('https://www.facebook.com/twoladys.pilypig');"><img src="./images/sub/btn_pagelink.png" alt="관련페이지보기" /></a><a href=# onclick="window.open('https://www.youtube.com/channel/UCJQVKasD-BrEpt6Q_f-Yw5g');"><img src="./images/sub/btn_vodview.png" alt="대표영상보기" /></a></span></dt>
					<dd>3인으로 구성되어 있는 밴드로써 아이리쉬 음악과 아기자기한 곡들로 사람들에게 희망과 즐거움을 이야기하는 밴드</dd>
					<dd>- 아이리쉬 휘슬 / 퍼커션 : 박지언</dd>
					<dd>- 바이올린 : 이선미</dd>
					<dd>- 피아노 : 이선화</dd>
				</dl>
			</li>
			</ul>
		</div>
		
		<p class="c_both"></p>
	</div>
	<!-- //container -->