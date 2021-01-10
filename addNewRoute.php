<!DOCTYPE html>
<?php include('dbconnect.php') ?>
<?php
session_start();
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
                        <a class="a2" href="addNewRoute.php">Add new route</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allRouteList.php">All route list</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allPassengers.php">See All Passengers</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allTicketList.php">All Ticket List</a>
                    </div>
                </div>
                <form class="right2" style="flex-direction: column;" action="addRoute.php" method="post">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>

                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Departure Time</th>
                            <th>Date of the Route</th>
                            <th>Train Number</th>
                            <th>Price</th>
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

                                <select name="saat" id="saat" style="width: 50%;">
                                    <?php
                                    $time1 = 0;
                                    while ($time1 <= 24 and $time1 >= 0) {
                                        echo $time1;
                                    ?>
                                        <option value="<?php echo $time1 ?>"><?php echo $time1 ?>:00</option>
                                    <?php

                                        $time1++;
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
                                <input class ="input" type="number" id="price" name="price" style="width:50%"  value="price">
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
