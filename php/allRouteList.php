<!DOCTYPE html>
<?php include('dbconnect.php') ?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Tüm Rotalar</title>
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
                </div>
                <div class="right2">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>
                            <th>Id</th>
                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Arrivel Time</th>
                            <th>Departure Time</th>
                            <th>Date of the Route</th>
                            <th>Train Number</th>
                            <th>Price</th>
                        </thead>
                        <tbody>
                            <?php
                            //PRINT ALL ROUTES
                            $query1 = mysqli_query($conn, "SELECT * FROM route");
                            while ($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)) {
                                $routeId = $row['routeId'];

                                echo "<td> " . $row['routeId'] . " </td> "
                                    . "<td> " . $row['startingStationTerminal'] . " </td> "
                                    . "<td>" . $row['destinationStationTerminal'] . "</td>"
                                    . "<td> " . $row['arrivelTime'] . " </td> "
                                    . "<td>" . $row['departureTime'] . "</td>"
                                    . "<td>" . $row['dateOfRoute'] . "</td>"
                                    . "<td> " . $row['trainNumber'] . " </td> "
                                    . "<td> " . $row['price'] . " </td> "
                                    . "<form method='post' action='modifyRoute.php?varname=$routeId'>"
                                    . "<td> <button type='submit' class='btn' name='modifyRoute'>Modify Route</button></a></td>"
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
