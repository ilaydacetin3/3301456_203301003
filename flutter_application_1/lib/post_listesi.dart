import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late FirebaseAuth _auth;

  Color favoriteButton = Color.fromARGB(255, 224, 165, 165);
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seçilen Veriler"),
     backgroundColor:  Color.fromARGB(255, 176, 155, 212),),
      body: SingleChildScrollView(
        child: Column(children: [

          SizedBox(
            height: (MediaQuery.of(context).size.height / 2),
            child: StreamBuilder(
              stream: getPost(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return !snapshot.hasData

                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: snapshot.data!.size,
                        itemBuilder: (BuildContext context, int index) {
                          var myPost = snapshot.data!.docs[index];
                          return Card(
                            child: Container(
                              color: Colors.green[50], width: MediaQuery.of(context).size.width,
                              child: ListTile(
                                title: Text(myPost['apiUserId']),
                                leading: GestureDetector(
                                    onDoubleTap: () {
                                      silPost(myPost.id);
                                    },
                                    child: Icon(Icons.delete)),
                                subtitle: Text(myPost['baslik']),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ]),
      ),
    );
  }

  Stream<QuerySnapshot> getPost() {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var ref = _firestore.collection("Posts").snapshots();
    return ref;
  }

  Future<void> silPost(String docId) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var ref = _firestore.collection("Posts").doc(docId).delete();
    return ref;
  }
}
