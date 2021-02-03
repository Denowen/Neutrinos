<?php include('dbconnect.php') ?>

<?php
session_start();


$routeId = $_GET['varname'];



$query = "DELETE FROM route WHERE routeId='$routeId'";
$result = mysqli_query($conn, $query);
$query2 = "SELECT r.regUserEmail FROM ticket t, registeredusers r WHERE t.reguserSsn = r.regUserSsn and t.routeId = '$routeId'";
   $result2 = mysqli_query($conn, $query2);
   $num2 = mysqli_num_rows($result2);
   $i = 0;
   while($i < $num2){
   while($row = mysqli_fetch_array($result2)){
   $to_email = $row[0];
   $i++; 
   $subject = "::🙁 Yolculuğunuz iptal edildi. ::";
   $body = "Yolculuğunuz iptal edilmiştir. Bilet ödemeleriniz ödeme yaptığınız banka hesabınıza iade edilmiştir. Başka yolculuklarda görüşmek üzere. ";
   $headers = "From: neutrinos.turizm@gmail.com";
   if (mail($to_email, $subject, $body, $headers)) {
        echo "Email successfully sent to $to_email...";
   } else {
        echo "Email sending failed...";
    }
   

   }
   
   }
   $query8 = "DELETE FROM ticket WHERE routeId='$routeId'";
   $result8 = mysqli_query($conn, $query8);
   $query9 = "DELETE FROM buy WHERE routeId='$routeId'";
   $result9 = mysqli_query($conn, $query9);
   $query0 = "DELETE FROM reserve WHERE routeId='$routeId'";
   $result0 = mysqli_query($conn, $query0);

header("Location:allRouteList.php");




?>
