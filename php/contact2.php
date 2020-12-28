<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>İletişim</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="contact.css">
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
            
            .main{
    display: flex;
    flex: 1;
    justify-content: center;
    background-image: url(photos/background.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    padding-bottom: 1rem;
}
.contain{
    display: flex;
    flex: 1;
    max-width: 50%;
    flex-direction: column;
    align-items: center;
    border: outset;
    border-color: rgba(0, 128, 128, 0.678);
    margin-top: 1rem;
    border-width: 0.3rem;
    background-color: whitesmoke;
    filter: opacity(0.95);
    border-radius: 4rem;
}
.head{
    display: flex;
    margin-top: 1rem;
    justify-content: center;
}
.head img{
    width: 60%;
}
.c-form{
    display: flex;
    margin-top: 1rem;
    justify-content: center;
    width: 60%;
    border: red;
}
.form{
    display: flex;
    flex-direction: column;
    margin: 1rem;
    width: 100%;
}
.box1{
    display: flex;
    flex-direction: row;
    margin: 1rem;
}
.b1-1{
    display: flex;
    width: 25%;
}
.b1-2{
    display: flex;
    width: 75%;
}
.b1-2a{
    display: flex;
    width: 75%;
}
.b1-1 label{
    width: 100%;
}
.b1-2 input{
    width: 90%;
}
.b1-1a{
    display: flex;
    flex: 1;
    flex-direction: row-reverse;
}
#konu{
    width: 92%;
}
#message{
    width: 90%;
}

        </style>
</head>
<body> 

<div class="page">
    <div class="navbar">
        <div class="left">
        </div>
        <div class="right">
            <div class="list">
                    <a href="home2.php">Anasayfa</a>
                    <a href="hakkimizda2.php">Hakkımızda</a>
                    <a href="contact2.php">İletişim</a>
                    <a href="user.php">Profilim</a>
                    <a href="#">Çıkış Yap</a>
            </div>
        </div>
    </div>
    
    <div class="main">
        <div class="contain">
            <div class="head">
                <img src="photos/İletişim.jpg">
            </div>
            <div class="c-form">
                <form class="form">
                    <div class="box1">
                        <div class="b1-1">
                            <label for="fname">İsim</label>
                        </div>
                        <div class="b1-2">
                            <input type="text" id="fname" name="firstname" placeholder="İsminiz">
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1">
                            <label for="lname">Soyisim</label>
                        </div>
                        <div class="b1-2">
                            <input type="text" id="lname" name="lastname" placeholder="Soyisminiz">
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1">
                            <label for="konu">İletişim Konusu</label>
                        </div>
                        <div class="b1-2a">
                            <select id="konu" name="konu">
                                <option value="soru">Soru</option>
                                <option value="öneri">Öneri</option>
                                <option value="şikayet">Şikayet</option>
                              </select>
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1">
                            <label for="message">Mesaj</label>
                        </div>
                        <div class="b1-2">
                            <textarea id="message" name="message" placeholder="Mesajınızı yazınız"></textarea>
                        </div>
                    </div>
                    <div class="box1">
                        <div class="b1-1a">
                            <input type="submit" value="Gönder">
                        </div>
                    </div>
                </form>
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




