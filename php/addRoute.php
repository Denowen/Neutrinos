<?php
session_start();
include 'dbconnect.php';

$nereden = $_POST['nereden'];
$nereye = $_POST['nereye'];
$saat = $_POST['saat'];
$trainNumber = $_POST['trainNumber'];
$date = $_POST['date'];

$routeId= "SELECT max(routeId) from route";
$route = mysqli_query($conn, $routeId);
$row = mysqli_fetch_array($route);
$row[0] +=1;
$saat2 = $saat+2;



if(empty($nereden)|| empty($nereye)|| empty($saat)|| empty($trainNumber) || empty($trainNumber)){
     header("location: admin.php");
 }
 else{

    $query ="INSERT INTO route VALUES('1','$nereden', '$nereye', '$saat:00', '$saat2:00', '$date', '$trainNumber', '50')";
    $result= mysqli_query($conn, $query);
    echo $row[0];
 }


//if(empty($drop)){
//
//    $query2 = "DELETE FROM ticket WHERE PNR='$cancel'";
//    $result2 = mysqli_query($conn, $query2);
//    $query3 = "DELETE FROM buy WHERE PNR='$cancel'";
//    $result3 = mysqli_query($conn, $query3);
//    header("Location:user.php");
//
//}else{
//    $query4 = "DELETE FROM reserve WHERE reservationId='$drop'";
//    $result4 = mysqli_query($conn, $query4);
//    header("Location:user2.php");
//}
