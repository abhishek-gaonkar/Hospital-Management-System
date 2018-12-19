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
	$docid=$_POST['docid'];
	$pass1=$_POST['password'];
	$_SESSION['docid']=$docid;
		$sql = "SELECT  `docid`,`password` FROM `dpass` WHERE docid=?";
		$stmt = $conn->prepare($sql);
		$stmt->bind_param('i', $docid);
		$stmt->execute();
		$result = $stmt->get_result();

		while ($row = $result->fetch_assoc()) {
			if (password_verify($pass1, $row['password'])) {
				header('location:doc_mainpage.php');
			}
			else {
				echo "<div>";
				echo "Login Failed<br>";
				echo "Click back to login again";
				echo "</div>";
			}
		}

?>
</body>
</html>
