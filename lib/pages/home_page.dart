import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/pages/login_page.dart';
import 'package:learn_firebase/read%20data/get_user_name.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // oturum sonlandırma
  cikisYap() {
    FirebaseAuth.instance.signOut().then(
          //önceki ekranları kaldırarak sayfa geçişi işlemi
          (deger) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false),
        );
  }

//giriş yapmıs olan kullanıcının bilgilerini user parametresine atıyorum
  final user = FirebaseAuth.instance.currentUser!;

  //document IDs
  List<String> docIDs = [];

  // get docIDs

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("kullanicilar")
        //.where("age", isGreaterThan: 40)
        //.orderBy("age", descending: true)
        .get()
        .then((shephot) => shephot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  /*@override
  void initState() {
    getDocId();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  user.email!,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            ListTile(
              title: GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()),
                      ),
                  child: Text("Ayarlar")),
            ),
            ListTile(
              title: GestureDetector(onTap: cikisYap, child: Text("Çıkış yap")),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Kullanıcılar",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: docIDs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: GetUserName(documentId: docIDs[index]),
                              tileColor: Colors.grey[200],
                            ),
                          );
                        });
                  }))
        ],
      )),
    );
  }
}
