// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/Models/userdataModel.dart';
import 'package:mtrackuser/Screens/medicalCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../custom_widgets.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  UserModel _userModel = UserModel();
  void initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      String decodedMap = prefs.getString('Users') ?? "";
      _userModel = userModelFromMap(decodedMap);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomWidgets.navBar(onTap: () {}),
      backgroundColor: Colors.white,
      drawer: const Drawer(backgroundColor: Colors.white),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded,
                size: 30, color: Color.fromARGB(255, 30, 67, 159)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        // iconTheme: IconThemeData(color: Color.fromARGB(255, 30, 67, 159)),
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
        right: true,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: ((OverscrollIndicatorNotification? notification) {
            notification!.disallowIndicator();
            return true;
          }),
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: _userModel.userData?.employee == null
                  ? Align(
                      heightFactor: 6,
                      alignment: Alignment.center,
                      child: Lottie.asset("assets/loading.json", height: 100))
                  : Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 19,
                                )),
                            Text(
                              "View Employee",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.maincolor),
                                onPressed: () {
                                  Get.to(MedicalCard());
                                },
                                child: Text("Medical Card")),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 88,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2.7,
                                        color:
                                            Color.fromARGB(255, 30, 67, 159)),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 20,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 10))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/profile.jpeg"),
                                      // getDisplayImage(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_userModel.userData?.fullName ?? "null"}",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 30, 67, 159)),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "Employee Code: ${_userModel.userData?.employee?.employeeCode ?? "null"}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Image.asset("assets/radio.png"),
                                    Container(
                                        width: 1.5,
                                        height: 0.3.sw,
                                        color:
                                            Color.fromARGB(255, 30, 67, 159)),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "BASIC DETAILS",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 30, 67, 159)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Email:",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "${_userModel.userData?.email ?? "null"}",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 120, 120, 120),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Designation:",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${_userModel.userData?.employee?.employeeOffrollment?.designation ?? "null"}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 0.26.sw,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Phone No.:",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${_userModel.userData?.mobile ?? "null"}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Education:",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${_userModel.userData?.employee?.education ?? "null"}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 34,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Image.asset("assets/radio.png"),
                                    Container(
                                        width: 1.5,
                                        height: 0.3.sw,
                                        color:
                                            Color.fromARGB(255, 30, 67, 159)),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ADDRESS",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 30, 67, 159)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Permanent Address",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      _userModel.userData?.employee
                                                      ?.addresses ==
                                                  null ||
                                              _userModel.userData!.employee!
                                                  .addresses!.isEmpty
                                          ? "null"
                                          : "${_userModel.userData?.employee?.addresses![0].addressLine1}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Temporary Address",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      _userModel.userData?.employee
                                                      ?.addresses ==
                                                  null ||
                                              _userModel.userData!.employee!
                                                  .addresses!.isEmpty
                                          ? "null"
                                          : "${_userModel.userData?.employee?.addresses![0].addressLine1}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 34,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Image.asset("assets/radio.png"),
                                    Container(
                                        width: 1.5,
                                        height: 0.6.sw,
                                        color:
                                            Color.fromARGB(255, 30, 67, 159)),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "JOB HISTORY",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 30, 67, 159)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "MG Road",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Start Date",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${_userModel.userData?.employee?.employeeOffrollment?.thisRoleStartDate ?? "null"}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Malviya Nagar",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Start Date",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Jan 01,2019",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 0.36.sw,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Text(
                                      "Designation",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${_userModel.userData?.employee?.employeeOffrollment?.designation ?? "null"}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "End Date",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${_userModel.userData?.employee?.employeeOffrollment?.lastWorkingDate ?? "null"}",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Designation",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "UX Designer",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "End Date",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 84, 84),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Jan 01, 2020",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 120, 120, 120),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}
