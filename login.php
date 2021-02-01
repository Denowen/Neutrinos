<?php
session_start();

include('dbconnect.php');



if(isset($_POST['login'])){
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    $pasword = md5($password);

    $query1 = "SELECT * FROM users WHERE userEmail='$email' AND userPassword='$pasword'";
    $query2 = "SELECT * FROM administrators WHERE adminEmail='$email' AND adminPassword='$pasword'";

    $result1 = mysqli_query($conn, $query1);
    $result2 = mysqli_query($conn, $query2);

    if(mysqli_num_rows($result1) ==1 and mysqli_num_rows($result2) == 0){
        $_SESSION['email']=$email;
        header('location: home.php');
    } else if (mysqli_num_rows($result2) == 1){
        $_SESSION['email']=$email;
        header('location: admin.php');
    }else {echo '<script type="text/javascript">'; 
echo 'alert("Parola veya Email Yanlış! Lütfen Tekrar Giriniz.");'; 
echo $pasword; 
echo 'window.location.href = "giris.php";';
echo '</script>';
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
    $maill = $_POST['email'];
    $pasword = md5($password);
    $query ="INSERT INTO users VALUES('$ssn', '$fname', '$lname', '$email', '$pasword','0')";
    $query2 = "INSERT INTO registeredusers VALUES('$fname', '$lname', '$ssn', '$email', '$pasword', '$bdate', '$tel')";
    mysqli_query($conn, $query);
    mysqli_query($conn, $query2);

    $isim = $_POST['fname'];
    $soyisim = $_POST['lname'];
    $to_email = "$maill";
    $subject = ":: Merhaba 👋 Neutrinos Turizm'e hoş geldin ::";
    $body = "$isim $soyisim Neutrinos Turizm'e kayıt işlemin gerçekleşti. Şu andan itibaren istediğin tren biletini alabilir ve yolculuğa çıkabilirsin.";
    $headers = "From: neutrinos.turizm@gmail.com";
    if (mail($to_email, $subject, $body, $headers)) {
        echo "Email successfully sent to $to_email...";
    } else {
        echo "Email sending failed...";
    }

    
    header('location: giris.php');
}
