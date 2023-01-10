// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/text_constant.dart';
import 'package:mtrackuser/Models/userdataModel.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/Screens/DashBoard/dashboard.dart';
import 'package:mtrackuser/Screens/login/forgot_password_screen.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController inputController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserModel _userModel = UserModel();
  var id;
  bool next = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          title: Image.asset(
            "assets/mTrack.png",
            height: 100,
            width: 190,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Welcome\nBack.",
                            style: TextStyle(
                                color: AppColors.maincolor,
                                fontSize: 50,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomWidgets.textField(
                          hintText: "Email/Phone",
                          textController: inputController,
                          prefixIcon: Icon(
                            Icons.person_outline_outlined,
                            color: Colors.black54,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Email/Phone is Required");
                            }
                            // if (field == "email") {
                            //   if (!RegExp(
                            //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z]+\.[a-z]")
                            //       .hasMatch(value)) {
                            //     return ("Enter a valid Email");
                            //   }
                            // } else {
                            //   return ("Enter a valid Number");
                            // }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomWidgets.textField(
                          textController: passwordController,
                          hintText: "Password",
                          lines: 1,
                          isPassword: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.black54,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Password is Required");
                            }
                            // if (value.length <= 6
                            //     // !RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)
                            //     ) {
                            //   return ("Enter a valid Password");
                            // }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            next == true
                                ? Lottie.asset("assets/loginLoading.json",
                                    height: 100)
                                : CustomWidgets.button(
                                    text: "SIGN IN",
                                    onPressed: () async {
                                      if (RegExp(
                                              r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
                                          .hasMatch(inputController.text)) {
                                        field = "mobile";
                                      } else {
                                        field = "email";
                                      }
                                      print(field);
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setBool('isLoggedIn', true);

                                      login(inputController.text,
                                          passwordController.text);
                                    }),
                            SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(ForgotPassword());
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: AppColors.maincolor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }

  var field;
  Future<void> login(String input, password) async {
    setState(() {
      next = true;
    });
    // Future.delayed(const Duration(seconds: 7), () {
    //   setState(() {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         duration: Duration(seconds: 3),
    //         backgroundColor: AppColors.maincolor,
    //         content: Text(
    //           "Try Again",
    //           style: TextStyle(color: Colors.white, fontSize: 18),
    //         )));
    //     next = false;
    //   });
    // });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('${TextConstant.baseURL}/api/user/login');

      Map body = {
        "$field": input.toString(),
        "password": password,
      };
      http.Response res =
          await http.post(url, body: jsonEncode(body), headers: headers);
      var responseBody = res.body;
      print(responseBody);
      if (res.statusCode == 200) {
        setState(() {
          _userModel = userModelFromMap(responseBody);
          id = _userModel.userData!.employee!.id;
          prefs.setInt("UserId", id);
          next = true;
        });
        prefs.setString('Users', userModelToMap(_userModel));
        // Navigator.pushAndRemoveUntil<void>(
        //   context,
        //   MaterialPageRoute<void>(
        //     builder: (BuildContext context) => DashboardScreen(),
        //   ),
        //   (Route<dynamic> route) => false,
        // );
        Get.to(DashboardScreen());
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const DashboardScreen(),
        // ));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Logged In",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              )),
        );
      } else {
        setState(() {
          next = false;
        });
        print('failed');
        if (res.body.isNotEmpty) {
          var errMsg = json.decode(responseBody);
          print(errMsg);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errMsg["message"].toString())));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nTry Again",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      setState(() {
        next = false;
      });
      print(e.toString());
    }
    return;
  }
}
