<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Yolcu Bilgileri</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="fillinfo.css">
</head>
<body>    
   
<?php
    session_start();
    include 'dbconnect.php';
    include 'delete.php';

    $email = $_SESSION['email'];
    //QUERY THAT CHECKS IF THE VIEWER IS AN ADMIN
    $query = mysqli_query($conn, "select * from registeredusers where regUserEmail = '$email'");
    $counta = mysqli_num_rows($query);
    if (!$counta) {
        header("location:admin.php");
    } 

    if($_SESSION['buton'] == "Satın Al"){
        $route1_ = $_SESSION['dropRoute'];
    }else{
        $_SESSION['buton'] = null;
        $route1_ = $_POST['route1'];
    }
    
    $route2_ = $_POST['route2']; 
    $_SESSION['route1_'] = $route1_;
    $_SESSION['route2_'] = $route2_;
    $trainNumber = $_SESSION['trainNumber'];
    $trainNumber2 = $_SESSION['trainNumber2'];


    if (isset($_SESSION['email'])) {
        $usermail = $_SESSION['email'];
        }else{
            header("Location: giris.php");
        }
    ?>
    

    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.php">Anasayfa</a>
                    <a href="hakkimizda.php">Hakkımızda</a>
                    <a href="contact.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="signout.php">Çıkış Yap</a>
                </div>
            </div>
        </div>
        
        <div class="box">
            <div class="contain">
                <div class="c-row">
                    <h3>Yolcu Bilgileri</h3>
                    
                </div>
                <?php if($_SESSION['ticket'] == 'Satış' || $_SESSION['buton'] == "Satın Al"){ ?>
                <form class ="row" action="selectseats.php" method='post'>
                
                
                    <div class="a-row">
                        
        
                        <div class = "d-row">
                            <label for="passType" style="padding-right: 0.4rem">Yolcu Sınıfı</label>
                            <div class="s1">
                                <select name="passType" id="passType" style="height: 156%;width:200%">
                                    <option value="BUSINESS CLASS">BUSINESS CLASS</option>
                                    <option value="ECONOMY CLASS">ECONOMY CLASS</option>
        
                                </select>
                                </div>
                        </div>
        
                        <div class = "d-row">
                            <label for="passNumber" style="padding-right: 0.2rems;" >Yolcu Sayısı</label>
                            <div class="s2">
                                <select name="number" onclick="deneme()" id="number" required style="height: 156%;width: 125%">
                                    <option value="" selected="selected" hidden="hidden">Kişi sayısı seçiniz</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
        
                                </select>
                            </div>
                            
                            <script>
                            function deneme(){
                                    var c ="";
                                   var a= document.getElementById("number");
                                   var b = a.value;

                                   var i = 0;
                                   for(i = 0; i < b; i++){

                                       c += '<label for="isim' + i + '" style="margin-top: 1rem;">' + (i+1) + '.İsim</label>';
                                       c += '<input required name ="isim' + i + '" id="isim' + i + '"  type="text"/>';
                                       c += '<label for="soyisim' + i + '" style="margin-top: 1rem;">' + (i+1) + '.Soyisim</label>';
                                       c += '<input required name ="soyisim' + i + '" id="soyisim' + i + '"  type="text"/>';
                                       c += '<label for="ssn' + i + '" style="margin-top: 1rem;">' + (i+1) + '.Kimlik Numarası</label>';
                                       c += '<input required name ="ssn' + i + '" id="ssn' + i + '"  type="number" oninput="if(value.length>11)value=value.slice(0,11)"/>';

                                   }
                                   document.getElementById("ans").innerHTML=c;
                                }

                                </script>
                        </div>
                        
                        <div id="ans" style="display: flex; flex-direction: column;"></div>

</div>
                     <div class="h-row">
                        <div class="d-row" style="justify-content: center;">
                                <input type="submit" value="Devam Et" style="background-color: #E5FFCC;
                            border-radius: 1rem;
                            border-color: green;
                            margin-top: 1rem;
                            width: 6rem;
                            height: 2rem;"/>
                            </div>
</div>
                    </form>
                    <?php } else{ ?>
                        <form class ="row" action="rezervasyon.php" method='post'>
                    <div class="a-row">
                        
        
                        <div class = "d-row">
                            <label for="passType" style="padding-right: 0.4rem">Yolcu Sınıfı</label>
                            <div class="s1">
                                <select name="passType" id="passType" style="height: 156%;width:200%">
                                    <option value="BUSINESS CLASS">BUSINESS CLASS</option>
                                    <option value="ECONOMY CLASS">ECONOMY CLASS</option>
        
                                </select>
                                </div>
                        </div>
        
                        <div class = "d-row">
                            <label for="passNumber" style="padding-right: 0.2rems;" >Yolcu Sayısı</label>
                            <div class="s2">
                                <select name="number" id="number" required style="height: 156%;width: 125%">
                                    <option value="" selected="selected" hidden="hidden">Kişi sayısı seçiniz</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
        
                                </select>
        
                            </div>
    
                        </div>

</div>
                     <div class="h-row">
                        <div class="d-row" style="justify-content: center;">
                                <input type="submit" value="Rezervasyon Yap" style="background-color: #E5FFCC;
                            border-radius: 1rem;
                            border-color: green;
                            margin-top: 1rem;
                            width: 10rem;
                            height: 2rem;"/>
                            </div>
</div>
                    </form>
                        <?php } ?>
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
