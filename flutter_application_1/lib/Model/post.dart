import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? id;

  String? baslik;
  String? apiUserId;
  String? kullaniciId;

  PostModel({this.apiUserId, this.id, this.baslik, this.kullaniciId});

  factory PostModel.fromSnapShot(DocumentSnapshot snapshot) {
    return PostModel(
      id: snapshot.id,
      baslik: snapshot["baslik"],                          //model classlarım diğerlerine model oluyor
      apiUserId: snapshot["apiUserId"],
      kullaniciId: snapshot["kullaniciId"],
    );
  }
}
