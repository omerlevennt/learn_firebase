import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/pages/home_page.dart';
import 'package:learn_firebase/pages/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //kullanıcının daha önce oturum açıp açmadığını kontrol ediyorum
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snaphot) {
          //oturum açmış ise ilk açılışta anasayfaya yöndendiriyorum
          if (snaphot.hasData) {
            return HomePage();
          }
          //oturum yok ise giriş yapmasını istiyorum
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
