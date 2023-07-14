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
          'baslik': 'Seyahat\nDefterinize',
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
        },
      };
}
