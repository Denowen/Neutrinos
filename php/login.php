<?php
session_start();

include('dbconnect.php');


if(isset($_POST['login'])){
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $query1 = "SELECT * FROM users WHERE userEmail='$email' AND userPassword='$password'";
    $query2 = "SELECT * FROM administrators WHERE adminEmail='$email' AND adminPassword='$password'";

    $result1 = mysqli_query($conn, $query1);
    $result2 = mysqli_query($conn, $query2);

    if(mysqli_num_rows($result1) ==1 and mysqli_num_rows($result2) == 0){
        $_SESSION['email']=$email;
        header('location: home.php');
    } else if (mysqli_num_rows($result2) == 1){
        $_SESSION['email']=$email;
        header('location: home.php');
    }else {
        
        echo("<br>wrong id pass");
    }

}

if(isset($_POST['register'])){
    $fname = mysqli_real_escape_string($conn, $_POST['fname']);
    $lname = mysqli_real_escape_string($conn, $_POST['lname']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    $ssn = mysqli_real_escape_string($conn, $_POST['ssn']);
    $bdate = mysqli_real_escape_string($conn, $_POST['bdate']);
    $tel = mysqli_real_escape_string($conn, $_POST['tel']);


    $query ="INSERT INTO users VALUES('$ssn', '$fname', '$lname', '$email', '$password')";
    $query2 = "INSERT INTO registeredusers VALUES('$fname', '$lname', '$ssn', '$email', '$password', '$bdate', '$tel')";
    mysqli_query($conn, $query);
    mysqli_query($conn, $query2);
    
    header('location: giris.php');
}
