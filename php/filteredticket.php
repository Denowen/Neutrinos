
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
    <title>Filtrelenmiş Biletler</title>

    <style>
        * {
            font-family: Arial;
        }
        .page{
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
            display: flex;
            flex: 1;
            flex-direction: column;
        }
        .navbar{
            display: flex;
            flex-direction: row;
            height: 10rem;
            background-color: black;
        }
        .left{
            display: flex;
            flex: 1;
            background-image: url(photos/Untitled\ Design.jpg);
        }
        .right{
            display: flex;
            flex: 1;
            align-items: center;
            justify-content: center;
            background-color: black;
        }
        .list{
            display: flex;
            flex: 1;
            max-width: 70%;
        }
        .list a{
            display: flex;
            flex: 1;
            align-items: center;
            justify-content: center;
            height: 2rem;
            border-radius: 5rem;
            text-decoration: none;
            color: rgba(255, 255, 255, 0.836);
            border-style: solid;
            border-color: rgba(0, 128, 128, 0.678);
            margin: 1%;
        }
        .list a:hover{
            color: red;
        }

        .footer{
            display: flex;
            flex-direction: column;
            background-color:black;
        }
        .f-img{
            display: flex;
            justify-content: center;
            padding-top: 1rem;
        }
        .textt{
            display: flex;
            justify-content: center;
            color: white;
        }
        .box{
            display: flex;
            flex: 1;
            justify-content: center;
            background-image: url(photos/background.jpg);
            background-repeat: no-repeat;
            background-size: cover;
        }
        .contain{
            display: flex;
            flex: 1;
            max-width: 70%;
            flex-direction: column;
            align-items: center;
        }
        .c-row{
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: outset;
            border-radius: 5rem;
            background-color: whitesmoke;
            border-color:rgba(0, 128, 128, 0.678);
            border-width: 0.3rem;
            filter: opacity(0.9);
            width: 48rem;

        }
        .row{
            display: flex;
            flex: 1;
            flex-direction: row;
            padding: 1%;
        }

        .d-row{
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 1rem;
            margin-bottom: 1rem;
            border: outset;
            border-radius: 5rem;
            background-color: whitesmoke;
            border-color:rgba(0, 128, 128, 0.678);
            border-width: 0.3rem;
            filter: opacity(0.9);
            width: 50rem;
        }

        .a-row{
            display: flex;
            flex-direction: row;

        }

        .buy{
            display: flex;
            padding: 1rem;
        }

        .book{
            display: flex;
            padding: 1rem;
        }






    </style>
</head>
<body>    
    <?php
    include 'dbconnect.php';
    $ticket_ = $_POST['ticket'];
    $way_ = $_POST['way'];
    $nereden_ = $_POST['nereden'];
    $nereye_ = $_POST['nereye'];
    $sdate_ = $_POST['sdate'];
    $query = "SELECT * FROM Route WHERE dateOfRoute = '$sdate_' and startingStationTerminal = '$nereden_' and destinationStationTerminal = '$nereye_'";

    $result = mysqli_query($conn, $query);
    $num = mysqli_num_rows($result);
    mysqli_close($conn);
    ?>
<div class="page">
    <div class="navbar">
        <div class="left">
        </div>
        <div class="right">
            <div class="list">
                <a href="home.php">Anasayfa</a>
                <a href="hakkimizda.php">Hakkımızda</a>
                <a href="kayit.php">Kayıt Ol</a>
                <a href="contact.php">İletişim</a>
                <a href="giris.php">Giriş Yap</a>
            </div>
        </div>
    </div>

    <div class="box">
        <div class="contain">
            <div class="c-row">
                <h3>Filtreleme Sonucu: </h3>
            </div>
            <div class ="d-row">
                 <table cellpadding="3">
                    <tr>
                        <th>Tarih</th>
                        <th>Nereden</th>
                        <th>Nereye</th>
                        <th>Saat</th>
                        <th></th>
                    </tr>

<?php
$i = 0;
while ($i < $num) {
    while ($count = mysqli_fetch_array($result)) {
        ?>

                            <tr>
                                <td><?php echo $count['dateOfRoute'] ?></td>
                                <td><?php echo $count['startingStationTerminal'] ?></td>
                                <td><?php echo $count['destinationStationTerminal'] ?></td>
                                <td><?php echo $count['departureTime'] ?></td>
                                <td>
                                <div class ="a-row">
                    <div class = "buy">
                        <form action= "fillinfo.html">
                            <input type="submit" value="Satın Al" style="background-color: #E5FFCC;
                                   border-radius: 1rem;
                                   border-color: green;
                                   width: 6rem;
                                   height: 2rem;"/>
                        </form></div>
                                    
                    <div class="book">
                        <form action= "fillinfo2.html">
                            <input type="submit" value="Rezervasyon" style="background-color: #E5FFCC;
                                   border-radius: 1rem;
                                   border-color: green;
                                   width: 6rem;
                                   height: 2rem;"/>
                        </form></div>
                </div>
                </td>
                            </tr>
                            

        <?php
        $i++;   
    }   
}
?>
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

</div>


</body>
</html>


