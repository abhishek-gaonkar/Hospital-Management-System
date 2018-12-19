<?php session_start();?>
<!DOCTYPE html>
<html>
<head>
	<title>Add New Patient</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">
	<script type="text/javascript" src="bootstrap-4.1.3-dist/js/bootstrap.js">
	</script>
	<style>
		body {
			 background-image: url("imgs/ref.jpg");
			 background-repeat: no-repeat;
			 background-size: cover;
		}
		.profile_pic {
			border-radius:50%;
			width:50px;
			height:50px;
			float:left;
		}
		.profile_banner {
			font-size: 25px;
			font-family: 'Google Sans';
			color:white;
		}
		input.logout_but {
			background-color:#f00;
			color:white;
			font-size: 18px;
			border: 2px solid black;
			cursor: pointer;
			border-radius: 6px;
			margin:10px;
			padding: 5px;
		}
		input.logout_but:hover {
			background-color:#880;
			transition-delay:0.1s;
			transform: scale(1.02);
		}
		.maincontent {
			margin: 30px 250px 150px 250px;
			border: 6px solid skyblue;
			border-radius: 10px;
			padding: 20px;
		}
		h2 {
			font-family: monospace;
			text-align: center;
			font-weight: bold;
		}
		form {
			text-align:center;
			font-size: 20px;
		}
		input[type="radio"]:hover {
			cursor: pointer;
		}
		input[type="text"] {
			border: 2px solid black;
			padding: 7px;
			border-radius: 12px;
		}
		input[type="password"] {
			border: 2px solid black;
			padding: 7px;
			border-radius: 12px;
		}
		button {
			margin-top:80px;
			font-size:20px;
			background-color:red !important;
		}
		input[type="submit"], button {
			background-color: black;
			color:white;
			border: 3px solid black;
			border-radius:10px;
			padding: 6px;
		}
		input[type="submit"]:hover, button:hover {
			background-color: green !important;
			cursor: pointer;
		}
  </style>
</head>
<body>

  <nav class="navbar fixed-top navbar-dark bg-dark" style="height:70px">
		<div class="container-fluid">
			<img class="profile_pic" src="./imgs/doc.png"></img>
			<div class="profile_banner">Profile: Dr.<?php echo $_SESSION['dname'];?></div>
			<input class="logout_but" type="button" value="Logout" onclick="window.location.href='http://localhost/loginpage.php'">
		</div>
	</nav>
	<center><button type="button" onclick="window.location.href = './doc_mainpage.php' ">Go Back </button></center><br>

	<div class="maincontent">
		<h2>ADD NEW PATIENT</h2><br>
		<form action="<?php $_PHP_SELF ?>" target="" method="POST">
			Enter Patient ID: <br>
			<input type="text" name="pid" placeholder="Enter PID" required><br><br>
			Enter Patient's Name:<br>
		  <input type="text" name="pname" placeholder="Enter PName" required><br><br>
			Enter Age:<br>
			<input type="text" name="age" placeholder="Enter Age" required><br><br>
			Enter Phone Number:<br>
			<input type="text" name="phno" placeholder="Enter Phno" required><br><br>
			Enter Disease:<br>
			<input type="text" name="disease" placeholder="Enter Disease" required><br><br>
			Enter Admission Date(in yyyy-mm-dd format):<br>
			<input type="text" name="admitdate" placeholder="Enter Admit Date" required><br><br>
			Enter Ward Number:<br>
			<input type="text" name="wardno" placeholder="Enter only existing Ward No." required><br><br>
			Enter Gender:<br>
			<input type="radio" name="pgender" checked value='m'>Male
			<input type="radio" name="pgender" value='f'>Female<br><br>
			Enter default password:<br>
			<input type="password" name="pass" placeholder="Enter password" required><br><br>
			<input type="submit" value="Add Patient">
		</form>
	</div>
	<?php
			error_reporting (E_ALL ^ E_NOTICE);
		$servername="localhost";
		$username="root";
		$password="";
		$dbname="hdbms";


		if($conn->connect_error) {
			die("connection failed:" .$conn->connect_error);
		}
		$conn=mysqli_connect($servername,$username,$password,$dbname);

		$pid=$_POST['pid'];
		$pname=$_POST['pname'];
		$age=$_POST['age'];
		$phno=$_POST['phno'];
		$disease=$_POST['disease'];
		$docid=$_SESSION['docid'];
		$admitdate=$_POST['admitdate'];
		$wardno=$_POST['wardno'];
		$pgender=$_POST['pgender'];
		$pass=$_POST['pass'];
		$paswd=password_hash($pass,PASSWORD_DEFAULT);
//		$stmt=$conn->prepare("INSERT INTO `patient` (`pid`, `pname`, `age`, `phno`, `disease`, `docid`, `admitdate`, `wardno`, `pgender`,`passwd`) VALUES(?,?,?,?,?,?,?,?,?,?)");
echo $pid;
echo $pname;
		$stmt12=$conn->prepare("INSERT INTO `patient` (`pid`, `pname`, `age`, `phno`, `disease`, `docid`, `admitdate`, `wardno`, `pgender`,`passwd`) VALUES(?,?,?,?,?,?,?,?,?,?)");
		$stmt12->bind_param('isissisiss',$pid,$pname,$age,$phno,$disease,$docid,$admitdate,$wardno,$pgender,$paswd);
		$stmt12->execute();

		mysqli_close($conn);
	?>
</body>
</html>
