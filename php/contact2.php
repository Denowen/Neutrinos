<?php
$konu = $_POST['konu'];
$mesaj = $_POST['message'];
$isim = $_POST['firstname'];
$soyisim = $_POST['lastname'];
$mail = $_POST['email'];



$to_email = "neutrinos.turizm@gmail.com";
$subject = "$konu $mail";
$body = "$mesaj";
$headers = "From: $isim $soyisim";

if (mail($to_email, $subject, $body, $headers)) {
    echo '<script type="text/javascript">'; 
echo 'alert("Mesajınız gönderildi.");'; 
echo 'window.location.href = "home.php";';
echo '</script>';
} else {
    echo '<script type="text/javascript">'; 
echo 'alert("Mesajınız gönderilemedi tekrar deneyiniz.");'; 
echo 'window.location.href = "contact.php";';
echo '</script>';
}

?>