<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hakkımızda</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <link rel="stylesheet" type="text/css" href="hakkimizda.css">
        
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
    if (!$counta && $email != null) {
        header("location:admin.php");
    } 

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

        <div class = "main">
            <div class = "contain">
                <div class = "c-row">
                    <div class = "row">
                        <div class = "info">
                            <h2>Hakkımızda</h2>
                        </div>
                    </div>
                    
                     
                </div>

                <div class = "d-row">
                  <div class="image" > <img src = "photos/Alternatif_Baslik_0.jpg" style="height: 100%;">  </div>
                    <h2 style="margin-bottom: 0%;">Biz Kimiz?</h2>
                    <p style="text-align: center;"> Neutrinos Taşımacılık A.Ş 1960 yılında kurulmuş, Türkiye'deki demiryolu taşımacılığını düzenleyen, işleten ve kontrol eden resmî bir kurumdur. 1960 yılında Neutrinos olarak erişebildiğimiz şehir sayısı 3 iken, günüzümüde ise bu sayı 50'yi aşmış durumda. Neutrinos ailesi
                        olarak 1960'dan bugüne sizlere hızlı, güvenli ve uygun fiyatlı ulaşım sağlamak için yaklaşık 1000 personelimizle durmadan çalışıyoruz.
                        Neutrinos geçmişten günümüze siz değerli yolculularımızı sadece ulaşmak istediği yerlere ulaştırmıyor, aynı zamanda %94 müşteri memnuniyetiyle sizlere konforlu,
                        nostaljik bir deneyim yaşatıyor.
                        <br>
                        Neutrinos A.Ş. olarak yeni gelişen teknolojileri yakından takip ediyor, gelişen dünyamıza ayak uydurabilmek için gerekli adımları atıyoruz.
                        Siz değerli yolcularımıza en üst kalitede hizmet verebilmek adına yolculuklarda kullanılan tren ve tren içi donanımlarımızı güncel tutuyor, aldığınız hizmet kalitesini arttırmak için çalışıyoruz.
                        Neutrinos siz değerli yolcularımızın en tepede yer aldığı bir hiyerarşiye bağlı çalışıyor. Buna dayanarak; yolcuğulunuz esnasında veya yolculuğunuz sonrası
                        yaşadığınız herhangi bir sorunu 7/24 ulaşabileceğiniz çağrı merkezimizden destek alarak çözebilir veya  web sitemizde yer alan iletişim formuyla bize rapor edebilirsiniz. Aynı zamanda kendimizi nasıl geliştirebileceğimiz konusunda
                        görüş ve önerilerinizi de aynı çağrı merkezi veya iletişim formu yardımıyla bizlere ulaştırabilirsiniz. 
                        <br>
                        Her bir yolcumuza ailemizin bir üyesi olduğunu hissettirmek önceliğimiz, içerisinde bulunduğumuz pandemi koşulları sebebiyle sizlerin sağlığı 
                        için gerekli tüm önlemleri aldık. Siz değerli aile üyelerimizden de yolcuğunuz boyunca ve sonrasında tedbirli olmanızı rica ediyor ve sağlıklı günler diliyoruz.

                    </p> 
                    <h3 style="margin-top: 0;"><i>Neutrinos Ailesi</i></h3>
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



