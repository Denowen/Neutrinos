<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kayıt Ol</title>
    <link rel="stylesheet" href="home.css">
    <link rel="stylesheet" href="kayıt.css">
        <style>
            .main{
    display: flex;
    flex: 1;
    background-color: white;
    background-image: url("photos/background.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    justify-content: center;
    align-items: center;
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
    background-color: white;
    width: 50%;
    border-radius: 2rem;
    border-color: rgba(0, 128, 128, 0.678);
    filter: opacity(0.9);
}
.row{
    display: flex;
    flex: 1;
    flex-direction: row;
    padding: 1%;
}
.account{
    display: flex;
}
.a-row{
    display: flex;
    flex-direction: column;
}
.d-row{
    display: flex;
    padding: 1rem;
}
.image{
    display: flex;
    justify-content: center;
}
.b-row{
    display: flex;
    flex-direction: row-reverse;
}
.reset{
    display: flex;
    padding: 1rem;
}
.submit{
    display: flex;
    padding: 1rem;
}
.footer{
    margin-top: 0%;
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

        <div class="main">
            <div class="contain">
                <div class="c-row">
                    <div class="row">
                        <div class="account">
                            <h2>Üyelik Bilgilerim</h2>
                        </div>
                    </div>
                </div>
                <div class="c-row">
                    <form class="a-row">
                        <div class="d-row">
                            <label for="fname" style="padding-right: 23%;">İsim</label>
                            <input type="text" placeholder="isim" id="name" name="name" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="lname" style="padding-right: 13%;">Soyisim</label>
                            <input type="text" placeholder="soyisim" id="name" name="name" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="email" style="padding-right: 19%;">Email</label>
                            <input type="email" id="email" name="email" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="password" style="padding-right: 22%;">Şifre</label>
                            <input type="password" id="password" name="password" style="height: 100%;"/>
                        </div>
                        <div class="d-row">
                            <label for="ssn" style="padding-right: 1%;">TC Kimlik No</label>
                            <input type="text" id="ssn" name="ssn" style="height: 56%;" />
                        </div>
                        <div class="d-row">
                            <label for="date">Doğum Tarihi</label>
                            <input type="date" id="date" name="date" style="height: 100%; width: 64%;"/>
                        </div>
                        <div class="d-row">
                            <label for="tel" style="padding-right: 24%;">Cep No</label>
                            <input type="tel" id="tel" name="tel" style="height: 55%;" />
                        </div>
                        <div class="b-row">
                            <div class="reset">
                                <input type="reset" style="background-color: #FFCCCC;border-radius: 1rem;border-color: red;">
                            </div>
                            <div class="submit" style="width:26%">
                                <input type="submit" value="Kaydet" style="background-color: #E5FFCC;border-radius: 1rem;border-color: green;" />
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


