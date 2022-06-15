import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/datacontrol.dart';
import 'package:flutter_application_1/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  late FirebaseAuth auth;
  late FirebaseFirestore _firestore;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String name = "";
    String surName = "";
    String gmail = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt ol"),
        backgroundColor: Color.fromARGB(255, 176, 155, 212),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 3) {
                            return "lüfen düzgün giriş yapiniz";
                          }
                        },
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            label: Text("isim")),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 3) {
                            return "lüfen düzgün giriş yapiniz";
                          }
                        },
                        onChanged: (value) {
                          surName = value;
                        },
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            label: Text("soyisim")),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 3) {
                            return "lüfen düzgün giriş yapiniz";
                          }
                        },
                        onChanged: (value) {
                          gmail = value;
                        },
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            label: Text("gmail")),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.length < 3) {
                            return "lüfen düzgün giriş yapiniz";
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            label: Text("şifreniz")),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              KullaniciModel newUser = KullaniciModel(
                                  ad: name,
                                  soyad: surName,
                                  gmail: gmail,
                                  sifre: password);
                              try {
                                try {
                                  var user =
                                      await auth.createUserWithEmailAndPassword(
                                          email: newUser.gmail!,
                                          password: newUser.sifre!);

                                    //hello word kanalı kadriye hoca
                                  await _firestore
                                      .collection("Users")
                                      .doc(user.user!.uid)
                                      .set({
                                    "ad": newUser.ad,
                                    "soyad": newUser.soyad,
                                    "gmail": newUser.gmail
                                  });
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Kayıt başarılı")));
                            }
                          },
                          child: const Text("Kayıt ol"))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
