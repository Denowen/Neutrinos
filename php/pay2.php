<?php
   session_start();
   include 'dbconnect.php';
   $ticket_ = $_SESSION['ticket'];
   $way_ = $_SESSION['way'];
   $nereden_ = $_SESSION['nereden'];
   $nereye_ = $_SESSION['nereye'];
   $sdate_ = $_SESSION['sdate'];
   $edate_ = $_SESSION['edate'];
   $ticket_ = $_SESSION['ticket'];
   $ticket_ = $_SESSION['ticket'];
   $route1_ = $_SESSION['route1_'];
   $route2_ = $_SESSION['route2_'];
   $number_ = $_SESSION['number'];
   $passType_ = $_SESSION['passType'];
   $email = $_SESSION['email'];
   $price = $_SESSION['price'];
   $price2 = $_SESSION['price2'];
   $cardnumber = $_POST['cardnumber'];
   $query = "SELECT regUserSsn FROM registeredusers WHERE regUserEmail = '$email'";
   $result = mysqli_query($conn, $query);
   $count = mysqli_fetch_array($result);
   
   if($way_ == 'tek'){
      for($i = 0; $i < $number_; $i++){
         ${"seatNum$i"} = $_POST["seatNum".$i];
         ${"pnr$i"} = "$count[0]"."$route1_"."$i"; 
         $_SESSION[${"pnr$i"}] = ${"pnr$i"};
         $query2 = "INSERT INTO ticket VALUES('${"pnr$i"}', '$count[0]', '$price', '$route1_', '$passType_', '${"seatNum$i"}')";
         $result2 = mysqli_query($conn, $query2);
         $query3 = "INSERT INTO buy VALUES('${"pnr$i"}', '0', '$count[0]', '$route1_', '$price', '$passType_', '${"seatNum$i"}')";
         $result3 = mysqli_query($conn, $query3);
        }

   }else{
   for($i = 0; $i < $number_*2; $i++){
    ${"seatNum$i"} = $_POST["seatNum".$i];
    if($i < $number_){
     ${"pnr$i"} = "$count[0]"."$route1_"."$i"; 
      $_SESSION[${"pnr$i"}] = ${"pnr$i"};
      $query2 = "INSERT INTO ticket VALUES('${"pnr$i"}', '$count[0]', '$price', '$route1_', '$passType_', '${"seatNum$i"}')";
      $result2 = mysqli_query($conn, $query2);
      $query3 = "INSERT INTO buy VALUES('${"pnr$i"}', '0', '$count[0]', '$route1_', '$price', '$passType_', '${"seatNum$i"}')";
      $result3 = mysqli_query($conn, $query3);
    }else{
     ${"pnr$i"} = "$count[0]"."$route2_"."$i"; 
      $_SESSION[${"pnr$i"}] = ${"pnr$i"};
      $query4 = "INSERT INTO ticket VALUES('${"pnr$i"}', '$count[0]', '$price2', '$route2_', '$passType_', '${"seatNum$i"}')";
      $result4 = mysqli_query($conn, $query4);
      $query5 = "INSERT INTO buy VALUES('${"pnr$i"}', '0', '$count[0]', '$route2_', '$price2', '$passType_', '${"seatNum$i"}')";
      $result5 = mysqli_query($conn, $query5);
    }
    
   }
}
  if(!empty($cardnumber)){
     if($way_ == 'tek'){
        for($i = 0; $i < $number_; $i++){
         $a = $_SESSION[${"pnr$i"}];
         $sql = "UPDATE buy SET creditCardNumber='$cardnumber' WHERE PNR='$a'";
         $resultsql = mysqli_query($conn, $sql);
        }
     }else{
      for($i = 0; $i < $number_*2; $i++){
         $b = $_SESSION[${"pnr$i"}];
         $sql1 = "UPDATE buy SET creditCardNumber='$cardnumber' WHERE PNR='$b'";
         $resultsql1 = mysqli_query($conn, $sql1);
        }
     }
      header("Location:home.php");
   }else{

      header("Location: pay.php");
   }

   ?>