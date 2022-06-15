import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/satin_al.dart';
import 'package:hive/hive.dart';

class Favori extends StatefulWidget {
  Favori({Key? key}) : super(key: key);

  @override
  State<Favori> createState() => _FavoriState();
}

class _FavoriState extends State<Favori> with SingleTickerProviderStateMixin {
  late Box<SatinAlModel> kutu;
  late List<SatinAlModel> favoriListe;
  late AnimationController controller;
  late Animation animation1;
  late Animation animation2;
  @override
  void initState() {
    super.initState();
    kutu = Hive.box<SatinAlModel>("Giysi");
    favoriListe = [];
    listeDoldur();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));        
    controller.addListener(() {
      setState(() {});                                                    
    });
    animation1 = AlignmentTween(
            begin: const Alignment(0.8, -1), end: const Alignment(0.8, 1))    
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo));
    animation2 = AlignmentTween(
            begin: const Alignment(-0.8, 1), end: const Alignment(-0.8, -1)) 
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo));             

    controller.forward().orCancel;
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse().orCancel;
      } else if (status == AnimationStatus.dismissed) {
        controller.forward().orCancel;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();          
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoriler"),
     backgroundColor:  Color.fromARGB(255, 176, 155, 212),),
      body: Column(
        children: [
          Stack(children: [
            Container(
              alignment: animation1.value,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Container(
                width: 100,
                height: 100,
                child: const Image(image: AssetImage("images/beyazbluz.png")),
              ),
            ),
            Container(
              alignment: animation2.value,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Container(
                width: 100,
                height: 100,
                child: const Image(image: AssetImage("images/deri.png")),
              ),
            ),
          ]),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: favoriListe.isNotEmpty
                ? ListView.builder(
                    itemCount: favoriListe.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(children: [
                          ElevatedButton(
                              onPressed: () {
                                sil(model: favoriListe[index])
                                    .then((value) {
                                  if (value) {
                                    print("Silme Başarılı");
                                    setState(() {});
                                    listeDoldur();
                                  }
                                });
                              },
                              child: Text("Favoriler")),  //buraya favori iconu ekle 
                          Container(
                              width: 100,
                              height: 100,
                              child: Image(
                                  image:
                                      AssetImage(favoriListe[index].imgyol))),
                          Text(favoriListe[index].isim),
                          Text(favoriListe[index].para.toString()),
                        ]),color: Color.fromARGB(255, 223, 216, 129),
                      );
                    },
                  )
                : Text("Boş Favori"),
          ),
        ],
      ),
    );
  }

  Future<List<SatinAlModel>> liste() async {
    List<SatinAlModel> giysiListe = kutu.values.toList();

    return giysiListe;
  }

  listeDoldur() async {
    favoriListe = await liste();
    setState(() {});
  }

  Future<bool> sil({required SatinAlModel model}) async {
    kutu.delete(model.id);                   //hive den sliyoruz
    return true;
  }
}
