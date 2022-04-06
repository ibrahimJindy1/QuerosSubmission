import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:queros_submission/Api/api.dart';
import 'package:queros_submission/Screens/logged.dart';
import 'package:queros_submission/components/input_widget.dart';
import 'package:queros_submission/models/user.dart';
import 'package:queros_submission/utilis/dimensions.dart';
import 'package:queros_submission/utilis/statics.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class _MainScreenState extends State<MainScreen> {
  signIn() async {
    await APIServices().signinUser(username.text, password.text).then((value) {
      if (value.toString() == 'True') {
        Statics.username = username.text;
        Get.to(LoggedScreen(
          username: username.text,
        ));
      }
    });
  }

  signUp() async {
    User u = User(username.text, password.text);
    await APIServices().signupUser(u).then((value) {
      if (value.toString() == 'True') {
        Statics.username = username.text;
        Get.to(LoggedScreen(
          username: '${username.text} You Just SignedUp',
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.1,
                        blurRadius: 9,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InputWidget(
                          password: username,
                          isPassword: false,
                          hintText: 'Username'),
                      SizedBox(
                        height: Dimensions().heightFactor(10),
                      ),
                      InputWidget(
                          password: password,
                          isPassword: true,
                          hintText: 'Password'),
                      ElevatedButton(
                        onPressed: () {
                          signIn();
                        },
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                            fontSize: Dimensions().heightFactor(18),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signUp();
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontSize: Dimensions().heightFactor(18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions().heightFactor(30),
                      ),
                      TextButton(
                          onPressed: () {
                            signIn();
                          },
                          child:
                              SvgPicture.asset('assets/images/googleLogo.svg')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
