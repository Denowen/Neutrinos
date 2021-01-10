<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>İletişim</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="contact.css">
    
</head>
<body> 
    
    <?php


    $email = $_SESSION['email'];
    //QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
    $query = mysqli_query($conn, "select * from registeredusers where regUserEmail = '$email'");
    $counta = mysqli_num_rows($query);
    if (!$counta) {
        header("location:admin.php");
    } 



?>

<?php
    include 'delete.php';
    if (isset($_SESSION['email'])) {
        $usermail = $_SESSION['email'];
        $count=0;
        }else{
            $count=1;           
        }

    mysqli_close($conn);
  ?>

<div class="page">
    <div class="navbar">
        <div class="left">
        </div>
        <div class="right">
        <?php if($count==1){ ?>
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="kayit.php">Kayıt Ol</a>
                    <a href="contact.php">İletişim</a>
                    <a href="giris.php">Giriş Yap</a>
                </div>
                <?php } else{ ?>
                    <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="contact.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="signout.php">Çıkış Yap</a>
                </div>
                <?php } ?>
        </div>
    </div>
    
    <div class="main">
        <div class="contain">
            <div class="head">
                <img src="photos/İletişim.jpg">
            </div>
            <div class="c-form">
                <form class="form" action="contact2.php" method="post">
                    <div class="box1">
                        <div class="b1-1">
                            <label for="fname">İsim</label>
                        </div>
                        <div class="b1-2">
                            <input type="text" required id="fname" name="firstname" placeholder="İsminiz">
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1">
                            <label for="lname">Soyisim</label>
                        </div>
                        <div class="b1-2">
                            <input type="text" required id="lname" name="lastname" placeholder="Soyisminiz">
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1">
                            <label for="email">Mail</label>
                        </div>
                        <div class="b1-2">
                            <input type="email" required id="email" name="email" placeholder="Mail Adresiniz">
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1">
                            <label for="konu">İletişim Konusu</label>
                        </div>
                        <div class="b1-2a">
                            <select id="konu" name="konu">
                                <option value="soru">Soru</option>
                                <option value="öneri">Öneri</option>
                                <option value="şikayet">Şikayet</option>
                              </select>
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1">
                            <label for="message">Mesaj</label>
                        </div>
                        <div class="b1-2">
                            <textarea id="message" required name="message" placeholder="Mesajınızı yazınız"></textarea>
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1a">
                            <input type="submit" value="Gönder">
                        </div>
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
    
</div>

</body>
</html>




