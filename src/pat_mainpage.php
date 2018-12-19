<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<title>Welcome Patient</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">
	<script type="text/javascript" src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
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
			margin-top: 100px;
		}
		hr {
			border: 1px solid black;
		}
		.your_details,.your_bill {
			border: 2px solid black;
			border-radius: 12px;
			padding: 20px;
			font-size: 20px;
			font-family: monospace;
			margin: 25px 25px 25px 500px;
			width: 25%;
		}
		.view_buttons, .view_bill {
			margin-top:50px;
			margin-left:auto;
			margin-right:auto;
			text-align:center;
			border: 2px solid black;
			border-radius: 6px;
			padding:8px;
			font-size:20px;
			background-color: grey;
			cursor: pointer;
		}
		.view_buttons:hover, .view_bill:hover {
			background-color: green;
			color:white;
		}
  </style>
	<script>
			function showBill() {

      if(document.getElementById('billing').style.display === "block")
		  document.getElementById('billing').style.display="none";
	  else
		  document.getElementById('billing').style.display="block";
    }
	</script>
</head>
<body>
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
		$sql = "SELECT `pid`,`pname`,  `age`, `phno`,   `admitdate`, `wardno`  FROM `patient` WHERE pid=?";
		$stmt = $conn->prepare($sql);
		$pid=$_SESSION['pid'];
		$stmt->bind_param('i', $pid);
		$stmt->execute();
		$result = $stmt->get_result();
		while ($row = $result->fetch_assoc()) {
			$age=$row['age'];
			$phno=$row['phno'];
			$adate=$row['admitdate'];
			$wno=$row['wardno'];
			$pname = $row['pname'];
		}
		$query = "SELECT d.name from doctor d,patient p where d.docid=p.docid and p.pid=?";
		$stm=$conn->prepare($query);
		$stm->bind_param('i',$pid);
		$stm->execute();
		$res=$stm->get_result();
		while($row = $res->fetch_assoc()) {
			$dname=$row['name'];
		}
		$_SESSION['pname']=$pname;
		$st=$conn->prepare("call bill(?,@total)");
		$st->bind_param('i',$pid);
		$st->execute();
		$re=$st->get_result();
		while($row = $re->fetch_assoc()) {
			$trcost = $row['cost'];
			$tcost = $row['costs'];
			$wcost = $row['charges'];
			$total = $row['total'];
		}
		mysqli_close($conn);
	?>

  <nav class="navbar fixed-top navbar-dark bg-dark" style="height:70px">
		<div class="container-fluid">
			<img class="profile_pic" src="./imgs/pat.png"></img>
			<div class="profile_banner">Profile: <?php echo $pname?></div>
			<input class="logout_but" type="button" value="Logout" onclick="window.location.href='http://localhost/loginpage.php'">
		</div>
	</nav>

	<div class="maincontent">
		<div class="your_details">
			<div><b>Your ID: </b><?php echo $pid ?></div>
			<hr>
			<div><b>Age: </b><?php echo $age ?></div>
			<hr>
			<div><b>Phone Number:  </b><?php echo $phno ?></div>
			<hr>
			<div><b>Your Doctor: </b><?php echo "Dr." . $dname ?></div>
			<hr>
			<div><b>Your Ward: </b><?php echo $wno ?></div>
			<hr>
			<div><b>Admitted Date: </b><?php echo $adate ?></div>
			<hr>
		</div>
	</div>

		<div class="container">
			<div class="row"><button class="view_buttons" onclick="window.location.href = './pat_test.php'"> Click to view your Tests </button></div>
			<div class="row"><button class="view_buttons" onclick="window.location.href='./pat_tr.php'"> Click to view your Treatments </button></div>
		</div>
		<div class="container">
			<div class="row"><input type="button" class="view_bill" value="Click to display your Bill" onclick="showBill()"></div>
		</div>
		<br><br>
		<div id="billing" style="display:none;">
			<div class="your_bill">
				<h2 style="font-weight:800;color:blue"><u>Your Expenses</u></h2><br>
				<div><b>Test Costs: </b><?php echo $tcost?></div>
				<hr>
				<div><b>Treatment Costs: </b><?php echo $trcost?></div>
				<hr>
				<div><b>Ward Costs: </b><?php echo $wcost?></div>
				<hr>
				<div><b>Total Costs: </b><?php echo $total?></div>
				<hr>
			</div>
		</div>
	</div>
</body>
</html>
