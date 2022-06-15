// To parse this JSON data, do
//
//     final Giysi = GiysiFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Giysi GiysiFromMap(String str) => Giysi.fromMap(json.decode(str));


String GiysiToMap(Giysi data) => json.encode (data.toMap());


class Giysi {
  final int  userId;
  final int id;
  final String title;

  Giysi({
    required this.userId,
    required this.id,
    required this.title,
  });

  

  factory Giysi.fromMap(Map<String, dynamic> json) => Giysi(
        userId: json["userId"],

        id: json["id"],

        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}


//quicktype yararlandım 