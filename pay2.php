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
   $cvv = $_POST['cvv'];
   $month = $_POST['month'];
   $year = $_POST['year'];
   $ns = $_POST['ns'];

   $randomNumber = rand(0,99); 

   for($i = 0; $i< $number_; $i++){
       ${"isim$i"} = $_SESSION["isim".$i];
         ${"soyisim$i"} = $_SESSION["soyisim".$i];
         ${"ssn$i"} = $_SESSION["ssn".$i];
   }
   $query = "SELECT regUserSsn FROM registeredusers WHERE regUserEmail = '$email'";
   $result = mysqli_query($conn, $query);
   $count = mysqli_fetch_array($result);
   
   if($way_ == 'tek'){
      
      for($i = 0; $i < $number_; $i++){
         ${"seatNum$i"} = $_POST["seatNum".$i];

         ${"pnr$i"} = "${"ssn$i"}"."$route1_"."$i";

         $_SESSION[${"pnr$i"}] = ${"pnr$i"};
         $query2 = "INSERT INTO ticket VALUES('${"pnr$i"}', '$count[0]','${"isim$i"}','${"soyisim$i"}','${"ssn$i"}', '$price', '$route1_', '$passType_', '${"seatNum$i"}')";
         $result2 = mysqli_query($conn, $query2);
         $query3 = "INSERT INTO buy VALUES('${"pnr$i"}', '0', '$count[0]', '$route1_', '$price', '$passType_', '${"seatNum$i"}')";
         $result3 = mysqli_query($conn, $query3);
        }

   }else{
      $i2 = 0;
   for($i = 0; $i < $number_*2; $i++){
    ${"seatNum$i"} = $_POST["seatNum".$i];
    if($i < $number_){
      ${"pnr$i"} = "${"ssn$i"}"."$route1_"."$i";
      $_SESSION[${"pnr$i"}] = ${"pnr$i"};
      $query2 = "INSERT INTO ticket VALUES('${"pnr$i"}', '$count[0]','${"isim$i"}','${"soyisim$i"}','${"ssn$i"}', '$price', '$route1_', '$passType_', '${"seatNum$i"}')";
      $result2 = mysqli_query($conn, $query2);
      $query3 = "INSERT INTO buy VALUES('${"pnr$i"}', '0', '$count[0]', '$route1_', '$price', '$passType_', '${"seatNum$i"}')";
      $result3 = mysqli_query($conn, $query3);
    }else{
      ${"pnr$i"} = "${"ssn$i"}"."$route1_"."$i";
      $_SESSION[${"pnr$i"}] = ${"pnr$i"};
      $query4 = "INSERT INTO ticket VALUES('${"pnr$i"}', '$count[0]','${"isim$i2"}','${"soyisim$i2"}','${"ssn$i2"}', '$price2', '$route2_', '$passType_', '${"seatNum$i"}')";
      $result4 = mysqli_query($conn, $query4);
      $query5 = "INSERT INTO buy VALUES('${"pnr$i"}', '0', '$count[0]', '$route2_', '$price2', '$passType_', '${"seatNum$i"}')";
      $result5 = mysqli_query($conn, $query5);
      $i2++;
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
     $_SESSION['buton'] = null;

     $drop = $_SESSION['dropp'];

     $query4 = "DELETE FROM reserve WHERE reservationId='$drop'";
    $result4 = mysqli_query($conn, $query4);

    $_SESSION['dropp'] = null;

    $query5 = "INSERT INTO payment VALUES('$cardnumber', '$cvv', '$month', '$year', '$ns')";
    $result5 = mysqli_query($conn, $query5);

    $to_email = "$email";
    $subject = ":: 🎫 Bilet Satın Alma İşlemin Başarıyla Tamamlandı ::";
    $body = "Yolculuğunuz için Neutrinos Turizm'i tercih ettiğiniz için teşekkür ederiz. Hesabınızın Profilim kısmından bilet bilgilerinize erişebilir, iptal işlemlerinizi gerçekleştirebilirsiniz. İyi yolculuklar dileriz.  ";
    $headers = "From: neutrinos.turizm@gmail.com";
    if (mail($to_email, $subject, $body, $headers)) {
        echo "Email successfully sent to $to_email...";
    } else {
        echo "Email sending failed...";
    }

      header("Location:user.php");
   }else{
      header("Location: pay.php");
   }


   ?>
