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
echo 'window.location.href = "giris.php";';
echo '</script>';
    }

}

if(isset($_POST['register'])){
    $fname = mysqli_real_escape_string($conn, $_POST['fname']);
    $lname = mysqli_real_escape_string($conn, $_POST['lname']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $ssn = mysqli_real_escape_string($conn, $_POST['ssn']);
    $query3 = "SELECT * FROM users WHERE userEmail='$email'";
    $result3 = mysqli_query($conn, $query3);
    $query4 = "SELECT * FROM users WHERE userSsn='$ssn'";
    $result4 = mysqli_query($conn, $query4);
    
    if(mysqli_num_rows($result3) >=1){
        echo '<script type="text/javascript">'; 
echo 'alert("Email sistemde kayıtlı. Lütfen başka bir email deneyiniz!");'; 
echo 'window.location.href = "kayit.php";';
echo '</script>';
    }else if(mysqli_num_rows($result4) >=1){
        echo '<script type="text/javascript">'; 
    echo 'alert("TC Kimlik Numarası sistemde kayıtlı. Lütfen başka bir TC Kimlik Numarası deneyiniz!");'; 
    echo 'window.location.href = "kayit.php";';
    echo '</script>';
    }else{

    $password = mysqli_real_escape_string($conn, $_POST['password']);
    
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
}
