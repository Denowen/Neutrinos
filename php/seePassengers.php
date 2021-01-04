<!DOCTYPE html>
<?php include('dbconnect.php') ?>
<?php
//GET TICKET ID AND ACCORDING TO THAT ID, SELECT ATTRIBUTES FROM DATABASE AND FILL THEM.
$routeId = $_GET['varname'];
$sql = "SELECT * FROM route WHERE ticketId='$routeId'";
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
    <title>Hakkımızda</title>
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

                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Arrivel Time</th>
                            <th>Departure Time</th>
                            <th>Date of the Route</th>
                            <th>Train Number</th>
                        </thead>
                        <tbody>
                            <?php
                            //PRINT ALL ROUTES
                            $query1 = mysqli_query($conn, "SELECT * FROM route where routeId='$routeId'");
                            while($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)){
                                $routeId =$row['routeId'];

                                echo 
                                "<td> " . $row['startingStationTerminal'] . " </td> "
                                . "<td>" . $row['destinationStationTerminal'] . "</td>"
                                . "<td> " . $row['arrivelTime'] . " </td> "
                                . "<td>" . $row['departureTime'] . "</td>"
                                . "<td>" . $row['dateOfRoute'] . "</td>"
                                . "<td> " . $row['trainNumber'] . " </td> "
                                //. "<form method='post' action='modifyRoute.php?varname=$trainName'>"
                                . "<td> <button type='submit' class='btn' name='acceptBooking'>Modify Route</button></a></td>"
                                . "</form>"
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