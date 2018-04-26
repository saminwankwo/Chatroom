<?php
require ('includes/init.php');
if(check_login()==true){
	header('location: chat/chat.php');
}
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="includes/style.css">
</head>
<body>
	<div class="wrapper">
		<div class = ""></div>
		
	</div>
<table>
<tr>
<form action="login.php" method="POST" >
<td>Enrollment:</td> <td><input type="text" name="user"></td>
</tr>
<tr>
<td>Password:</td> <td><input type="password" name="pass"></td>
</tr>
<tr>
<td></td><td><input type="submit" name="login" value="login"> or <a href='reg.php'>SignUp</a></td>
</tr>
</form>
</table>
<footer> All right reserved &copy;<?php echo date("Y");?> <a href = 'index.php'> Office chat</a></footer>
</body>
</html>
