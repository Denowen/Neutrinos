<!DOCTYPE html>
<?php include 'dbconnect.php';
    session_start();
    $email = $_SESSION['email'];
    //QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
    $query = mysqli_query($conn, "select * from administrators where adminEmail = '$email'");
    $counta = mysqli_num_rows($query);
    if (!$counta) {
        header("location:home.php");
    }  ?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Tüm Biletler</title>
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
                <div class="right2">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>
                            <th>PNR</th>
                            <th>Yolcu Adı</th>
                            <th>Yolcu Soyadı</th>
                            <th>Yolcu TCKN</th>
                            <th>Kalkış Yeri</th>
                            <th>Varış Yeri</th>
                            <th>Kalkış Saati</th>
                            <th>Kalkış Günü</th>
                            <th>Koltuk Numarası</th>
                        </thead>
                        <tbody>
                            <?php
                            //PRINT ALL ROUTES
                            $query1 = mysqli_query($conn, "SELECT t.PNR, t.passengerName, t.passengerSurname, t.passengerSsn, r.startingStationTerminal, r.destinationStationTerminal, r.departureTime,r.dateOfRoute,t.seatNumber FROM route r, ticket t WHERE t.routeId = r.routeId");
                            while ($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)) {


                                echo "<td> " . $row['PNR'] . " </td> "
                                    . "<td> " . $row['passengerName'] . " </td> "
                                    . "<td> " . $row['passengerSurname'] . " </td> "
                                    . "<td>" . $row['passengerSsn'] . "</td>"
                                    . "<td>" . $row['startingStationTerminal'] . "</td>"
                                    . "<td>" . $row['destinationStationTerminal'] . "</td>"
                                    . "<td>" . $row['departureTime'] . "</td>"
                                    . "<td>" . $row['dateOfRoute'] . "</td>"
                                    . "<td> " . $row['seatNumber'] . " </td> "
                                    . "</tr>";
                            }
                            ?>
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
