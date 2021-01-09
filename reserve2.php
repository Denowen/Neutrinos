<?php
session_start();
include 'dbconnect.php';
$buton = $_POST['buton'];
$drop = $_POST['drop'];
$_SESSION['dropp'] = $drop;
$query2 = "SELECT routeId FROM reserve WHERE reservationId='$drop'";
$result2 = mysqli_query($conn, $query2);
$count = mysqli_fetch_array($result2);
$_SESSION['dropRoute'] = $count[0];
$_SESSION['buton'] = $buton;


if($buton == "Satın Al" && !empty($drop)){
    header("Location:fillinfo.php");
}else{
    $query4 = "DELETE FROM reserve WHERE reservationId='$drop'";
    $result4 = mysqli_query($conn, $query4);
    header("Location:user2.php");
}



?>
