<!DOCTYPE html>
<?php include('dbconnect.php') ?>
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
                <div class="right2">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>
                            <th>PNR</th>
                            <th>Passenger Name</th>
                            <th>Passenger Surname</th>
                            <th>Passenger Ssn</th>
                            <th>Start Terminal</th>
                            <th>Destination Terminal</th>
                            <th>Dep. Time</th>
                            <th>Date of the Route</th>
                            <th>Seat Num</th>
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
