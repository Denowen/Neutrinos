<?php include('dbconnect.php') ?>

<?php
session_start();


$trainNumber = $_GET['varname'];

$query4 = "SELECT routeId FROM Route WHERE trainNumber='$trainNumber'";
$result4 = mysqli_query($conn, $query4);
$num4 = mysqli_num_rows($result4);

$i1=0;
while($i1<$num4){
     while($row = mysqli_fetch_array($result4)){
          $routeId = $row[0];
          $i1++; 
          $query2 = "SELECT r.regUserEmail FROM ticket t, registeredusers r WHERE t.reguserSsn = r.regUserSsn and t.routeId = '$routeId'";
          $result2 = mysqli_query($conn, $query2);
          $num2 = mysqli_num_rows($result2);
          $i = 0;
          while($i < $num2){
          while($row1 = mysqli_fetch_array($result2)){
          $to_email = $row1[0];
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
       
          }


}

$query5 = "DELETE FROM Route WHERE trainNumber='$trainNumber'";
$result5 = mysqli_query($conn, $query5);

$query = "DELETE FROM train WHERE trainNumber='$trainNumber'";
$result = mysqli_query($conn, $query);

$query6 = "DELETE FROM seatandclass WHERE trainNumber='$trainNumber'";
$result6 = mysqli_query($conn, $query6);


header("Location:allTrains.php");




?>
