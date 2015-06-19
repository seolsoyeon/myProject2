<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.card-container.card {
    max-width: 350px;
    padding: 40px 40px;
}
.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}
/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}
.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin #inputEmail,
.form-signin #inputPassword {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}
.form-signin input[type=email],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}
.btn.btn-signin {
    /*background-color: #4d90fe; */
    /* background-color: rgb(104, 145, 162); */
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}
/* .btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
} */
.forgot-password {
    color: rgb(104, 145, 162);
}
.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}
</style>

<!-- Sidebar -->
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
		<c:choose>
			<c:when test="${empty user.role}">
			<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
					Log In<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="#login" data-toggle="modal">로그인</a></li>
					<li><a href="#register" data-toggle="modal">회원가입</a></li> 
				</ul> <!-- /.nav-second-level -->
			</li>
			</c:when>
			<c:otherwise>
			<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
					${user.userId }<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="#login">MyPage</a></li>
					<li><a href="/myProject2/logout.do">LogOut</a></li>  
				</ul> <!-- /.nav-second-level -->
			</li>
			</c:otherwise>
		</c:choose>			
			<li><a href="#" onclick="showDashboard();"><i class="fa fa-dashboard fa-fw"></i>
					Dashboard</a></li>
			<li><a href="#" onclick="showTables();"><i class="fa fa-table fa-fw"></i>
					Tables</a></li>
			<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
					Forms</a></li>
			<li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
					Elements<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="panels-wells.html">Panels and Wells</a></li>
					<li><a href="buttons.html">Buttons</a></li>
					<li><a href="notifications.html">Notifications</a></li>
					<li><a href="typography.html">Typography</a></li>
					<li><a href="icons.html"> Icons</a></li>
					<li><a href="grid.html">Grid</a></li>
				</ul> <!--  /.nav-second-level --></li>
			<li><a href="#"><i class="fa fa-sitemap fa-fw"></i>
					Multi-Level Dropdown<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="#">Second Level Item</a></li>
					<li><a href="#">Second Level Item</a></li>
					<li><a href="#">Third Level <span class="fa arrow"></span></a>
						<ul class="nav nav-third-level">
							<li><a href="#">Third Level Item</a></li>
							<li><a href="#">Third Level Item</a></li>
							<li><a href="#">Third Level Item</a></li>
							<li><a href="#">Third Level Item</a></li>
						</ul> <!-- /.nav-third-level --></li>
				</ul> <!-- /.nav-second-level --></li>
			<li><a href="#"><i class="fa fa-files-o fa-fw"></i> Sample
					Pages<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="blank.html">Blank Page</a></li>
					<li><a href="login.html">Login Page</a></li>
				</ul> <!--  .nav-second-level --></li>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->


<!-- Login Modal -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
		    <div class="container" style="width: 100%">
		        <div class="card card-container">
		            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
		            <p id="profile-name" class="profile-name-card"></p>
		            <form class="form-signin" id="logindo" action="/myProject2/logindo.do">
		                <span id="reauth-email" class="reauth-email"></span>
		                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
		                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
		                <span id="ckIdPwd"></span>
		                <br>
		                <button class="btn btn-lg btn-primary btn-block btn-signin" type="button" style="cursor:pointer;" onclick="Login();">Sign in</button>
		            </form><!-- /form -->
		            <a href="#" class="forgot-password">
		                Forgot the password?
		            </a>
		        </div><!-- /card-container -->
		    </div><!-- /container -->
	</div>
</div>

<!--Join Modal -->
<div id="register" class="modal fade">
    <div class="modal-dialog">
		    <div class="container" style="width: 100%">
		        <div class="card card-container">
		            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
		            <p id="profile-name" class="profile-name-card"></p>
		            <form class="form-signin">
		                <span id="reauth-email" class="reauth-email"></span>
		                
		                <span id="chId"></span>
		                <input type="email" name="userId" id="userId" class="form-control" placeholder="Email address" required autofocus>
		                
		                <span id="chPwd"></span>
		                <input type="password" name="password" id="pass" class="form-control" placeholder="Password" required>
		                
		                <span id="chPwd2"></span>
		                <input type="password" name="password" id="pass2" class="form-control" placeholder="Password" required>
		                
		                <input type="tel" name="phone" id="phone" class="form-control" placeholder="Phone Number" required>
		                <br>
		                <button class="btn btn-lg btn-primary btn-block btn-signin" type="button" style="cursor:pointer;" onclick="addUser();">Register</button>
		            </form><!-- /form -->
		        </div><!-- /card-container -->
		    </div><!-- /container -->
	</div>
</div>

<script>
function addUser() {
	$.ajax({
		type:"POST",
		url:"/myProject2/addUser.do",
		data:{
			userId:$("#userId").val(),
			password:$("#pass").val(),
			phone:$("#phone").val()
		},
		dataType:"",
		error:function(xhr, status, e){
			alert("xhr ==> "+xhr+", status ==> "+status+", e ==> "+e);
		},
		success:function(data){
			if(jQuery.trim(data) == 'true'){
				alert("회원가입이 완료되었습니다");
				location.href="/myProject2/jsp/index.jsp";
			}else if(jQuery.trim(data) == 'false'){
				alert("다시 시도해 주세요");
			}
		}
	});
}

function Login() {
	$.ajax({
		type:"POST",
		url: "/myProject2/login.do",
		data:{
			userId:$("#inputEmail").val(),
			password:$("#inputPassword").val(),
		},
		dataType:"json",
		error:function(xhr, status, e){
			$("#chIdPwd").html("xhr ==> "+xhr+", status ==> "+status+", e ==> "+e);
		},
		success: function(data){
			if($.trim(data) == 'false'){
				console.log("dfsdfs");
				$("#ckIdPwd").text("아이디 / 패스워드를 다시 확인해주세요");
				$("#ckIdPwd").css("color", "red");
			}else if($.trim(data) == 'true'){
				$("#logindo").submit();
			}
		}
	});
}
</script>