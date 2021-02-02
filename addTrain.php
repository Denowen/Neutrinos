<?php
session_start();
include 'dbconnect.php';

$trainNumber = $_POST['trainNumber'];
$kapasite = $_POST['kapasite'];


if (empty($trainNumber) || empty($kapasite)) {
    header("location: admin.php");
} else {

    $trains = "SELECT * FROM train WHERE trainNumber='$trainNumber' ";
    $q1 = mysqli_query($conn, $trains);


    $count = 0;

    while ($array = mysqli_fetch_array($q1, MYSQLI_ASSOC)) {
        if ($array['trainNumber'] = $trainNumber) {
            $count++;
        }
    }
    if ($count == 0) {
        $query = "INSERT INTO train VALUES('$trainNumber','$kapasite')";
        $result = mysqli_query($conn, $query);

        header("location: admin.php");
    } else
        echo '<script type="text/javascript">';
    echo 'alert("Yanlış bilgi girdiniz.");';
    echo 'window.location.href = "admin.php";';
    echo '</script>';
}
