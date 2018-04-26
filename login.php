<?php
require('includes/init.php');


function back_to_login() {
	header('Location: index.php');
}

function send_to_chat() {
	header('Location: chat/chat.php');
}

if(isset($_POST['user']) && isset($_POST['pass'])) {
	
	$enroll = $_POST['user'];
	$password = $_POST['pass'];
	$password = md5("5".$password."@");

	$sql = "SELECT usr_name FROM stud_data WHERE usr_roll='".$enroll."' AND usr_pass='".$password."' LIMIT 1";
	$result = mysqli_query($conn, $sql);
	$count = mysqli_num_rows($result);
	echo $count;
	if($count==0) 
		back_to_login();
	else	{
		while($row=mysqli_fetch_array($result))
			$username = $row['usr_name'];
		$_SESSION['username'] = $username;
		$_SESSION['enroll'] = $enroll; 
		send_to_chat();
	}
	

}
else
back_to_login();
?>
