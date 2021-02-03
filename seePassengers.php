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
<?php
//GET TICKET ID AND ACCORDING TO THAT ID, SELECT ATTRIBUTES FROM DATABASE AND FILL THEM.
$routeId = $_GET['varname'];
if ($count == 0) {
    echo "no such route exist";
}





?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Yolcu Listesi</title>
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
                        <h1>Admin Paneli</h1>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="addNewRoute.php">Yeni Rota Ekle</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allRouteList.php">Rotaları Listele</a>
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

                            <th>Kimlik Numarası</th>
                            <th>İsim</th>
                            <th>Soyisim</th>
                            <th>Email</th>
                            <th>Telefon numarası</th>
                        </thead>
                        <tbody style="text-align: center; color: white;">
                            <?php
                            //PRINT ALL ROUTES
                            $query1 = mysqli_query($conn, "SELECT t.passengerSsn, t.passengerName, t.passengerSurname, r.regUserEmail, r.regUserTelephoneNumber FROM ticket t, registeredusers r where t.routeId='$routeId' and t.reguserSsn=r.regUserSsn");
                            while($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)){

                                echo 
                                "<td> " . $row['passengerSsn'] . " </td> "
                                . "<td>" . $row['passengerName'] . "</td>"
                                . "<td>" . $row['passengerSurname'] . "</td>"
                                . "<td>" . $row['regUserEmail'] . "</td>"
                                . "<td>" . $row['regUserTelephoneNumber'] . "</td>"
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
