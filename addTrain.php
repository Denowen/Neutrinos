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

        $num = "SELECT max(seatAndClassId) from seatandclass";
        $num2 = mysqli_query($conn, $num);
        $row2 = mysqli_fetch_array($num2);
        $row2[0] += 1;
        
        $count2 = 0;
        $count3 = 0;
        while($count2 < $kapasite) {

            if($count2 < ($kapasite/2) ){

            if($count2 % 2==0){
             $query9 = "INSERT INTO seatandclass VALUES('$row2[0]' ,'$trainNumber','$count3 A','BUSINESS CLASS')";
             $result9 = mysqli_query($conn, $query9);
             
             $row2[0] += 1;
             $query10 = "INSERT INTO seatandclass VALUES('$row2[0]' ,'$trainNumber','$count3 B', 'BUSINESS CLASS')";
             $result10 = mysqli_query($conn, $query10);
             $count2 += 2;
             $count3++;
             $row2[0] += 1;
            }else{
                $query9 = "INSERT INTO seatandclass VALUES('$row2[0]' ,'$trainNumber','$count3 C','BUSINESS CLASS')";
             $result9 = mysqli_query($conn, $query9);
             $count2++;
             $count3++;
             $row2[0] += 1;
            }
            }else{
                if($count2 % 2==0){
                    $query8 = "INSERT INTO seatandclass VALUES('$row2[0]' ,'$trainNumber','$count3 A','ECONOMY CLASS')";
                    $result8 = mysqli_query($conn, $query8);
                    
                    $row2[0] += 1;
                    $query11 = "INSERT INTO seatandclass VALUES('$row2[0]' ,'$trainNumber','$count3 B', 'ECONOMY CLASS')";
                    $result11 = mysqli_query($conn, $query11);
                    $count2 += 2;
                    $count3++;
                    $row2[0] += 1;
                   }else{
                       $query7 = "INSERT INTO seatandclass VALUES('$row2[0]' ,'$trainNumber','$count3 C','ECONOMY CLASS')";
                    $result7 = mysqli_query($conn, $query7);
                    $count2++;
                    $count3++;
                    $row2[0] += 1;
                   }
            }

        }
      
        echo '<script type="text/javascript">'; 
echo 'alert("Tren başarıyla eklendi");'; 
echo 'window.location.href = "admin.php";';
echo '</script>';
    } else
        echo '<script type="text/javascript">';
    echo 'alert("Yanlış bilgi girdiniz.");';
    echo 'window.location.href = "admin.php";';
    echo '</script>';
}
