<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kullanıcı</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="user.css">
    <style>
        .right2 td{
            color:white;
        }
        </style>

</head>
<body>    
   
<?php 
   session_start();
   include 'dbconnect.php';
   include 'delete.php';

   $email = $_SESSION['email'];
   //QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
   $query = mysqli_query($conn, "select * from registeredusers where regUserEmail = '$email'");
   $counta = mysqli_num_rows($query);
   if (!$counta) {
       header("location:admin.php");
   } 

   $email = $_SESSION['email'];


        $query9 = "SELECT regUserSsn, regUserName, regUserSurname, regUserEmail, regUserBirthdate, regUserTelephoneNumber FROM registeredusers WHERE regUserEmail='$email'";
        $result9 = mysqli_query($conn, $query9);
        $num9 = mysqli_num_rows($result9);
   ?>

    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="contact.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="signout.php">Çıkış Yap</a>
                </div>
            </div>
        </div>

        <div class = "main">
            <div class="rows">
                <div class="left2">
                    <div class="title">
                        <h1>Rezervasyonlarım</h1>
                    </div>
                    <table cellpadding="20" style=" display: flex;color: rgb(50 239 239 / 68%);">

                    <?php
                    $i9 = 0;
                    
                        while ($i9 < $num9) {
                            while ($count = mysqli_fetch_array($result9)) {
                                ?>

                                <tr>
                                    <th><?php echo "<th>Kimlik No:</th>"; ?></th>
                                    <td><?php echo $count['regUserSsn'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>İsim:</th>"; ?></th>
                                    <td><?php echo $count['regUserName'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>Soyisim:</th>"; ?></th>
                                    <td><?php echo $count['regUserSurname'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>Email:</th>"; ?></th>
                                    <td><?php echo $count['regUserEmail'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>Doğum Tarihi:</th>"; ?></th>
                                    <td><?php echo $count['regUserBirthdate'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>Telefon Numarası:</th>"; ?></th>
                                    <td><?php echo $count['regUserTelephoneNumber'] ?></td>
                                </tr>

            <?php
            $i9++;
        }
    }

?>
                </table>
                    <div class="p-ticket">
                        <a class="a2" href="user.php">Biletlerim</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="user2.php">Rezervasyonlarım</a>
                    </div>
                </div>
                <form class="right2" style="flex-direction: column;" action="editProfile.php" method="post">
                    
                <table cellpadding="100" style=" display: flex;color: rgb(50 239 239 / 68%);flex: 2;">
                    
                    <tr>
                    <th>Telefon Numarası:</th>
                    <td><input type="tel" pattern="[0-9]{11}" title="Lütfen 11 haneli Telefon Numaranızı giriniz." required id="tel3" name="tel3" style="height: 55%;" /></td>
                    </tr>
                    <tr>
                    <th>Email:</th>
                    <td><input type="email" required id="email3" name="email3" style="height: 100%;" /></td>
                    </tr>


                </table>

<div id="id1" class="buton">
                    <input type="submit" name ='buton' value="Kaydet" style="background-color: #E5FFCC;
                               border-radius: 1rem;
                               border-color: green;
                               width: 6rem;
                               height: 2rem;"/>
                </div>

                </form>
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

