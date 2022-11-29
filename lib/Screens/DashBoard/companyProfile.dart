// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Models/userdataModel.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  List<String> svg = [
    "assets/WorkProfilePNG/One.png",
    "assets/CompanyProfilePNG/2.png",
    "assets/CompanyProfilePNG/3.png",
    "assets/CompanyProfilePNG/4.png",
    "assets/WorkProfilePNG/Five.png",
    "assets/WorkProfilePNG/Seven.png",
    "assets/WorkProfilePNG/Two.png",
  ];
  List<String> clientHeader = [
    "Company Name:",
    "Designation:",
    "Employee ID:",
    "Department:",
    "Location:",
    "Address:",
    "Reporting Manager:",
    "Pincode:"
  ];
  List<String> companyHeader = [
    "Company Name:",
    "Designation:",
    "Reporting Manager:",
    "Department:",
  ];
  List companySubHeader = [];

  UserModel _userModel = UserModel();
  static var designation, empId, Dep, Loc, Add, RepMan, Pin;

  List clientSubHeader = [];
  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String decodedMap = prefs.getString('Users') ?? "";
    _userModel = userModelFromMap(decodedMap);
    setState(() {
      designation =
          _userModel.userData?.employee?.employeeOffrollment!.designation;
      empId = _userModel.userData?.employee?.id;
      Dep = _userModel.userData?.employee?.employeeOffrollment!.department;
      Add = _userModel.userData?.employee?.addresses == null ||
              _userModel.userData!.employee!.addresses!.isEmpty
          ? "null"
          : "${_userModel.userData?.employee?.addresses![0].addressLine1}";
      clientSubHeader = [
        designation,
        designation,
        empId.toString(),
        Dep,
        designation,
        Add,
        designation,
      ];
      companySubHeader = [
        "Wipro",
        designation,
        "SRK",
        Dep,
      ];
    });
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
              ),
              color: AppColors.maincolor,
            ),
            SizedBox(
              width: 10,
            )
          ],
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
        body: SingleChildScrollView(
            child: _userModel.userData == null
                ? Align(
                    heightFactor: 6,
                    alignment: Alignment.center,
                    child: Lottie.asset("assets/loading.json", height: 100))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Company Profile",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CLIENT DETAILS",
                                style: TextStyle(
                                    color: AppColors.maincolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6),
                              ),
                              Container(
                                height: 410,
                                child: ListView.builder(
                                    itemCount: 7,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        child: Column(
                                          children: [
                                            Divider(
                                              color: Color.fromARGB(
                                                  255, 216, 215, 215),
                                              thickness: 1,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      svg[index],
                                                    ),
                                                    SizedBox(
                                                      width: 14,
                                                    ),
                                                    Text(
                                                      clientHeader[index],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.darkgrey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  clientSubHeader[index],
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 128, 128, 128),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "COMPANY DETAILS",
                                style: TextStyle(
                                    color: AppColors.maincolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6),
                              ),
                              Container(
                                height: 260,
                                child: ListView.builder(
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        child: Column(
                                          children: [
                                            Divider(
                                              color: Color.fromARGB(
                                                  255, 216, 215, 215),
                                              thickness: 1,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      svg[index],
                                                    ),
                                                    SizedBox(
                                                      width: 14,
                                                    ),
                                                    Text(
                                                      companyHeader[index],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.darkgrey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  companySubHeader[index],
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 128, 128, 128),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        )
                      ])));
  }
}
