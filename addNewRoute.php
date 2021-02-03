<!DOCTYPE html>
<?php include 'dbconnect.php';
session_start();
$email = $_SESSION['email'];
//QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
$query = mysqli_query($conn, "select * from administrators where adminEmail = '$email'");
$counta = mysqli_num_rows($query);
if (!$counta) {
    header("location:home.php");
} ?>
<?php
session_start();

$email = $_SESSION['email'];
//QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
$query = mysqli_query($conn, "select * from administrators where adminEmail = '$email'");
$counta = mysqli_num_rows($query);
if (!$counta) {
    header("location:home.php");
}

$query = "SELECT stationName FROM station ";
$result = mysqli_query($conn, $query);
$num = mysqli_num_rows($result);
$result2 = mysqli_query($conn, $query);
$num2 = mysqli_num_rows($result2);
$sql = mysqli_query($conn, "SELECT trainNumber FROM train");
$num3 = mysqli_num_rows($sql);
?>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Yeni Rota Ekle</title>
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
                    <a href="signout.php">Çıkış Yap</a>
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
                        <a class="a2" href="addNewRoute.php">Yeni Rota Ekle</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allRouteList.php">Güncel Rotalar</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allRouteList2.php">Geçmiş Rotalar</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allPassengers.php">Yolcuları Listele</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allTicketList.php">Biletleri Listele</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="addNewTrain.php">Yeni Tren Ekle</a>
                    </div>
                     <div class="p-ticket">
                        <a class="a2" href="allTrains.php">Trenleri Listele</a>
                    </div>
                </div>
                <form class="right2" style="flex-direction: column;" action="addRoute.php" method="post">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>

                            <th>Kalkış</th>
                            <th>Varış</th>
                            <th>Kalkış Saati</th>
                            <th>Varış Saati</th>
                            <th>Kalkış Günü</th>
                            <th>Tren Numarası</th>
                            <th>Ücret</th>
                        </thead>
                        <tbody>
                            <td><select name="nereden" id="nereden" style="width: 100%;">
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
                            <td><select name="nereye" id="nereye" style="width: 100%;">

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

                            <td>

                                <select name="saat" id="saat" style="width: 100%;">
                                    <?php
                                    $time1 = 1;
                                    while ($time1 <= 24 and $time1 >= 1) {
                                        echo $time1;
                                    ?>
                                        <option value="<?php echo $time1 ?>"><?php echo $time1 ?>:00</option>
                                    <?php

                                        $time1++;
                                    }

                                    ?>
                                    < </td>

                            <td>

                                <select name="saat2" id="saat2" style="width: 100%;">
                                    <?php
                                    $time2 = 1;
                                    while ($time2 <= 24 and $time2 >= 1) {
                                        echo $time2;
                                    ?>
                                        <option value="<?php echo $time2 ?>"><?php echo $time2 ?>:00</option>
                                    <?php

                                        $time2++;
                                    }

                                    ?>
                                    < </td>

                            <td>

                                <input onclick="dateConstraint()" class="input" id="routeDate" type="date" name="date" value="<?php echo $date ?>"></input>

                            </td>
                            <script>
                                function dateConstraint() {
                                    var today = new Date().toISOString().split('T')[0];
                                    document.getElementsByName("date")[0].setAttribute('min', today);
                                }
                            </script>

                            <td>
                                <select name="trainNumber" id="trainNumber" style="width: 120%">
                                    <?php
                                    $i3 = 0;
                                    while ($i3 < $num3) {
                                        while ($count3 = mysqli_fetch_array($sql)) {
                                    ?>
                                            <option value="<?php echo $count3['trainNumber'] ?>"><?php echo $count3['trainNumber'] ?></option>
                                    <?php
                                            $i3++;
                                        }
                                    }
                                    ?>
                            </td>
                            </select>

                            <td>
                                <input class="input" type="number" id="price" name="price" style="width:50%" value="price" onkeypress="return event.charCode >= 48" min="1">
                            </td>

                        </tbody>
                    </table>
                    <div class="buton" style="display: flex; justify-content: flex-end;">
                        <input type="submit" name='İptal Et' value="Rotayı Ekle">
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
