import 'package:flutter/material.dart';


class Profil extends StatelessWidget {
  Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 211, 195),
      appBar: AppBar(
        title: Text("Profil Bilgileri"),
        backgroundColor: Color.fromARGB(255, 176, 155, 212),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
              "https://i.pinimg.com/originals/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg"),
        ]),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 5, color: Color.fromARGB(255, 53, 112, 97)),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }
}
