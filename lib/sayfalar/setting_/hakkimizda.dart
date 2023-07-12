import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hakkimizda extends StatefulWidget {
  const Hakkimizda({super.key});

  @override
  State<Hakkimizda> createState() => _HakkimizdaState();
}

class _HakkimizdaState extends State<Hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Hakkımızda',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Text(
                "'Seyahat Defteri' herkesin anonim şekilde paylaşım yapabileceği, insanların gezdiği gördüğü yerleri diğerleriyle paylaşabileceği, herkesin bir yerler hakkında kolayca bilgi sahibi olabileceği interaktif bir uygulamadır. 'Yeni Bir Yer Ekleyin' kısmından paylaşmak istediğiniz yerin bilgilerini girin ve diğerleriyle paylaşın. 'Keşfet' kısmında size ve diğerlerine ait paylaşımları görebilirsiniz. Özel bilgilerinizi paylaşmamayı unutmayın. 'Arama' kısmında gitmek istediğiniz fakat önceden bilgi edinmek istediğiniz yerleri aratarak o yerler hakkında bilgi edinebilir veya diğer insanların görüşlerini öğrenebilirsiniz. Sakıncalı, rendice edici veya kötü içerikli paylaşımlar görürseniz; yanlışlıkla size özel bir yer paylaşmışsanız ve kaldırılmasını istiyorsanız 'Ayarlar' kısmındaki 'Gönderi Silme' kısmından bize ulaşabilirsiniz. Talebiniz en geç 1 gün içinde değerlendirilip size dönüş yapılacaktır. Görüş, öneri ve şikayetleriniz için 'Ayarlar' kısmındaki 'Bize Ulaşın' sekmesine uğrayabilirsiniz. Her gün büyümeye ve gelişmeye devam ediyoruz. Bize destek olmak için sosyal medya hesaplarımızı takip edebilirsiniz.",
                style: GoogleFonts.indieFlower(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
