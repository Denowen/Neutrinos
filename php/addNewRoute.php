<!DOCTYPE html>
<?php include('dbconnect.php') ?>
<?php
session_start();
$query = "SELECT stationName FROM station ";
$result = mysqli_query($conn, $query);
$num = mysqli_num_rows($result);
$result2 = mysqli_query($conn, $query);
$num2 = mysqli_num_rows($result2);
?>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Paneli</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="user.css">



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
                    <a href="kayıt.php">Kayıt Ol</a>
                    <a href="contact.php">İletişim</a>
                    <a href="giris.php">Giriş Yap</a>
                </div>
            </div>
        </div>

        <div class="main">
            <div class="rows">
                <div class="left2">
                    <div class="title">
                        <h5><a class="a2" href="admin.php" style="font-size: 32px; text-decoration: none">Admin Paneli</a></h5>

                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="addNewRoute.php">Add new route</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allRouteList.php">All route list</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allPassengers.php">See All Passengers</a>
                    </div>
                </div>
                <div class="right2">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>

                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Arrivel Time</th>
                            <th>Departure Time</th>
                            <th>Date of the Route</th>
                            <th>Train Number</th>
                        </thead>
                        <tbody>
                            <td><select name="nereden" id="nereden" style="width: 160%;">
                                    <?php
                                    $i = 0;
                                    while ($i < $num) {
                                        while ($count = mysqli_fetch_array($result)) {
                                    ?>
                                            <option value="<?php echo $count['stationName'] ?>"><?php echo $count['stationName'] ?></option>
                                    <?php
                                            $i++;
                                        }
                                    }
                                    ?>
                                </select></td>
                            <td><select name="nereye" id="nereye" style="width: 160%;">

                                    <?php
                                    $i2 = 0;
                                    while ($i2 < $num2) {
                                        while ($count = mysqli_fetch_array($result2)) {
                                    ?>
                                            <option value="<?php echo $count['stationName'] ?>"><?php echo $count['stationName'] ?></option>
                                    <?php
                                            $i2++;
                                        }
                                    }
                                    ?>

                                </select>
                            </td>
                        </tbody>
                    </table>
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