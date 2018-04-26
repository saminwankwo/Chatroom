<?php
require('../includes/init.php');
if(check_login()==true) {

	$enroll = get_enroll();
	$search = $_POST['search'];

	//updating the time
	$sql = "UPDATE stud_data SET time=".time()." WHERE usr_roll=".$enroll;
	mysqli_query($sql);
	
	// getting online users
	$time = time()-3;
	if($search=="")
	$sql = "SELECT usr_name, usr_roll FROM stud_data WHERE time>=".$time." AND usr_roll<>".$enroll;
	else
	$sql = "SELECT usr_name, usr_roll FROM stud_data WHERE time>=".$time." AND usr_roll<>".$enroll." AND online='yes' AND UCASE(usr_name) LIKE'%".strtoupper($search)."%'";
	$result = mysqli_query($sql);
	$count = mysqli_num_rows($result);
		if($count>0) {
			while($row = mysqli_fetch_assoc($result)) {
			echo "<div id='user' onclick='javascript:chatWith(&#39;".$row['usr_name']."&#39;,".$row['usr_roll'].")'>".$row['usr_name']."</div>";
			}
		}
}
else
	echo "<div class='err_msg'>Invalid Username/Password, please <a href='../'>login </a>again</div>";
?>
