import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dil extends Translations {
  static const varsayilan = Locale("tr", "TR");
  static final diller = [
    const Locale("tr", "TR"),
    const Locale("en", "EN"),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'baslik': 'Seyahat\nDefteri',
          'hg': 'HOŞGELDİNİZ!',
          'emailAdres': 'E-Mail adresiniz',
          'sifre': 'Şifreniz',
          'navBarCikis': 'Çıkış Yap',
          'giris': 'Giriş Yap',
          'hesapYok': 'Hesabınız yok mu?',
          'goKayitOl': 'Kayıt Ol',
          'kayitOl': 'Kayıt Ol',
          'hesapVar': 'Zaten bir hesabınız mı var?',
          'goGiris': 'Giriş Yap',
          'registerDialog1': 'Kayıt Başarısız',
          'registerDialog2': 'Bir hata oluştu, lütfen tekrar deneyiniz.',
          'registerDialog3': 'Tamam',
          'dogrulaAppBar': 'E-Posta Onay',
          'dogrulaBaslik': 'E-Posta Adresinizi Doğrulayın',
          'dogrulaAciklama':
              ' adlı E-Posta adresinize, E-Postanızı doğrulamanız için bir bağlantı gönderildi. Lütfen uygulamayı kapatmadan arka plana alın ve \nE-Postanızı kontrol edip gönderilen bağlantıya tıklayın. Doğruladıktan sonra tekrar buraya gelerek \'Doğrulamayı Kontrol Et\' butonuna basın.',
          'dogrulamaBekle': 'Dogrulama bekleniyor...',
          'dogrulaButton': 'Doğrulamayı Kontrol Et',
          'dogrulamaDialog': 'Doğrulama bekleniyor...',
          'dogrulamaDialog2': 'Lütfen E-Posta adresinizi doğrulayın.',
          'dogrulamaDialog3': 'Tamam',
          'discoverPageAppBar': 'Keşfet',
          'burasiBos': 'Burası şimdilik boş...',
          'searchPageAppBar': 'Arama Yapın',
          'aramaGir': 'Arama yapmak için girin...',
          'addPlaceAppBar': 'Yeni Bir Yer Ekleyin',
          'addPlaceBaslik': 'Başlık...',
          'addPlaceAciklama': 'Bir açıklama ekleyebilirsiniz...',
          'addPlaceButton': ' olarak paylaş',
          'settingsPageAppBar': 'Ayarlar',
          'hakkimizda': 'Hakkımızda',
          'gonderiSilme': 'Gönderi Silme',
          'bizeUlas': 'Bize Ulaşın',
          'sosyalMedya': 'Sosyal Medya Hesaplarımız',
          'hakkimizdaAciklama':
              "'Seyahat Defteri' herkesin anonim şekilde paylaşım yapabileceği, insanların gezdiği gördüğü yerleri diğerleriyle paylaşabileceği, herkesin bir yerler hakkında kolayca bilgi sahibi olabileceği interaktif bir uygulamadır. 'Yeni Bir Yer Ekleyin' kısmından paylaşmak istediğiniz yerin bilgilerini girin ve diğerleriyle paylaşın. 'Keşfet' kısmında size ve diğerlerine ait paylaşımları görebilirsiniz. Özel bilgilerinizi paylaşmamayı unutmayın. 'Arama' kısmında gitmek istediğiniz fakat önceden bilgi edinmek istediğiniz yerleri aratarak o yerler hakkında bilgi edinebilir veya diğer insanların görüşlerini öğrenebilirsiniz. Sakıncalı, rendice edici veya kötü içerikli paylaşımlar görürseniz; yanlışlıkla size özel bir yer paylaşmışsanız ve kaldırılmasını istiyorsanız 'Ayarlar' kısmındaki 'Gönderi Silme' kısmından bize ulaşabilirsiniz. Talebiniz en geç 1 gün içinde değerlendirilip size dönüş yapılacaktır. Görüş, öneri ve şikayetleriniz için 'Ayarlar' kısmındaki 'Bize Ulaşın' sekmesine uğrayabilirsiniz. Her gün büyümeye ve gelişmeye devam ediyoruz. Bize destek olmak için sosyal medya hesaplarımızı takip edebilirsiniz.",
          'gonderiSilBaslik':
              'Silinecek gönderinin başlığını tam haliyle giriniz',
          'gonderiSilHesap': 'Gönderinin ait olduğu hesap',
          'gonderiSilAciklama':
              'Neden silinmesini istediğinizi birkaç cümleyle açıklayın',
          'gonderiSilEposta': 'E-Posta adresiniz',
          'gonderiSilButton': 'Gönder',
          'bizeUlasKonu': 'Konu',
          'bizeUlasAciklama': 'Görüş, öneri veya şikayetiniz nedir?',
          'bizeUlasEposta': 'E-Posta adresiniz',
          'bizeUlasButton': 'Gönder',
          'snackBarContent': 'Başarıyla paylaşıldı!',
          'snackBarAction': 'Tamam',
          'tumYerler': 'Tüm Yerler',
          'favoriYerler': 'Favori Yerler',
          'kullaniciBulunamadi':
              'Girdiğiniz E-Posta adresiyle kayıtlı bir kullanıcı bulunamadı.',
          'hataliSifre': 'Hatalı şifre girdiniz. Lütfen tekrar deneyiniz.',
          'gecersizEposta':
              'Geçersiz E-Posta adresi. Lütfen geçerli bir E-Posta adresi giriniz.',
          'hata': 'Bir hata oluştu, lütfen daha sonra tekrar deneyiniz.',
          'sifreTekrar': 'Şifre tekrarını yanlış girdiniz.',
          'sifreTekrarText': 'Şifreyi onayla',
          'sifremiUnuttum': 'Şifremi Unuttum',
          'sifreYenileBaslik':
              'Şifrenizi yenilemek için E-Mail adresinizi girin ve ardından \'Şifreyi Yenile\' butonuna basın',
          'sifreYenileButton': 'Şifreyi Yenile',
          'sifreYenileDialog':
              'Şifreni yenilemen için E-Mail adresine bir link gönderdik. Lütfen E-Mail adresini kontrol et.',
          'uyari': 'UYARI',
          'gizlilik':
              'Gizliliğinizin korunması adına konumunuzu istemiyoruz, bu yüzden haritada konumunuzu göremezsiniz.',
          'profil': 'Profilim',
          'gonderilerim': 'Gönderilerim',
          'koordinat': 'İşaretlenen yerin kooordinatları',
          'konumSec': 'Haritada işaretleyerek konum seçin',
          'yeniYerAciklama':
              'Yeni bir yer eklemek için öncelikle ekranın en alt kısmında bulunan \'+\' sembolüne tıklayın. Ardından açılan ekranda eklemek istediğiniz yerin konumunu haritadan işaretleyin. Bu sayede diğer kullanıcılar paylaştığınız yerin konumunu görebilecek. Ardından bir başlık ve açıklama ekleyin. Artık paylaşabilirsiniz.',
          'kesfetAciklama':
              'Keşfet kısmında, diğer kullanıcıların paylaştığı yerleri, deneyimlerini ve farklı mekanları keşfedebilirsiniz. İsterseniz bunları favorileyip daha sonra ulaşmak için \'Profilim\' kısmındaki Favorilerim bölümüne ekleyebilir, dilerseniz de yol tarifi alabilirsiniz. Keyifli gezintiler..',
          'searchAciklama':
              'Düşünün ki bir restoran var, adını çok duydunuz ancak deneyim kazanıp öyle gitmek istiyorsunuz. İşte tam da bu amaçla yapılmış uygulamamızda \'Arama Yap\' kısmında o yeri aratabilir ve diğer insanların düşüncelerini, deneyimlerini öğrenebilir, dilerseniz de yol tarifi alabilirsiniz.',
          'bizeUlasPageAciklama':
              'Ayarlar kısmında buluna \'Bize Ulaşın\' sekmesinden her türlü görüş, öneri, istek veya şikayetiniz için bizimle iletişime geçebilirsiniz. Ayrıca silinmesini istediğiniz bir paylaşım varsa yine Ayarlar kısmındaki \'Gönderi Silme\' sekmesine gidebilirsiniz.',
          'profilPage': 'Profil Sayfası',
          'profilPageAciklama':
              'Ekranın sol üst köşesindeki hamburger ikonuna tıklayarak Profilim sekmesini görebilir, ayrıca hesabınızdan çıkış yapabilirsiniz. Profilinizde kendinize ait olan herkese açık paylaşımlarınızı ve favorilediğiniz yerleri görebilirsiniz. Size özel yerleri görmek için aynı yerden \'Bana Özel\' sekmesine bakabilirsiniz.',
          'nasilKullanilir': 'Nasıl Kullanılır',
          'yorumlar': 'Yorumlar',
          'yorumEkle': 'Yorum ekleyebilirsiniz',
          'banaOzel': 'Bana Özel',
          'herkeseAcik': 'Bu gönderi herkese açık olarak paylaşılacak',
          'gizli': 'Bu gönderi sadece sana özel kaydedilecek',
        },
        'en_US': {
          'baslik': 'Seyahat\nDefteri',
          'hg': 'WELCOME!',
          'emailAdres': 'Your E-Mail address',
          'sifre': 'Password',
          'navBarCikis': 'Log Out',
          'giris': 'Login',
          'hesapYok': 'Don\'t have an account?',
          'goKayitOl': 'Create Account',
          'kayitOl': 'Create Account',
          'hesapVar': 'Already have an account?',
          'goGiris': 'Login',
          'registerDialog1': 'Registration Failed',
          'registerDialog2': 'An error has occured, please tr again.',
          'registerDialog3': 'Got it',
          'dogrulaAppBar': 'E-Mail Verification',
          'dogrulaBaslik': 'Verify Your E-Mail Address',
          'dogrulaAciklama':
              'A link has been sent to your e-mail address for you to verify your e-mail. Please put the application in the background without closing it and \nCheck your E-Mail and click on the link sent. After verifying, come here again and press the "Check Verification" button.',
          'dogrulamaBekle': 'Awaiting verification...',
          'dogrulaButton': 'Check Verification',
          'dogrulamaDialog': 'Awaiting Verification...',
          'dogrulamaDialog2': 'Please verify your E-Mail address.',
          'dogrulamaDialog3': 'Got it',
          'discoverPageAppBar': 'Discover',
          'burasiBos': 'This is empty for now...',
          'searchPageAppBar': 'Search Something',
          'aramaGir': 'Text for search...',
          'addPlaceAppBar': 'Add a New Place',
          'addPlaceBaslik': 'Title...',
          'addPlaceAciklama': 'You can add a description...',
          'addPlaceButton': 'share as',
          'settingsPageAppBar': 'Settings',
          'hakkimizda': 'About Us',
          'gonderiSilme': 'Post Deletion',
          'bizeUlas': 'Contact Us',
          'sosyalMedya': 'Our Social Media Accounts',
          'hakkimizdaAciklama':
              "'Seyahat Defteri' is an interactive application where everyone can share anonymously, share the places they visit with others, and easily get information about a place. In the 'Add a New Place' section, enter the information of the place you want to share and share it with others. In the 'Discover' section, you can see the posts belonging to you and others. Remember not to share your private information. In the 'Search' section, you can search for places you want to go but want to learn about in advance, and you can get information about those places or learn other people's opinions. If you see objectionable, offensive or malicious content; If you have accidentally shared a special place for you and want it removed, you can contact us from the 'Post Deletion' section in 'Settings'. Your request will be evaluated and returned to you within 1 day at the latest. For your comments, suggestions and complaints, you can visit the 'Contact Us' tab in the 'Settings' section. We continue to grow and develop every day. You can follow our social media accounts to support us.",
          'gonderiSilBaslik': 'Enter the full title of the post to be deleted',
          'gonderiSilHesap': 'The account to which the post belongs',
          'gonderiSilAciklama':
              'Explain in a few sentences why you want it deleted',
          'gonderiSilEposta': 'Your E-Mail address',
          'gonderiSilButton': 'Send',
          'bizeUlasKonu': 'Subject',
          'bizeUlasAciklama': 'What is your opinion, suggestion or complaint?',
          'bizeUlasEposta': 'Your E-Mail address',
          'bizeUlasButton': 'Send',
          'snackBarContent': 'Successfully shared!',
          'snackBarAction': 'Got it',
          'tumYerler': 'All Places',
          'favoriYerler': 'Favorite Places',
          'kullaniciBulunamadi':
              'No registered user was found with the E-Mail address you entered.',
          'hataliSifre': 'You entered an incorrect password. Please try again.',
          'gecersizEposta':
              'Invalid E-Mail address. Please enter a valid E-Mail address.',
          'hata': 'An error has occurred, please try again later.',
          'sifreTekrar': 'You entered wrong password again.',
          'sifreTekrarText': 'Confirm password',
          'sifremiUnuttum': 'Forgot Password',
          'sifreYenileBaslik':
              'To reset your password, enter your e-mail address and then press the \'Reset Password\' button',
          'sifreYenileButton': 'Reset Password',
          'sifreYenileDialog':
              'We have sent a link to your E-Mail address to reset your password. Please check your E-Mail address.',
          'uyari': 'WARNING',
          'gizlilik':
              'We don\'t want your location to protect your privacy, so you can\'t see your location on the map.',
          'profil': 'My Profile',
          'gonderilerim': 'My Posts',
          'koordinat': 'Coordinates of the marked place',
          'konumSec': 'Choose a location by marking it on the map',
          'yeniYerAciklama':
              'To add a new place, first click on the \'+\' symbol at the bottom of the screen. Then mark the location of the place you want to add on the map on the screen that opens. In this way, other users will be able to see the location of the place you shared. Then add a title and description. Now you can share.',
          'kesfetAciklama':
              'In the Discover section, you can discover places shared by other users, their experiences, and different places. If you want, you can favorite them and add them to the "Favorites" section in the "My Profile" section to access them later, or you can get directions if you wish. Have a nice trip..',
          'searchAciklama':
              'Imagine that there is a restaurant, you\'ve heard the name a lot, but you want to gain experience and go like that. In our application made for this purpose, you can search for that place in the "Search" section and learn other people\'s thoughts and experiences, or you can get directions if you wish.',
          'bizeUlasPageAciklama':
              'You can contact us for any comments, suggestions, requests or complaints from the "Contact Us" tab in the Settings section. Also, if there is a post you want to be deleted, you can still go to the "Post Deletion" tab in the Settings.',
          'profilPage': 'Profile Page',
          'profilPageAciklama':
              'You can see the My Profile tab by clicking the hamburger icon in the upper left corner of the screen, and you can also log out of your account. You can see your public posts and favorite places on your profile. To see the places that belong to you, you can check the "Places of Mine" tab from the same place.',
          'nasilKullanilir': 'How to Use',
          'yorumlar': 'Comments',
          'yorumEkle': 'Add comment',
          'banaOzel': 'Places of Mine',
          'herkeseAcik': 'This post will be shared publicly',
          'gizli': 'This post will be saved only for you',
        },
      };
}
