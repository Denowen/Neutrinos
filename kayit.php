<?php include('login.php')?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kayıt Ol</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="kayit.css">
</head>
<body>    
   
    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="kayit.php">Kayıt Ol</a>
                    <a href="contact.php">İletişim</a>
                    <a href="giris.php">Giriş Yap</a>
                </div>
            </div>
        </div>

        <div class="main">
            <div class="contain">
                <div class="c-row">
                    <div class="row">
                        <div class="account">
                            <h2>Üyelik Bilgilerim</h2>
                        </div>
                    </div>
                </div>
                <div class="c-row">
                    <form class="a-row" method="post" action="login.php">
                        <div class="d-row">
                            <label for="fname" style="padding-right: 23%;">İsim</label>
                            <input type="text" placeholder="isim" required id="name" name="fname" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="lname" style="padding-right: 13%;">Soyisim</label>
                            <input type="text" required  placeholder="soyisim" id="name" name="lname" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="email" style="padding-right: 19%;">Email</label>
                            <input type="email" required id="email" name="email" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="password" style="padding-right: 22%;">Şifre</label>
                            <input type="password" required id="password" minlength="4" name="password" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="ssn" style="padding-right: 1%;">TC Kimlik No</label>
                            <input type="text" required id="ssn" maxlength="11" minlength="11" name="ssn" style="height: 56%;" />
                        </div>
                        <div class="d-row">
                            <label for="date">Doğum Tarihi</label>
                            <input type="date" required id="date" name="bdate" style="height: 100%; width: 64%;"/>
                        </div>
                        <div class="d-row">
                            <label for="tel" style="padding-right: 24%;">Cep No</label>
                            <input type="tel" required id="tel" maxlength="11" minlength="11" name="tel" style="height: 55%;" />
                        </div>
                        <div class="b-row">
                            <div class="reset">
                                <input type="reset" style="background-color: #FFCCCC;border-radius: 1rem;border-color: red;">
                            </div>
                            <div class="submit" style="width:26%">
                                <input type="submit" value="Kaydet"  name="register" style="background-color: #E5FFCC;border-radius: 1rem;border-color: green;" />
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


