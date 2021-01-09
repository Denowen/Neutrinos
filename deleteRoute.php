<?php include('dbconnect.php') ?>

<?php
session_start();


$routeId = $_GET['varname'];



$query = "DELETE FROM route WHERE routeId='$routeId'";
$result = mysqli_query($conn, $query);


header("Location:allRouteList.php");




?>