<?php
session_start();
include 'dbconnect.php';
$cancel = $_POST['cancel'];
$drop = $_POST['drop'];

if(empty($drop)){

    $query2 = "DELETE FROM ticket WHERE PNR='$cancel'";
    $result2 = mysqli_query($conn, $query2);
    $query3 = "DELETE FROM buy WHERE PNR='$cancel'";
    $result3 = mysqli_query($conn, $query3);
    header("Location:user.php");

}else{
    $query4 = "DELETE FROM reserve WHERE reservationId='$drop'";
    $result4 = mysqli_query($conn, $query4);
    header("Location:user2.php");
}



?>
