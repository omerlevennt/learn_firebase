import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //güncelleme işlemi
  Future updateData() async {
    await FirebaseFirestore.instance
        .collection("kullanicilar")
        .doc("OqHBAe8bHcMpk62O7x5o")
        .update({"age": "65"});
  }

  Future deleteData() async {
    await FirebaseFirestore.instance
        .collection("kullanicilar")
        .doc("cd04T2EZGUy4gJgZrQOC")
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: updateData,
            child: Text("Update"),
            color: Colors.deepPurple[200],
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: deleteData,
            child: Text("Delete"),
            color: Colors.red[200],
          ),
        ],
      )),
    );
  }
}
