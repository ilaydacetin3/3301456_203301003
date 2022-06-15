import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/datacontrol.dart';
import 'package:flutter_application_1/Model/satin_al.dart';
import 'package:hive/hive.dart';

class elbise extends StatefulWidget {
  elbise({Key? key}) : super(key: key);

  @override
  State<elbise> createState() => _elbiseState();
}

class _elbiseState extends State<elbise>  with SingleTickerProviderStateMixin{
  late  Box<SatinAlModel> _giysikutu;
  @override
  
  void initState() {
    super.initState();
    _giysikutu= Hive.box<SatinAlModel>("Giysi");
  }
  @override
  Widget build(BuildContext context) {
    List<String> elbise= DataControl.elbiseImage;
    return Scaffold(appBar: AppBar(title: const Text("Cimcim Butik  Elbise"),
    backgroundColor:  Color.fromARGB(255, 176, 155, 212),
    ),
    body: Container(
      child: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5
        ),
        itemCount: DataControl.elbiseImage.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(children: [
        
           Expanded(child: Image.asset("images/"+DataControl.elbiseImage[index]+".png")),
              Text(DataControl.elbiseler[index],style: const TextStyle(fontSize: 20),),
              Text(DataControl.fiyat_2[index],style: const TextStyle(color: Colors.black45,fontSize: 18)),
              ElevatedButton(onPressed: () async{
                SatinAlModel yenimodel=SatinAlModel.olutur(isim: DataControl.elbiseler[index],
                 para: DataControl.fiyatlar[index],
                  imgyol: "images/"+ DataControl.elbiseImage[index]+".png");
             await _giysikutu.put(yenimodel.id, yenimodel);
              }, child: Text("Favori Ekle"))
            ]),
            color: Color.fromARGB(255, 148, 202, 186),) ;
        },
      ),
    )
    );}

    
  
}