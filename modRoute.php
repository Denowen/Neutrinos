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
   $query2 = "SELECT r.regUserEmail FROM ticket t, registeredusers r WHERE t.reguserSsn = r.regUserSsn and t.routeId = '$routeId'";
   $result2 = mysqli_query($conn, $query2);
   $num2 = mysqli_num_rows($result2);
   $i = 0;
   while($i < $num2){
   while($row = mysqli_fetch_array($result2)){
   $to_email = $row[$i];
   $subject = "::📅 Yolculuğunuza bir güncelleme geldi. ::";
   $body = "Yolculuğunuzun kalkış saati $saat:00, varış saati $saat2:00, ve tarihi $date olarak güncellenmiştir. Detaylara profilinizden ulaşabilirsiniz. :) ";
   $headers = "From: neutrinos.turizm@gmail.com";
   if (mail($to_email, $subject, $body, $headers)) {
        echo "Email successfully sent to $to_email...";
   } else {
        echo "Email sending failed...";
    }
    $i++;

   }
   
   }
   header("location: allRouteList.php");
}
else{
   echo '<script type="text/javascript">'; 
echo 'alert("Yanlış bilgi girdiniz.");'; 
echo 'window.location.href = "admin.php";';
echo '</script>';
}
}
