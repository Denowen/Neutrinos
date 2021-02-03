<!DOCTYPE html>
<?php include 'dbconnect.php';
session_start();
$email = $_SESSION['email'];
//QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
$query = mysqli_query($conn, "select * from administrators where adminEmail = '$email'");
$counta = mysqli_num_rows($query);
if (!$counta) {
    header("location:home.php");
}


?>

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
                <div class="right2" style="flex-direction: column;">
                
                    <h1 style="
    display: flex;
    justify-content: center;
    color: white;
">Güncel Seferler</h1>
                    <table id = "tablez1" cellpadding="20" style="color: rgb(50 239 239 / 68%);flex: 2;">
                        <th><input type="text" id="input1" onkeyup="searchFilterFunction2()" placeholder="id, kalkış veya tren numarası giriniz" title="id, kalkış veya tren numarası giriniz" /></th>
                        <thead>
                            <th>Id</th>
                            <th>Kalkış</th>
                            <th>Varış</th>
                            <th>Kalkış Saati</th>
                            <th>Varış Saati</th>
                            <th>Kalkış Günü</th>
                            <th>Tren Numarası</th>
                            <th>Ücret</th>
                        </thead>
                        <tbody>
                            <?php
                            $today =  date('Y-m-d');
                            $query1 = mysqli_query($conn, "SELECT * FROM route WHERE dateOfRoute >= '$today'");
                            while ($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)) {
                                $routeId = $row['routeId'];

                                echo "<td> " . $row['routeId'] . " </td> "
                                    . "<td> " . $row['startingStationTerminal'] . " </td> "
                                    . "<td>" . $row['destinationStationTerminal'] . "</td>"
                                    . "<td>" . $row['departureTime'] . "</td>"
                                    . "<td> " . $row['arrivelTime'] . " </td> "
                                    . "<td>" . $row['dateOfRoute'] . "</td>"
                                    . "<td> " . $row['trainNumber'] . " </td> "
                                    . "<td> " . $row['price'] . " </td> "
                                    . "<form method='post' action='modifyRoute.php?varname=$routeId'>"
                                    . "<td> <button type='submit' class='btn' name='modifyRoute'>Rotayı Düzenle</button></a></td>"
                                    . "</form>"
                                    . "<form method='post' action='deleteRoute.php?varname=$routeId'>"
                                    . "<td> <button type='submit' class='btn' name='deleteRoute' onclick=\"return confirm('Rotayı silmek istediğinizden emin misiniz?')\">Rotayı Sil</button></a></td>"
                                    . "</form>"
                                    . "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                    <script>
                        function searchFilterFunction2() {
                            var input, filter, table, tr, td, i, txtValue;
                            input = document.getElementById("input1");
                            filter = input.value.toUpperCase();
                            table = document.getElementById("tablez1");
                            tr = table.getElementsByTagName("tr");
                            for (i = 0; i < tr.length; i++) {
                                td = tr[i].getElementsByTagName("td")[0];
                                td1 = tr[i].getElementsByTagName("td")[1];
                                td6 = tr[i].getElementsByTagName("td")[6];
                                if (td) {
                                    txtValue = td.textContent || td.innerText;
                                    txtValue1 = td1.textContent || td1.innerText;
                                    txtValue6 = td6.textContent || td6.innerText;
                                    

                                    if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue1.toUpperCase().indexOf(filter) > -1 ||
                                        txtValue6.toUpperCase().indexOf(filter) > -1) {
                                        tr[i].style.display = "";
                                    } else {
                                        tr[i].style.display = "none";
                                    }
                                }
                            }
                        }
                    </script>
                    
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
