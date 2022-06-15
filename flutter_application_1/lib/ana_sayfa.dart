import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/datacontrol.dart';
import 'package:flutter_application_1/Model/profil.dart';
import 'package:flutter_application_1/Model/user_model.dart';

import 'package:flutter_application_1/bluz.dart';
import 'package:flutter_application_1/elbise.dart';
import 'package:flutter_application_1/etek.dart';
import 'package:flutter_application_1/favori.dart';
import 'package:flutter_application_1/giysiler.dart';
import 'package:flutter_application_1/hakkimizda.dart';
import 'package:flutter_application_1/iletisimBilgileri.dart';
import 'package:flutter_application_1/pantolon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/post_listesi.dart';

class AnaSayfa extends StatelessWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> kiyafet = DataControl.kiyafetler;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cimcim Butik - merhaba"),
        backgroundColor: Color.fromARGB(255, 176, 155, 212),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => elbise())));
                          },
                          child: const Text("Elbise")),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => bluz())));
                          },
                          child: const Text("Bluz")),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => etek())));
                          },
                          child: const Text("Etek")),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => pantolon())));
                          },
                          child: const Text("Pantolon")),
                      value: 4,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => hakkimizda())));
                          },
                          child: const Text("Hakkımızda")),
                      value: 5,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => iletisim())));
                          },
                          child: const Text("İletişim Bilgileri")),
                      value: 5,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Profil())));
                          },
                          child: const Text("Profil Bilgileri")),
                      value: 6,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Favori())));
                          },
                          child: const Text("Favori Sepeti")),
                      value: 7,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => GiysilerApi())));
                          },
                          child: const Text("Giysiler ")),
                      value: 7,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () async {
                            await _auth.signOut();                
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text("çıkış ")),
                      value: 7,
                    ),
                    PopupMenuItem(
                      child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Post())));
                          },
                          child: const Text("Seçilen Veriler ")),
                      value: 8,
                    ),
                  ])
        ],
      ),
      body: Container(
          child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemCount: DataControl.resimler.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(children: [
                    Expanded(
                        child: Image.asset(
                            "images/" + DataControl.resimler[index] + ".png")),
                    Text(
                      DataControl.kiyafetler[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(DataControl.fiyat_2[index],
                        style: const TextStyle(
                            color: Colors.black45, fontSize: 18))
                  ]),
                  color: Color.fromARGB(255, 155, 200, 206),
                );
              })),
    );
  }
}
