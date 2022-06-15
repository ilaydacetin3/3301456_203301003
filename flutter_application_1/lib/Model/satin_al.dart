import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
part 'satin_al.g.dart';

@HiveType(typeId: 1)
class SatinAlModel {
  @HiveField(0)

  final String id;
  @HiveField(1)
  final String isim;

  @HiveField(2)
  final double para;


  @HiveField(3)
  final String imgyol;

  SatinAlModel(this.id, this.isim, this.para, this.imgyol);

  factory SatinAlModel.olutur(
      {required String isim, required double para, required String imgyol}) {
    return SatinAlModel(const Uuid().v1(), isim, para,    imgyol);
  }
}
//flutter packages pub run build_runner build
// terminale yazıca adapter classını kendi otomatik oluşturuyor
