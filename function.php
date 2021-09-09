<?php
	global $conn;
	$conn = mysqli_connect("localhost", "root", "", "hutatinggi");


	if(!$conn){
		die("Masalah Pada Database");
	}
	$db_use = mysqli_select_db($conn, "hutatinggi") or die("Select Database Problem !!");
?>
