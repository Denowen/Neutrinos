<!DOCTYPE html>
<?php include('dbconnect.php') ?>
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
