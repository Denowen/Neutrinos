
<?php include('login.php')?>

<?php
 session_start();
 include 'dbconnect.php';
 $email = $_SESSION['email'];
 $query2 = "SELECT PNR FROM buy where creditCardNumber = '0'";
 $result2 = mysqli_query($conn, $query2);
 $num2 = mysqli_num_rows($result2);
 while ($i < $num2) {
  while ($count = mysqli_fetch_array($result2)) {
      $query3 = "DELETE FROM ticket WHERE PNR = '$count[0]'";
      $result3 = mysqli_query($conn, $query3);
      $query4 = "DELETE FROM buy WHERE PNR = '$count[0]'";
      $result4 = mysqli_query($conn, $query4);

   $i++;   
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
