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


