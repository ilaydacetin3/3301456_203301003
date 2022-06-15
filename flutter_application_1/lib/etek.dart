import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/datacontrol.dart';
import 'package:flutter_application_1/Model/satin_al.dart';

import 'package:hive/hive.dart';

class etek extends StatefulWidget {
  etek({Key? key}) : super(key: key);

  @override
  State<etek> createState() => _etekState();
}

class _etekState extends State<etek> with SingleTickerProviderStateMixin{
  late Box<SatinAlModel> _giysikutu;
   @override
  void initState() {
    super.initState();
    
  _giysikutu=Hive.box<SatinAlModel>("Giysi");
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cimcim Butik Etek"),
        backgroundColor: Color.fromARGB(255, 176, 155, 212),
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemCount: DataControl.etekler.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(children: [
                Expanded(
                    child: Image.asset(
                        "images/" + DataControl.etekresim[index] + ".png")),
                Text(
                  DataControl.etekler[index],
                  style: const TextStyle(fontSize: 20),
                ),
                Text(DataControl.fiyat_4[index].toString(),
                    style:
                        const TextStyle(color: Colors.black45, fontSize: 18)),
                        ElevatedButton(
                      onPressed: () async{
                        SatinAlModel yeniModel = SatinAlModel.olutur(
                            isim: DataControl.etekler[index],
                            para: DataControl.fiyat_4[index],
                            imgyol: "images/" +
                                DataControl.etekresim[index] +
                                ".png");
                       await _giysikutu.put(yeniModel.id, yeniModel);     //ekleme işlemi favoriye hive in put komutuyla
                      },
                      child: Text("Favori Ekle"))
              ]),
              color: Color.fromARGB(255, 226, 178, 156),
            );
          },
        ),
      ),
    );
  }
}
