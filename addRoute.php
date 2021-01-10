<?php
session_start();
include 'dbconnect.php';

$nereden = $_POST['nereden'];
$nereye = $_POST['nereye'];
$saat = $_POST['saat'];
$trainNumber = $_POST['trainNumber'];
$date = $_POST['date'];
$price = $_POST['price'];
$saat2 = $_POST['saat2'];

$routeId = "SELECT max(routeId) from route";
$route = mysqli_query($conn, $routeId);
$row = mysqli_fetch_array($route);
$row[0] += 1;





if (empty($nereden) || empty($nereye) || empty($saat) || empty($trainNumber) || empty($trainNumber) || empty($price)) {
   header("location: admin.php");
} else {

   $trains = "SELECT * FROM route WHERE trainNumber='$trainNumber' and dateOfRoute = '$date'";
   $q1 = mysqli_query($conn, $trains);


   $count = 0;

   while ($array = mysqli_fetch_array($q1, MYSQLI_ASSOC)) {
      if ($array['departureTime'] < $saat and $array['arrivelTime'] < $saat and $saat2 < $saat and $array['startingStationTerminal'] == $$array['destinationStationTerminal']) {
         $count++;
      }
   }
   if ($count == 0) {
      $query = "INSERT INTO route VALUES('$row[0]','$nereden', '$nereye', '$saat:00', '$saat2:00', '$date', '$trainNumber', '$price')";
      $result = mysqli_query($conn, $query);
      header("location: allRouteList.php");
   } else
      echo '<script type="text/javascript">';
   echo 'alert("Yanlış bilgi girdiniz.");';
   echo 'window.location.href = "admin.php";';
   echo '</script>';
}
