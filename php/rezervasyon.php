<?php
session_start();
include 'dbconnect.php';
$route1_ = $_SESSION['route1_'];
$route2_ = $_SESSION['route2_'];
$number_ = $_POST['number'];
$passType_ = $_POST['passType'];
$way_ = $_SESSION['way'];
$email = $_SESSION['email'];
$query = "SELECT regUserSsn FROM registeredusers WHERE regUserEmail = '$email'";
$result = mysqli_query($conn, $query);
$count = mysqli_fetch_array($result);

if($way_ == 'tek'){
    for($i = 0; $i < $number_; $i++){
       ${"reservationId$i"} = "$count[0]"."$route1_"."$i"; 
       $_SESSION[${"reservationId$i"}] = ${"reservationId$i"};
       $query2 = "INSERT INTO reserve VALUES('${"reservationId$i"}', '$count[0]','$route1_', '$passType_')";
       $result2 = mysqli_query($conn, $query2);
       
      }

 }else{
 for($i = 0; $i < $number_*2; $i++){
  if($i < $number_){
   ${"reservationId$i"} = "$count[0]"."$route1_"."$i"; 
    $_SESSION[${"reservationId$i"}] = ${"reservationId$i"};
    $query3 = "INSERT INTO reserve VALUES('${"reservationId$i"}', '$count[0]', '$route1_', '$passType_')";
    $result3 = mysqli_query($conn, $query3);
  }else{
   ${"pnr$i"} = "$count[0]"."$route2_"."$i"; 
    $_SESSION[${"reservationId$i"}] = ${"reservationId$i"};
    $query4 = "INSERT INTO reserve VALUES('${"reservationId$i"}', '$count[0]', '$route2_', '$passType_')";
    $result4 = mysqli_query($conn, $query4);
  }
  
 }
}

header("Location: home.php");



?>