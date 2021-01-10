<?php
session_start();
include 'dbconnect.php';

$routeId = $_POST['routeId'];
$saat = $_POST['saat'];
$date = $_POST['date'];
$price = $_POST['price'];
$saat2 = $_POST['saat2'];



if (empty($saat) || empty($date) ||  empty($price)) {
   header("location: modifyRoute.php?varname=$routeId");
} else {

   $query = "UPDATE route SET departureTime ='$saat:00', arrivelTime ='$saat2:00', dateOfRoute ='$date', price='$price' where routeId='$routeId'";
   $result = mysqli_query($conn, $query);
   header("location: allRouteList.php");
}
