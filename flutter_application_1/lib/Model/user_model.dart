import 'package:cloud_firestore/cloud_firestore.dart';

class KullaniciModel {
  String? ad;
  String? soyad;
  String? gmail;
  String? sifre;

  KullaniciModel({this.ad, this.soyad, this.gmail, this.sifre});

  factory KullaniciModel.fromSnapShot(DocumentSnapshot snapshot) {
    return KullaniciModel(
        ad: snapshot["ad"],
        soyad: snapshot["soyad"],           // firebase e kaydediyor
        gmail: snapshot["gmail"],
        sifre: snapshot["sifre"]);
  }
}
