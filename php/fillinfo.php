<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Yolcu Bilgileri</title>
    <style>
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
    justify-content: center;
    
}
.c-row{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 1rem;
    border: outset;
    border-radius: 5rem;
    background-color: whitesmoke;
    border-color:rgba(0, 128, 128, 0.678);
    width: 34rem;
    border-width: 0.3rem;
    filter: opacity(0.9);
}

.row{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: outset;
    border-radius: 5rem;
    background-color: whitesmoke;
    border-color:rgba(0, 128, 128, 0.678);
    width: 43rem;
    border-width: 0.3rem;
    filter: opacity(0.9);
}

.d-row{
    display: flex;
    padding: 1rem;
}
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

    </style>
</head>
<body>    
   
<?php
    session_start();
    include 'dbconnect.php';
    $route1_ = $_POST['route1'];
    $route2_ = $_POST['route2']; 
    $_SESSION['route1_'] = $route1_;
    $_SESSION['route2_'] = $route2_;
    $trainNumber = $_SESSION['trainNumber'];
    $trainNumber2 = $_SESSION['trainNumber2'];
    
    ?>
    

    <div class="page">
        <div class="navbar">
            <div class="left">
            </div>
            <div class="right">
                <div class="list">
                    <a href="home.html">Anasayfa</a>
                    <a href="hakkimizda.html">Hakkımızda</a>
                    <a href="kayıt.html">Kayıt Ol</a>
                    <a href="contact.html">İletişim</a>
                    <a href="giris.html">Giriş Yap</a>
                </div>
            </div>
        </div>
        
        <div class="box">
            <div class="contain">
                <div class="c-row">
                    <h3>Yolcu Bilgileri</h3>
                    
                </div>
                <form class ="row" action="selectseats.php" method='post'>
                    <div class="a-row">
                        <div class = "d-row">
                            <label for="passType" style="padding-right: 1.2rem">Yolcu Tipi</label>
                            <div class="s">
                                <select name="passType" id="passType" style="height: 156%;width: 200%;">
                                    <option value="1">Öğrenci</option>
                                    
                                    <option value="2">Normal</option>
        
                                </select>
                                </div>
                        </div>
        
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
                                <select name="number" id="number" style="height: 156%;width: 125%">
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
                     <div class="h-row" action="selectseat.html">
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
