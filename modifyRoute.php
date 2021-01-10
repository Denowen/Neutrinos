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

$routeId = $_GET['varname'];

if ($count == 0) {
    echo "no such route exist";
}





?>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Modify Route</title>
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
                <form class="right2" action="modRoute.php" method="post">
                    <table cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <thead>
                            <th>Route Id</th>
                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Departure Time</th>
                            <th>Arrivel Time</th>
                            <th>Date of the Route</th>
                            <th>Train Number</th>
                            <th>Price</th>
                        </thead>
                        <tbody>
                            <?php
                            //PRINT ALL ROUTES
                            $query1 = mysqli_query($conn, "SELECT * FROM route where routeId='$routeId'");
                            while ($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)) {
                                $routeId = $row['routeId'];

                                echo

                                    "<td> " . $row['routeId'] . " </td> "
                                        .  "<td> " . $row['startingStationTerminal'] . " </td> "
                                        . "<td>" . $row['destinationStationTerminal'] . "</td>"
                                        . "<td> " . $row['departureTime'] . " </td> "
                                        . "<td>" . $row['arrivelTime'] . "</td>"
                                        . "<td>" . $row['dateOfRoute'] . "</td>"
                                        . "<td> " . $row['trainNumber'] . " </td> "
                                        . "<td>" . $row['price'] . "</td>"
                                        . "<tr>"
                                        . "<td> " . "<input class=\"input\" type=\"number\" id=\"routeId\" name=\"routeId\" style=\"width:100%\" value=\"$routeId\" onkeypress=\"return event.charCode >= 48\" min=\"1\" readonly>" . " </td> "
                                        . "<td> " . $row['startingStationTerminal'] . " </td> "
                                        . "<td> " . $row['destinationStationTerminal'] . " </td> ";
                            }
                            ?>
                            <td>
                                <select name="saat" id="saat" style="width: 100%;">
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
                            </td>
                            <td></td>
                            <td>
                                <input onclick="dateConstraint()" class="input" id="routeDate" type="date" name="date" value="<?php echo $date ?>"></input>
                            </td>
                            
                            <td><?php
                                $query1 = mysqli_query($conn, "SELECT * FROM route where routeId='$routeId'");
                                while ($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)) {
                                    $routeId = $row['routeId'];
                                    echo $row['trainNumber']

                                        . "<td>"
                                        . "<input class=\"input\" type=\"number\" id=\"price\" name=\"price\" style=\"width:100%\" value=\"price\" onkeypress=\"return event.charCode >= 48\" min=\"1\">"
                                        . "</td>"
                                        . "<form method='post' action='modRoute.php?varname=$routeId'>"
                                        . "<td> <button type='submit' class='btn' name='modifyRoute'>Modify Route</button></a></td>"
                                        . "</form>";
                                }
                                ?>
                            </td>

                        </tbody>
                    </table>
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
