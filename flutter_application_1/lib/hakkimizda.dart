import 'package:flutter/material.dart';

class hakkimizda extends StatefulWidget {
  hakkimizda({Key? key}) : super(key: key);

  @override
  State<hakkimizda> createState() => _hakkimizdaState();
}

class _hakkimizdaState extends State<hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 220, 221, 167),appBar: AppBar(title: const Text("Cimcim Butik"),
     backgroundColor:  Color.fromARGB(255, 176, 155, 212),),
    body: SingleChildScrollView(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hakkımızda",style: TextStyle(fontSize: 48),),
          Text("\tTürkiye’nin en sevilen butiklerinden olan Cimcim Butik, 2015 yılından beri cimcimbutik.com e-ticaret sitesinde siz değerli müşterilerine hizmet vermektedir.\n \t \n Cimcim Butik, her zaman müşteri memnuniyetini ilk öncelik olarak kabul eder.\n \t \n Instagram ve Facebook hesaplarımızda bizleri takip eden 100 binin üzerindeki takipçilerimizin ihtiyaçlarına her gün aynı öz veri ile cevap vermekteyiz.\n \t \n Her gün güncellenen yeni sezon kadın giyim ürünleri ile hem iş kadınlarına yönelik hemde ev hanımları ve genç kızlara özel elbise modelleri, üst giyim ve alt giyim ürünleri ile 2015 yılından bugüne kadar sizlere hizmet vermekteyiz.\n \t \n Kaliteli ürün ve güvenli alışveriş ilkesi ile çıktığımız bu yolda müşteri portföyümüzü her geçen gün güçlendiriyoruz ve sizlere daha iyi hizmet sunabilmek için özellikle internet sitemizin alt yapısını sürekli güncelliyoruz."
          ,style: TextStyle(fontSize: 26),
          ),
        ],
      ),),
    ),);
  }
}