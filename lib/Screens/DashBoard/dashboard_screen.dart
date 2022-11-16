import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/Navigation/locator.dart';
import 'package:mtrackuser/Navigation/navigation_service.dart';
import 'package:mtrackuser/Screens/DashBoard/annoucements.dart';
import 'package:mtrackuser/Screens/DashBoard/attendance.dart';
import 'package:mtrackuser/Screens/DashBoard/companyPolicies.dart';
import 'package:mtrackuser/Screens/DashBoard/companyProfile.dart';
import 'package:mtrackuser/Screens/DashBoard/holiday_list.dart';
import 'package:mtrackuser/Screens/DashBoard/leave.dart';
import 'package:mtrackuser/Screens/DashBoard/myprofile.dart';
import 'package:mtrackuser/Screens/DashBoard/payroll.dart';
import 'package:mtrackuser/Screens/DashBoard/workProfile.dart';
import 'package:mtrackuser/Screens/login/login_screen.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  List route = const [
    MyProfile(),
    Attendance(),
    CompanyProfile(),
    Payroll(),
    HolidayList(),
    Leaves(),
    CompanyPolicies(),
    Annoucements(),
    WorkProfile()
  ];

  List<String> svg = [
    "assets/My Profile.png",
    "assets/Attendance.png",
    "assets/Company Profile.png",
    "assets/Payroll.png",
    "assets/Holidays.png",
    "assets/Leaves.png",
    "assets/Company Policies.png",
    "assets/Announcements.png",
    "assets/Work Profile.png",
  ];

  List<String> gridTitle = [
    "My Profile",
    "Attendance",
    "Company\nProfile",
    "Payroll",
    "Holidays",
    "Leaves",
    "Company\nPolicies",
    "Announcements",
    "Work Profile",
  ];

  bool show = true;
  bool showResume = false;
  String checkIn = "--:--";
  String checkOut = "--:--";
  var employeeId;
  @override
  void initState() {
    // TODO: implement initState
    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getInt('UserId');
    setState(() {
      employeeId = value;
    });
    print("value + $employeeId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomWidgets.navBar(onTap: () {}),
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('isLoggedIn', false);
                  Get.to(LoginScreen());
                },
                child: Text("Log Out")),
          ],
        ),
      ),
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
          height: 1.sw,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.15.sw, left: 15),
          child: Column(
            children: [
              SizedBox(
                  child: Column(
                children: [
                  Center(
                      child: show == true
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  show = false;
                                });
                                clockIn("checkIn");
                                var In = DateFormat('hh:mm a')
                                    .format(DateTime.now());
                                setState(() {
                                  checkIn = In;
                                });
                              },
                              child: Image.asset("assets/clockIn.png"))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        show = true;
                                      });
                                      clockIn("checkOut");
                                      var Out = DateFormat('hh:mm a')
                                          .format(DateTime.now());
                                      setState(() {
                                        checkOut = Out;
                                      });
                                    },
                                    child: Image.asset("assets/clockOut.png")),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showResume = true;
                                      });
                                      clockIn("break");
                                    },
                                    child: showResume == false
                                        ? Image.asset("assets/break.png")
                                        : GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showResume = false;
                                              });
                                              clockIn("resume");
                                            },
                                            child: Image.asset(
                                                "assets/resume.png"))),
                              ],
                            )),
                  SizedBox(
                    height: 0.13.sw,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Clock In',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.watch_later_outlined,
                                size: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            checkIn,
                            style: TextStyle(
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Clock Out',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.watch_later_outlined,
                                size: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            checkOut,
                            style: TextStyle(fontSize: 12.5),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Break',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.coffee,
                                size: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "--:--",
                            style: TextStyle(fontSize: 12.5),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Working HRS',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.pie_chart,
                                size: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "--:--:--",
                            style: TextStyle(fontSize: 12.5.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )),
              SizedBox(height: 0.05.sw),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 14),
                    itemCount: 9,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => route[index]));
                        },
                        child: Wrap(
                          // crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 8,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  svg[index],
                                  height: 92,
                                  width: 92,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  gridTitle[index],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Api Calling here---------
  void clockIn(String action) async {
    try {
      var baseUrl = 'http://mtrackapi.innoyuga.com';
      final uri =
          Uri.parse("$baseUrl/api/attendance/employeeAttendance/update");
      final headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      Map<String, dynamic> body = {
        "action": action,
        "employeeId": employeeId,
        "date": DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toString(),
      };
      String jsonBody = json.encode(body);
      print(body);
      final encoding = Encoding.getByName('utf-8');
      var response = await post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      int statusCode = response.statusCode;
      var responseBody = response.body;
      print(statusCode);
      print(responseBody);
    } catch (e) {
      print(e.toString());
    }
  }
}
