<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Anasayfa</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="arama.css">
    <link rel="stylesheet" type="text/css" href="slider.css">
    
    
</head>
<body> 
    <?php
    session_start();
    include 'dbconnect.php';
    $query = "SELECT stationName FROM station ";


    $result = mysqli_query($conn, $query);
    $num = mysqli_num_rows($result);
    $result2 = mysqli_query($conn, $query);
    $num2 = mysqli_num_rows($result2);

    if (isset($_SESSION['email'])) {
        $usermail = $_SESSION['email'];
        $count=0;
        }else{
            $count=1;           
        }

    mysqli_close($conn);
  ?>

  <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
            <?php if($count==1){ ?>
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="kayit.php">Kayıt Ol</a>
                    <a href="contact.php">İletişim</a>
                    <a href="giris.php">Giriş Yap</a>
                </div>
                <?php } else{ ?>
                    <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="contact.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="signout.php">Çıkış Yap</a>
                </div>
                <?php } ?>
            </div>
        </div>
        
        
        <div class="box">
            <div class="contain">
                
                <div id="slider">
                    <figure>
                          <img src="photos/CORONA.jpg" style="filter: invert(1);">
                          <img src="photos/trenyolu_.jpg">
                          <img src="photos/trenyolu_2.jpg" style="filter: hue-rotate(45deg);">
                    </figure>
                </div>
                
                <div class="c-row">
                    <form class="a-row" action="filteredticket.php" method="post">
                        <div class="div1">
                            <div class="ticket">
                                <div class="s">
                                    Satış
                                </div>
                                <div class="s1">
                                    <input type="radio" name="ticket" value="Satış" />
                                </div>
                                <div class="s">
                                    Rezervasyon
                                </div>
                                <div class="s1">
                                    <input type="radio" name="ticket" value="Rezervasyon" />
                                </div>
                            </div>
                            <div class="way">
                                <div class="s">
                                    Tek yön
                                </div>
                                <div class="s1">
                                    <input type="radio" onclick="deneme()" id="way" name="way" value="tek" />
                                </div>
                                <div class="s">
                                    Gidiş dönüş
                                </div>
                                <div class="s1" >
                                    <input type="radio" onclick="deneme2()" id="way" name="way" value="çift" />
                                </div>

                                <script>
                                function deneme(){
                                    document.getElementById("deneme").style.display = "none";
                                }
                                </script>
                                <script>
                                function deneme2(){
                                    document.getElementById("deneme").style.display = "flex";
                                }
                                </script>

                            </div>
                        </div>
                        <div class="div1">
                            <div class="start">
                                <div class="s1">
                                    Nereden
                                </div>
                                <div class="s">
                                    <select name="nereden" id="nereden" style="width: 160%;">
        <?php
$i = 0;
while ($i < $num) {
    while ($count = mysqli_fetch_array($result)) {
        ?>
                                        <option value="<?php echo $count['stationName'] ?>"><?php echo $count['stationName'] ?></option>
                                        <?php
        $i++;   
    }   
}
?>
                                    </select>
                                </div>
                            </div>
                            <div class="end">
                                <div class="s1">
                                    Nereye
                                </div>
                                <div class="s">
                                    <select name="nereye" id="nereye" style="width: 160%;">
                                    
                                    <?php
$i2 = 0;
while ($i2 < $num2) {
    while ($count = mysqli_fetch_array($result2)) {
        ?>
                                        <option value="<?php echo $count['stationName'] ?>"><?php echo $count['stationName'] ?></option>
                                        <?php
        $i2++;   
    }   
}
?>

                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="div1">
                            <div class="sdate">
                               
                                <div class="s1">
                                    <label for="sdate">Gidiş Tarihi</label>
                                </div>
                                <div class="s">
                                    <input type="date" id="sdate" name="sdate" min="<?php echo date('Y-m-d'); ?>"/>
                                </div>
                            </div>
                            
                            <div class="edate" id="deneme">
                                <div class="s1" >
                                    <label for="edate">Dönüş Tarihi</label>
                                </div>
                                <div class="s">
                                    <input type="date" id="edate" name="edate" min="<?php echo date('Y-m-d'); ?>" />
                                </div>
                            </div>
                        </div>
                        <div class="div1">
                            <div class="search">
                                <input type="submit" value="Ara" style="background-color: #E5FFCC;
                                border-radius: 1rem;
                                border-color: green;
                                width: 6rem;
                                height: 2rem;"/>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="details">
                    <img src="photos/details.jpg" style="width: 100%;">
                </div>

                <div class="a-container">
                    <div class="container">
                        <div class="a">
                            <img src="photos/ankara.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">Ankara</div>
                            </div>
                        </div>
    
                        <div class="b">
                            <img src="photos/konya.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">Konya</div>
                            </div>
                        </div>
    
                        <div class="c">
                            <img src="photos/istanbul.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">İstanbul</div>
                            </div>
                        </div>
                    </div>
    
                    <div class="container2">
                        <div class="d">
                            <img src="photos/izmir.jpg" alt="Avatar" class="image">
                            <div class="overlay">
                              <div class="text">İzmir</div>
                            </div>
                        </div>
    
                        <div class="e1">
    
                            <div class="e">
                                <img src="photos/eskisehir.jpg" alt="Avatar" class="image">
                                <div class="overlay">
                                  <div class="text">Eskişehir</div>
                                </div>
                            </div>
                            <div class="f">
                                <img src="photos/kars.jpg" alt="Avatar" class="image">
                                <div class="overlay">
                                  <div class="text">Kars</div>
                                </div>
                            </div>
    
                        </div>
    
                    </div>
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
