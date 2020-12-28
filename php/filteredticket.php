
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
    <title>Filtrelenmiş Biletler</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="filteredticket.css">
</head>
<body>    
    <?php
    session_start();
    include 'dbconnect.php';
    $ticket_ = $_POST['ticket'];
    $way_ = $_POST['way'];
    $_SESSION['way'] = $way_;
    $nereden_ = $_POST['nereden'];
    $nereye_ = $_POST['nereye'];
    $sdate_ = $_POST['sdate'];
    $edate_ = $_POST['edate'];
    
    if (isset($_SESSION['email'])) {
        $usermail = $_SESSION['email'];
        $count=0;
        }else{
            $count=1;
            header("Refresh: 5; url=giris.php");

            die('5 saniye sonra yönlendirileceksiniz. Beklemek için
            <a href="giris.php">Tıklayın.</a>');
        }

    if ($way_ == "çift") {
        $query2 = "SELECT * FROM Route WHERE dateOfRoute = '$edate_' and startingStationTerminal = '$nereye_' and destinationStationTerminal = '$nereden_'";
        $result2 = mysqli_query($conn, $query2);
        $num2 = mysqli_num_rows($result2);
    }
    if ($way_ == 'tek' || $way_ == 'çift') {
        $query = "SELECT * FROM Route WHERE dateOfRoute = '$sdate_' and startingStationTerminal = '$nereden_' and destinationStationTerminal = '$nereye_'";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
    }
    mysqli_close($conn);
    
    
    ?>
<div class="page">
    <div class="navbar">
        <div class="left">
        </div>
        <div class="right">
            <?php if($count=0){ ?>
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="kayit.php">Kayıt Ol</a>
                    <a href="contact.php">İletişim</a>
                    <a href="giris.php">Giriş Yap</a>
                </div>
                <?php } else{ ?>
                    <div class="list">
                    <a href="home2.php">Anasayfa</a>
                    <a href="hakkimizda2.php">Hakkımızda</a>
                    <a href="contact2.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="#">Çıkış Yap</a>
                </div>
                <?php } ?>
        </div>
    </div>

    <div class="box">
        <div class="contain">
            <div class="c-row">
                <h3>Filtreleme Sonucu: </h3>
                
            </div>
            <form class ="d-row" action="fillinfo.php" method='post'>
                <table cellpadding="10">


<?php
$i = 0;
if ($way_ == "çift" || $way_ == "tek") {

    echo" <h4>Gidiş</h4>";
    echo"<tr>";
    echo "<th>Tarih</th>";
    echo "<th>Nereden</th>";
    echo "<th>Nereye</th>";
    echo "<th>Saat</th>";
    echo "<th>Fiyat</th>";
    echo "<th></th>";
    echo "</tr>";

    while ($i < $num) {
        while ($count = mysqli_fetch_array($result)) {
            ?>                  <tr>

                                    <td><?php echo $count['dateOfRoute'] ?></td>
                                    <td><?php echo $count['startingStationTerminal'] ?></td>
                                    <td><?php echo $count['destinationStationTerminal'] ?></td>
                                    <td><?php echo $count['arrivelTime'] ?></td>
                                    <td><?php echo $count['price'] ?></td>
                                    <td><input type="radio" name="route1" value= '<?php echo $count['routeId'] ?>' />
                                    <?php $_SESSION['trainNumber'] = $count['trainNumber'] ?>
                                </td>

                                    

                                </tr>
            <?php
            $i++;
        }
    }
}
?>
                </table>

                <table cellpadding="10">

                    <?php
                    $i = 0;
                    if ($way_ == "çift") {

                        echo" <h4>Dönüş</h4>";
                        echo"<tr>";
                        echo "<th>Tarih</th>";
                        echo "<th>Nereden</th>";
                        echo "<th>Nereye</th>";
                        echo "<th>Saat</th>";
                        echo "<th>Fiyat</th>";
                        echo "<th></th>";
                        echo "</tr>";

                        while ($i < $num2) {
                            while ($count = mysqli_fetch_array($result2)) {
                                ?>

                                <tr>
                                    <td><?php echo $count['dateOfRoute'] ?></td>
                                    <td><?php echo $count['startingStationTerminal'] ?></td>
                                    <td><?php echo $count['destinationStationTerminal'] ?></td>
                                    <td><?php echo $count['arrivelTime'] ?></td>
                                    <td><?php echo $count['price'] ?></td>
                                    <td><input type="radio" name="route2" value= '<?php echo $count['routeId'] ?>' />
                                    <?php $_SESSION['trainNumber2'] = $count['trainNumber'] ?>
                                </td>
                                </tr>

            <?php
            $i++;
        }
    }
}
?>
                </table>


                <div class ="a-row">
                    <div class = "Devam Et">
                        <?php if($count != 1){ ?>
                        <input type="submit" name ='devam et' value="Devam Et" style="background-color: #E5FFCC;
                               border-radius: 1rem;
                               border-color: green;
                               width: 6rem;
                               height: 2rem;"/>
                        <?php } ?>
                    </div>

                </div>
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

</div>


</body>
</html>


