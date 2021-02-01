<?php 

session_start();
include 'dbconnect.php';

$mail = $_POST['mail'];
$kod = $_POST['number'];
$sifre = $_POST['password'];
$pasword = md5($sifre);

$randomNumber = rand(1000,9999); 

$sql = "UPDATE users SET userPassword='$pasword' WHERE userEmail='$mail'";
$resultsql = mysqli_query($conn, $sql);

$sql2 = "UPDATE administrators SET adminPassword='$pasword' WHERE adminEmail='$mail'";
$resultsql2 = mysqli_query($conn, $sql2);

$sql3 = "UPDATE registeredusers SET regUserPassword='$pasword' WHERE regUserEmail='$mail'";
$resultsql3 = mysqli_query($conn, $sql3);

$query2 = "SELECT recoveryCode FROM users WHERE userEmail = '$mail'";
$result2 = mysqli_query($conn, $query2);
$count = mysqli_fetch_array($result2);

if($kod == $count[0]){
    header('location: giris.php');
}else{
    header('location: forgot.php');
}

?>