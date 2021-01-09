<?php
 session_start();
 include 'dbconnect.php';
 $email = $_SESSION['email'];
 $query2 = "SELECT PNR FROM buy where creditCardNumber = '0'";
 $result2 = mysqli_query($conn, $query2);
 $num2 = mysqli_num_rows($result2);
 while ($i < $num2) {
  while ($count = mysqli_fetch_array($result2)) {
      $query3 = "DELETE FROM ticket WHERE PNR = '$count[0]'";
      $result3 = mysqli_query($conn, $query3);
      $query4 = "DELETE FROM buy WHERE PNR = '$count[0]'";
      $result4 = mysqli_query($conn, $query4);

   $i++;   
  }
}


?>