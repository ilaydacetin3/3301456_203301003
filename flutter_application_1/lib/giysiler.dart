import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/giysi.dart';

import 'Model/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GiysilerApi extends StatefulWidget {
  const GiysilerApi({Key? key}) : super(key: key);

  @override
  State<GiysilerApi> createState() => _GiysilerApi();
}

class _GiysilerApi extends State<GiysilerApi> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<List<Giysi>> _giysi() async {
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/albums");
      List<Giysi> _giysiListe = [];
      if (response.statusCode == 200)            //200: başarılı bağlantı sağladığını gösteriyor
       {
        var giysiListe =
            (response.data as List).map((eleman) => Giysi.fromMap(eleman)).toList();     // gelen veriyi liste tipinde döndür(as list) ve elamanları liste tipine çevir(to list)
          

        return giysiListe;
      }
      return _giysiListe;
    }  catch (hata) {
       return <Giysi>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: Text(
          "Giysi",
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Giysi>>(
          future: _giysi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var giysiler = snapshot.data!;

              return ListView.builder(
                itemCount: giysiler.length,
                itemBuilder: (BuildContext context, int index) {
                  var giysi = giysiler[index];

                  return Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 139, 231, 211),
                          blurRadius: 20,
                          offset: const Offset(10, 10))
                    ]),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Color.fromARGB(255, 197, 223, 192), width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              ListTile(
                                title: Text(giysi.title),
                                subtitle: Text(giysi.userId.toString()),
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    PostModel post = PostModel(
                                        baslik: giysi.title,
                                        apiUserId: giysi.userId.toString(),
                                        kullaniciId: _auth.currentUser!.uid); // şu an oturuma açık olan kullanıcının id sini ifade etmektedir                   

                                    var ekle = _firestore.collection("Posts");

    var documentRef = await ekle.add({       //bununla çektiğimiz apinin parmetrekerini belirliyorum
      'kullaniciId': post.kullaniciId,
      'baslik': post.baslik,
      'apiUserId': post.apiUserId,
    });

                                  },
                                  child: Text("ekle"))
                            ],
                          ),
                        )),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }


}
