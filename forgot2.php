<?php 

session_start();
include 'dbconnect.php';

$mail = $_POST['email'];

$query4 = "SELECT userSsn FROM users WHERE userEmail = '$mail' ";
$result4 = mysqli_query($conn, $query4);
$count = mysqli_fetch_array($result4);
if(empty($count[0])){
    echo '<script type="text/javascript">'; 
echo 'alert("Kayıtlı email bilgisi girmelisiniz!");'; 
echo 'window.location.href = "forgot.php";';
echo '</script>';
}else{

$randomNumber = rand(1000,9999); 

$sql = "UPDATE users SET recoveryCode='$randomNumber' WHERE userEmail='$mail'";
$resultsql = mysqli_query($conn, $sql);

$to_email = "$mail";
$subject = ":: 🔑 Şifre Talebi ::";
$body = "Neutrinos Turizm'e kurtarma kodun $randomNumber .";
$headers = "From: neutrinos.turizm@gmail.com";
if (mail($to_email, $subject, $body, $headers)) {
    echo "Email successfully sent to $to_email...";
} else {
    echo "Email sending failed...";
}
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
    <title>Giriş</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="giris.css">
            </head>
            <body>  

            <div class="page">
                <div class="navbar">
                    <div class="left">
                    </div>
                    <div class="right">
                        <div class="list">
                            
                        </div>
                    </div>
                </div>

                <div class = "main">
                    <div class = "contain">
                        <div class = "c-row">
                            <div class = "giris">
                                <h3>Kurtarma kodu ile üye Girişi</h3>

                            </div>
                        </div>

                        <div class = "d-row">

                            <form class = "a-row" method="post" action="forgot3.php">
                                <div class="e-row">
                                    <label for="number" style= "margin-top:1rem">Kod:</label>
                                    <input placeholder="kurtarma kodu" required type="number" minlength="4" id="number" name="number" style="height: 100%;margin-top:1rem"/>
                                    <input type="hidden" id="mail" name="mail" value="<?php echo $mail ?>" />
                                </div>
                                <div class="e-row">
                                    <label for="password" style="padding-right: 5%">Yeni şifre:</label>
                                    <input placeholder="Yeni şifre" required type="password" minlength="4" id="password" name="password" style="height: 100%;"/>
                                </div>
                                <div class="submit" style="width:43%; padding-left:33%">
                                    <input type="submit" value="Kaydet" name="login" style="background-color: #E5FFCC;border-radius: 1rem;border-color: green;" />
                                </div>
                            </form> 
                        </div>

                    </div>

                </div>

                <div class="footer">
                    <div class="f-img">
                        <img src="photos/new_footer.jpg">
                    </div>
                    <div class="textt">
                        <p>Neutrinos Copyright © 2020. Tüm Hakları Saklıdır.</p>
                    </div>
                </div>
                </body>
                </html>

