<?php session_start(); ?>
<html>
<head>
	<style>
	div {
		padding:10px;
		margin:150px 300px 150px 300px;
		background-color: skyblue;
		font-family: 'Google Sans';
		text-align:center;
		border:3px solid black;
		border-radius:10px;
		color:red;
		font-size:30px;
		font-weight:bolder;
		}
	</style>
</head>
<body>
<?php
error_reporting(E_ALL ^ E_NOTICE);

		$servername="localhost";
	$username="root";
	$password="";
	$dbname="hdbms";

	$conn=mysqli_connect($servername,$username,$password,$dbname);

	if($conn->connect_error) {
		die("connection failed:" .$conn->connect_error);
	}
	$pid=$_POST['patid'];
	$pass2=$_POST['passwd1'];
	$_SESSION['pid']=$pid;
	$sql = "SELECT `pid`,  `passwd` FROM `patient` WHERE pid=?";
		$stmt = $conn->prepare($sql);
		$stmt->bind_param('i', $pid);
		$stmt->execute();
		$result = $stmt->get_result();

		while ($row = $result->fetch_assoc()) {
			if (password_verify($pass2, $row['passwd'])) {
				header('location:pat_mainpage.php');
			}
			else {
				echo "<div>";
				echo "Login Failed<br>";
				echo "Click back to login again";
				echo "</div>";
			}
		}


	mysqli_close($conn);
?>
</body>
</html>
