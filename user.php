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

   $query = "SELECT b.PNR, b.totalPrice, r.startingStationTerminal, r.destinationStationTerminal, r.departureTime, r.dateOfRoute, b.seatNumber FROM registeredusers a, buy b, route r WHERE a.regUserEmail='$email' and a.regUserSsn=b.reguserSsn and b.routeId=r.routeId";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);

        $query9 = "SELECT userSsn, userName, userSurname, userEmail FROM users WHERE userEmail='$email'";
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
                        <h1>Biletlerim</h1>
                    </div>
                    <table cellpadding="20" style=" display: flex;color: rgb(50 239 239 / 68%);">

                    <?php
                    $i9 = 0;
                    
                        while ($i9 < $num9) {
                            while ($count = mysqli_fetch_array($result9)) {
                                ?>

                                <tr>
                                    <th><?php echo "<th>Kimlik No:</th>"; ?></th>
                                    <td><?php echo $count['userSsn'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>İsim:</th>"; ?></th>
                                    <td><?php echo $count['userName'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>Soyisim:</th>"; ?></th>
                                    <td><?php echo $count['userSurname'] ?></td>
                                </tr>
                                <tr>    
                                    <th><?php echo "<th>Email:</th>"; ?></th>
                                    <td><?php echo $count['userEmail'] ?></td>
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
                <form class="right2" style="flex-direction: column;" action="cancelAndDrop.php" method="post">
                    
                <table cellpadding="30" style=" display: flex;color: rgb(50 239 239 / 68%);flex: 2;">

                    <?php
                    $i = 0;
                    

                        echo"<tr>";
                        echo "<th>PNR</th>";
                        echo "<th>Fiyat</th>";
                        echo "<th>Nereden</th>";
                        echo "<th>Nereye</th>";
                        echo "<th>Saat</th>";
                        echo "<th>Tarih</th>";
                        echo "<th>Koltuk Numarası</th>";
                        echo "</tr>";

                        while ($i < $num) {
                            while ($count = mysqli_fetch_array($result)) {
                                ?>

                                <tr>
                                    <td><?php echo $count['PNR'] ?></td>
                                    <td><?php echo $count['totalPrice'] ?></td>
                                    <td><?php echo $count['startingStationTerminal'] ?></td>
                                    <td><?php echo $count['destinationStationTerminal'] ?></td>
                                    <td><?php echo $count['departureTime'] ?></td>
                                    <td><?php echo $count['dateOfRoute'] ?></td>
                                    <td><?php echo $count['seatNumber'] ?></td>
                                    <td><input type="radio" name="cancel" value= '<?php echo $count['PNR'] ?>' /></td>
                                </td>
                                </tr>

            <?php
            $i++;
        }
    }

?>
                </table>
                <div class="buton" style="display: flex; justify-content: flex-end;">
                    <input type="submit" name ='İptal Et' value="İptal Et" style="background-color: #E5FFCC;
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

