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

   $trains = "SELECT * FROM route WHERE trainNumber='$trainNumber' and dateOfRoute = '$date'";
   $q1 = mysqli_query($conn, $trains);


   $count = 0;

   while ($array = mysqli_fetch_array($q1, MYSQLI_ASSOC)) {
      if ($array['departureTime'] < $saat and $array['arrivelTime'] < $saat and $saat2<$saat and $array['startingStationTerminal'] == $$array['destinationStationTerminal']) {
         $count++;
      }
   }
   if ($count == 0) {

   $query = "UPDATE route SET departureTime ='$saat:00', arrivelTime ='$saat2:00', dateOfRoute ='$date', price='$price' where routeId='$routeId'";
   $result = mysqli_query($conn, $query);
   header("location: allRouteList.php");
}
else{
   echo '<script type="text/javascript">'; 
echo 'alert("Yanlış bilgi girdiniz.");'; 
echo 'window.location.href = "admin.php";';
echo '</script>';
}
}
