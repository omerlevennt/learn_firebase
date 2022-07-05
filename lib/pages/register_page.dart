import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _userName = TextEditingController();
  final _confrimPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  // firebase Auth ile kayıt işlemleri
  Future<void> kayitOl() async {
    //kullanıcı email ve parola kaydı yaptıran işlem
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      // Kayıt işleminden sonra kullanıcı bilgilerini firestore kaydı yaptıran işlem
      /* .then((kullanici) => FirebaseFirestore.instance
                  .collection("kullanicilar")
                  .doc(_emailController.text)
                  .set({
                "kullaniciAdiSoyadi": _userName.text,
                "kullaniciEmail": _emailController.text,
                "kullaniciSifre": _passwordController.text,
              })*/

      /*.whenComplete(() => null);
         */

      //kullanıcı detayları kaydı
      addUserDetails(
              _firstNameController.text.trim(),
              _lastNameController.text.trim(),
              _emailController.text.trim(),
              int.parse(_ageController.text.trim()))

          //kayıt işlemleri sonrası kullanıcıya gösterilecek alan
          .then((dialog) => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Kullanıcı kaydı oluşturuldu."),
                );
              }))
          //kayıt işlemleri sonrası kullanıcıya gideceği sayfa
          .then(
            (kullanici) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false),
          );
    }
  }

  Future addUserDetails(
      String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection("kullanicilar").add({
      "first name": firstName,
      "last name": lastName,
      "email": email,
      "age": age,
    });
  }

// girilen textfield lar için parola kontrolu yaptırdım
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confrimPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confrimPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Hello There!",
              style: GoogleFonts.bebasNeue(
                fontSize: 52,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Register below with your details!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),

            //frist name textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "First Name",
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //last name textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Last Name",
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // age textfield

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Age",
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // confrim password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      controller: _confrimPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confrim Password",
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //sing in button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: kayitOl,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.deepPurple,
                  ),
                  child: Center(
                      child: Text(
                    "Sing Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            //not a member ? register now
            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    " Register now!",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ) */
          ]),
        ),
      ),
    );
  }
}
