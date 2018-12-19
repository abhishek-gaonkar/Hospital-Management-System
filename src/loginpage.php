<!DOCTYPE html>
<html>
<head>
	<title>Hospital Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		body {
			text-align:center;
			background-image: url("./imgs/subtle.jpg");
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-size: cover;
		}
		h2 {
			font-family:'Segoe Script';
			font-size:36px;
			font-weight:bold;
			color:#ffffff;
			margin:30px;
		}
		h3 {
			font-family:'Google Sans';
			font-size:30px;
			color:#f1e100;
			margin:5px;
			height:80px;
		}
		hr {
			border: 1px solid black;
		}
		.loginbox {
			margin-left: auto;
			margin-right:auto;
			border: 3px solid black;
			border-radius: 12px;
			background-color: #f1f1f1;
			width:40%;
		}
		.tab {
	    overflow: hidden;
	    background-color: #f1f1f1;
			border: 3px solid #ccc;
			border-radius: 12px;
		}
		.tab button {
		  background-color: inherit;
		  float: left;
		  border: none;
		  outline: none;
		  cursor: pointer;
		  padding: 14px 16px;
		  transition: 0.3s;
		  font-size: 17px;
		}
		.tab button:hover {
		  background-color: #ddd;
			color:red;
		}
		.tab button.active {
			background-color: #bbb;
		}
		.tablinks {
			font-size: 30px !important;
		}
		.tabcontent {
		  padding: 6px 12px;
		  border-top: none;
		}
		.doc_avatar, .pat_avatar {
			border-radius: 50%;
			width: 200px;
			height: 200px;
		}
		input[type=text], input[type=password] {
			width: 100%;
	    padding: 12px 20px;
	    margin: 8px 0;
	    display: inline-block;
			border-radius: 12px;
			border: 2px solid black;
	    box-sizing: border-box;
		}
		button[type=submit] {
			padding: 12px;
			background-color: green;
			color: white;
			font-size: 18px;
			border-radius: 12px;
			opacity:0.7;
		}
		button[type=submit]:hover {
			opacity: 1.0;
			cursor: pointer;
		}
	</style>
	<script>
		function loginfunc(evt, loginType) {
			var i, tabcontent, tablinks;
			var start_session_add_dct;
			start_session_add_dct = document.getElementsByClassName("dct");
			start_session_add_dct.className +=" active";

			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(" active", "");
			}
			document.getElementById(loginType).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>
</head>
<body>

	<div class="welcome">
  	<h2>HEALTH CARE </h2>
		<h2>Hospital Management System </h2><hr>
  	<h3>Login to Continue </h3>
	</div>
	<div class="loginbox">
		<div class="tab">
		  <button class="active tablinks col-sm-6" onclick="loginfunc(event, 'Doctor')">Doctor</button>
		  <button class="tablinks col-sm-6" onclick="loginfunc(event, 'Patient')">Patient</button>
		</div>
		<div id="Doctor" class="tabcontent" style="display:block">
			<form action="doctorlogin.php" method="POST">
				<img class="doc_avatar" src="./imgs/doc.png"><br>
				<span><b>DocID</b></span>
				<input type="text" placeholder="Enter DocID" name="docid" required><br>
				<span><b>Password</b></span>
				<input type="password" placeholder="Enter Password" name="password" required><br>
				<button type="submit">LOGIN</button>
			</form>
		</div>
		<div id="Patient" class="tabcontent" style="display:none">
			<form  action="patientlog.php" method="POST">
				<img class="pat_avatar" src="./imgs/pat.png" style="opacity:0.7"><br>
				<span><b>PatientID</b></span>
				<div id=patient">
				<input type="text" placeholder="Enter PatientID" name="patid" required><br>
				<span><b>Password</b></span>
				<input type="password" placeholder="Enter Password" name="passwd1" required><br>
				<button type="submit">LOGIN</button></div>
			</form>
		</div>
	</div><br>



</body>
</html>
