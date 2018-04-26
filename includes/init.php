<?php
session_start();
require('config.php');

function check_login(){
	if (isset($_SESSION['username']) && isset($_SESSION['enroll'])) {
		return true;
	} else{
		return false;
	}
}

function get_username() {
	return $_SESSION['username'];
}

function get_enroll() {
	return $_SESSION['enroll'];
}
?>
