<?php 

session_start();
include 'dbconnect.php';

$email = $_SESSION['email'];
$mail3 = $_POST['email3'];
$tel3 = $_POST['tel3'];


$sql = "UPDATE users SET userEmail='$mail3' WHERE userEmail='$email'";
$resultsql = mysqli_query($conn, $sql);

$sql3 = "UPDATE registeredusers SET regUserEmail='$mail3' WHERE regUserEmail='$email'";
$resultsql3 = mysqli_query($conn, $sql3);

$sql2 = "UPDATE registeredusers SET regUserTelephoneNumber='$tel3' WHERE regUserEmail='$email'";
$resultsql2 = mysqli_query($conn, $sql2);


$_SESSION['email'] = $mail3;

header('location: user.php');



?>