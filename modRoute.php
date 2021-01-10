<?php
session_start();
include('dbconnect.php');

if (isset($_SESSION['loggedin'])) {
    $email = $_SESSION['email'];
    //QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
    $query = mysqli_query($conn, "select * from registeredusers where regUserEmail = '$email'");
    $counta = mysqli_num_rows($query);
    if (!$counta) {
        header("location:admin.php");
    } 
}


?>


<?php


$routeId = $_POST['routeId'];
$saat = $_POST['saat'];
$date = $_POST['date'];
$price = $_POST['price'];



if (empty($saat) || empty($date) ||  empty($price)) {
   header("location: modifyRoute.php?varname=$routeId");
} else {

   $query = "UPDATE route SET arrivelTime ='$saat', dateOfRoute ='$date', price='$price' where routeId='$routeId'";
   $result = mysqli_query($conn, $query);
   header("location: allRouteList.php");
}
