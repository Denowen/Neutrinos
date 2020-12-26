<?php
$dbname="new_schema"; 
	$conn= mysqli_connect("127.0.0.1", "root", "", "new_schema", "3306", "");
        if (!$conn) {
    die('not connected:' . mysqli_error($conn));
} else {
    echo 'connected';
}
$b= mysqli_select_db($conn, $dbname);
if(!$b){
	die("db couldn't retrieved". mysqli_error($conn));
} 
?>
