
<?php include('login.php')?>

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
                            <a href="home.php">Anasayfa</a>
                            <a href="hakkimizda.php">Hakkımızda</a>
                            <a href="kayit.php">Kayıt Ol</a>
                            <a href="contact.php">İletişim</a>
                            <a href="giris.php">Giriş Yap</a>
                        </div>
                    </div>
                </div>

                <div class = "main">
                    <div class = "contain">
                        <div class = "c-row">
                            <div class = "giris">
                                <h3>Üye Girişi</h3>

                            </div>
                        </div>

                        <div class = "d-row">

                            <form class = "a-row" method="post" action="login.php">
                                <div class="e-row">
                                    <label for="email" style= "margin-top:1rem">E-mail:</label>
                                    <input placeholder="E-mail" type="email" id="email" name="email" style="height: 100%;margin-top:1rem"/>
                                </div>
                                <div class="e-row">
                                    <label for="password" style="padding-right: 5%">Şifre:</label>
                                    <input placeholder="Password" type="password" id="password" name="password" style="height: 100%;"/>
                                </div>
                                <div class="submit" style="width:43%; padding-left:33%">
                                    <input type="submit" value="Giriş Yap" name="login" style="background-color: #E5FFCC;border-radius: 1rem;border-color: green;" />
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

                <?php
                include("dbconnect.php");

                $username = mysqli_real_escape_string($conn, filter_input(INPUT_POST, 'username'));
                $passwrd = mysqli_real_escape_string($conn, filter_input(INPUT_POST, 'psw'));

                if (($username == "") or ( $passwrd == "")) {
                    exit();
                } else {
                    $query = mysqli_query($conn, "select * from administrator where adminEmail = '$username' and adminPassword = '$passwrd'");
                    $row = mysqli_fetch_array($query, MYSQLI_ASSOC);
                    $count = mysqli_num_rows($query);
                    if ($count == 1) {
                        $_SESSION['username'] = $username;
                        
                    }
                }
                    ?>
