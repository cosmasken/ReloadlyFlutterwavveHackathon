import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swarp/components/buttons/primary_button.dart';
import 'package:swarp/components/buttons/secondary_button.dart';
import 'package:swarp/components/inputs/custominput.dart';
import 'package:swarp/components/texts/blacktext.dart';
import 'package:swarp/controller/state_controller.dart';
import 'package:swarp/screens/home/home.dart';
import 'package:swarp/theme/colors.dart';

import '../homepage.dart';
import '../registration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
final _auth = FirebaseAuth.instance;
class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool remember = false;
  late String email;
  late String password;
  bool showSpinner = false;
 // AuthController authController =Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const BlackText(
                  text: 'Sign In',
                  size: 23,
                ),
              ),
              const BlackText(
                text: 'Hello, welcome back!',
                size: 16,
                weight: FontWeight.normal,
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                child:
                    CustomInput(controller: usernameController, hint: 'email'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child:
                    CustomInput(controller: passwordController, hint: 'Password'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: remember,
                        onChanged: (value) {
                          setState(() {
                            remember = value!;
                          });
                        },
                      ),
                      const BlackText(
                        margin: EdgeInsets.zero,
                        text: 'Remember me',
                        size: 16,
                        weight: FontWeight.normal,
                      )
                    ],
                  ),
                  SecondaryButton(
                    text: 'Forgot Password?',
                    size: 16,
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15,
                ),
                width: double.infinity,
                child: PrimaryButton(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  buttonText: 'Sign In',
                  onPressed:  () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: usernameController.text, password: passwordController.text);
                        if (user != null) {
                          Get.to(MyHomePage());
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
                  Get.to(()=>Register());
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: RichText(
                      text: const TextSpan(
                          text: "Don't have an account yet?",
                          children: [
                            TextSpan(
                                text: 'Sign up',
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
