<!DOCTYPE html>
<?php include('dbconnect.php') ?>
<?php
//GET TICKET ID AND ACCORDING TO THAT ID, SELECT ATTRIBUTES FROM DATABASE AND FILL THEM.
$routeId = $_GET['varname'];
$sql = "SELECT * FROM route WHERE routeId='$routeId'";
$query = mysqli_query($conn, $sql);
$routeArray = mysqli_fetch_assoc($query);
$routeId = $routeArray['routeId'];
$startingStationTerminal = $routeArray['startingStationTerminal'];
$destinationStationTerminal = $routeArray['destinationStationTerminal'];
$arrivelTime = $routeArray['arrivelTime'];
$departureTime = $routeArray['departureTime'];
$dateOfRoute = $routeArray['dateOfRoute'];
$trainNumber = $routeArray['trainNumber'];
$price = $routeArray['price'];
$count = mysqli_num_rows($query);
if ($count == 0) {
    echo "no such route exist";
}
//END OF FILLING ATTRIBUTES




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
                        <h1>Admin Paneli</h1>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="#">Add new route</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="#">All route list</a>
                    </div>
                    <div class="p-ticket">
                        <a class="a2" href="allPassengers.php">See All Passengers</a>
                    </div>
                </div>
                <div class="right2">
                <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>

                            <th>İsim</th>
                            <th>Soyisim</th>
                            <th>Email</th>
                            <th>Telefon numarası</th>
                        </thead>
                        <tbody style="text-align: center; color: white;">
                            <?php
                            //PRINT ALL ROUTES
                            $query1 = mysqli_query($conn, "SELECT r.regUserName, r.regUserSurname, r.regUserEmail, r.regUserTelephoneNumber FROM ticket t, registeredusers r where t.routeId='$routeId' and t.reguserSsn=r.regUserSsn");
                            while($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)){

                                echo 
                                "<td> " . $row['regUserName'] . " </td> "
                                . "<td>" . $row['regUserSurname'] . "</td>"
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
