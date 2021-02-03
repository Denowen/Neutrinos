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
    <title>Yeni Tren Ekle</title>
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
                <form class="right2" style="flex-direction: column;" action="addTrain.php" method="post">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>

                            <th>Tren Numarası</th>
                            <th>Kapasite</th>
                        </thead>
                        <tbody>
                            <td>
                            <input placeholder="Tren Numarası"  id="trainNumber" name="trainNumber" style="height: 100%;margin-top:1rem; margin-left:10rem;" />
                                </td>
                            <td>

                            <td>

                                <select name="kapasite" id="kapasite" style="width: 20%;margin-right:35rem;">
                                    <?php
                                    $time1 = 40;
                                    while ($time1 <= 200 and $time1 >= 40) {
                                        echo $time1;
                                    ?>
                                        <option value="<?php echo $time1 ?>"><?php echo $time1 ?></option>
                                    <?php

                                        $time1++;
                                    }

                                    ?>
                                     </td>

                            

                        </tbody>
                    </table>
                    <div class="buton" style="display: flex; justify-content: flex-end;">
                        <input type="submit" name='İptal Et' value="Treni Ekle">
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
