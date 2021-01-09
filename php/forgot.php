
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
                            
                        </div>
                    </div>
                </div>

                <div class = "main">
                    <div class = "contain">
                        <div class = "c-row">
                            <div class = "giris">
                                <h3>Şifremi Unuttum</h3>

                            </div>
                        </div>

                        <div class = "d-row">

                            <form class = "a-row" method="post" action="forgot2.php">
                                <div class="e-row">
                                    <label for="email" style= "margin-top:1rem">E-mail:</label>
                                    <input placeholder="E-mail" required type="email" id="email" name="email" style="height: 100%;margin-top:1rem"/>
                                </div>
                                <div class="submit" style="width:43%; padding-left:33%">
                                    <input type="submit" value="Şifremi Unuttum" name="login" style="background-color: #E5FFCC;border-radius: 1rem;border-color: green;" />
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
