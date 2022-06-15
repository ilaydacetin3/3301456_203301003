import 'package:flutter/material.dart';

class iletisim extends StatefulWidget {
  iletisim({Key? key}) : super(key: key);

  @override
  State<iletisim> createState() => _iletisimState();
}

class _iletisimState extends State<iletisim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 170, 216, 212),appBar: AppBar(title: const Text("Hakkımızda"),
    backgroundColor:  Color.fromARGB(255, 176, 155, 212),),
    body: SingleChildScrollView(
    child: Center(child:Column(
       mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Text("İLETİŞİM KANALLARIMIZ", style: TextStyle(fontSize: 38),),
         Text("\n cimcimbutik.com'dan yapacağınız tüm alışverişleriniz ile ilgili sorularınız, istek ve önerileriniz için temsilcilerimizle bağlantıya geçebilirsiniz.\n \t \n Müşteri Hizmetleri Numaramız : \n 0850 234 56 07 \n \t \n  Whatsapp Sipariş Hattı : \n 0541 123 97 00 \n \t \n Whatsapp Değişim Hattı : \n 0541 46 71 12 \n \t \n İnstagram : @cimcimofficial \n \t \n Facebook : facebook.com/Cimcim-Official",
         style: TextStyle(fontSize: 25 ),),
         
      ]
    ),
    )
    )
    );
  }
}