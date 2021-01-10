<!DOCTYPE html>
<?php
session_start();
include('dbconnect.php');
//Checks the user if admin


if (!isset($_SESSION['loggedin'])) {
    header('location: home.php'); //IF THERE IS NO SESSION REDIRECT TO INDEX
} else { //IF SESSION EXISTS BUT THE VIEWER IS NOT ADMIN REDIRECT TO INDEX
    $email = $_SESSION['email'];
    $query = mysqli_query($conn, "select * from registeredusers where regUserEmail = '$email'");
    $counta = mysqli_num_rows($query);
    if ($counta) {
        header("location:home.php");
    }
}



?>





<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Paneli</title>
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


                <div class="right2" style="justify-content:center; align-items:center; color:white">
                    <h2>Admin Paneline Hoşgeldiniz!</h2>
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
