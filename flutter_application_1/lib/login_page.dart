import 'package:flutter/material.dart';
import 'package:flutter_application_1/ana_sayfa.dart';
import 'package:flutter_application_1/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Cimcim Butik")),
        backgroundColor: Color.fromARGB(255, 176, 155, 212),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [FromWidget()],
        ),
      ),
    );
  }
}

class FromWidget extends StatelessWidget {
  FromWidget({Key? key}) : super(key: key);
  String username = "";
  String password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Kullanıcı Adı",
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Kullanıcı Adınızı Giriniz";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                username = value;
              },
            ),
            SizedBox(height: 10.0),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Şifre",
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Şifrenizi Girin";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                password = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
    
                              await _auth.signInWithEmailAndPassword(  //mail ve şifre kontrolünün yapıldığı yer
                                  email: username, password: password);
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                          if (_auth.currentUser != null) { // burdan da doğruysa yani null değilse sayfa yönlendirmesi yapıyor
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => AnaSayfa()));
                          } else {
                            debugPrint("kullanıcı yok");
                          }
                        }
                      },
                      child: const Text("Giriş")),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sign()));
                    },
                    child: const Text("Kayıt ol"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
