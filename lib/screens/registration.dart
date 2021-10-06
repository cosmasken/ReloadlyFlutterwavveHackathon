import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/components/buttons/primary_button.dart';
import 'package:swarp/components/inputs/custominput.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/screens/home/home.dart';
import 'package:swarp/screens/login/login.dart';
import 'package:swarp/theme/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

//final AuthController authController = Get.find();
class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const BlackText(
                  text: 'Register',
                  size: 23,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child:
                    CustomInput(controller: usernameController, hint: 'email'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomInput(
                    controller: passwordController, hint: 'Password'),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                ),
                width: double.infinity,
                child: PrimaryButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  buttonText: 'Register',
                  onPressed: () async {
                    setState(() {
                      // showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: usernameController.text, password: passwordController.text);
                      if (newUser != null) {
                        Get.to(()=>Home());
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                  elevation: 0,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(()=>Login());
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: RichText(
                      text: const TextSpan(
                          text: "Already have have an account ?",
                          children: [
                            TextSpan(
                                text: 'Sign in',
                                style: TextStyle(
                                    color: AppColors.primary,
                                    decoration: TextDecoration.underline))
                          ],
                          style: TextStyle(
                              color: Colors.black38, fontWeight: FontWeight.bold)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
