// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names, unused_field, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/Constants/text_constant.dart';
import 'package:mtrackuser/Navigation/locator.dart';
import 'package:mtrackuser/Navigation/navigation_service.dart';
import 'package:mtrackuser/Screens/DashBoard/annoucements.dart';
import 'package:mtrackuser/Screens/DashBoard/attendance.dart';
import 'package:mtrackuser/Screens/DashBoard/companyPolicies.dart';
import 'package:mtrackuser/Screens/DashBoard/companyProfile.dart';
import 'package:mtrackuser/Screens/DashBoard/holidayList.dart';
import 'package:mtrackuser/Screens/DashBoard/leave.dart';
import 'package:mtrackuser/Screens/DashBoard/myProfile.dart';
import 'package:mtrackuser/Screens/DashBoard/payroll.dart';
import 'package:mtrackuser/Screens/DashBoard/workProfile.dart';
import 'package:mtrackuser/Screens/fileUpload.dart';
import 'package:mtrackuser/Screens/login/login_screen.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/userdataModel.dart';
import '../medicalCard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //Access Location
  String location = 'Null, Press Button';
  String Address = 'search';
  double distanceBetweenTwoPoint = 0;
  var latitude, longitude;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    latitude = position.latitude;
    longitude = position.longitude;

    setState(() {});
  }

  final NavigationService _navigationService = locator<NavigationService>();
  List route = const [
    // MedicalCard(),
    //Test(),
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
  String wrkHRS = "--:--";
  var clockOutDate;
  bool clockOut = false;
  bool isClockedIn = false;
  bool isBreak = false;
  var employeeId;
  var geoTagAction;
  @override
  void initState() {
    initPrefs();

    super.initState();
  }

  UserModel _userModel = UserModel();
  void initPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getInt('UserId');
    isClockedIn = prefs.getBool('isClockedIn') ?? false;
    isBreak = prefs.getBool('isBreak') ?? false;
    checkIn = prefs.getString('clockInTime') ?? "--:--";
    checkOut = prefs.getString('clockOutTime') ?? "--:--";
    wrkHRS = prefs.getString('wrkHrs') ?? "--:--";
    setState(() {
      String decodedMap = prefs.getString('Users') ?? "";
      _userModel = userModelFromMap(decodedMap);
    });
    setState(() {
      employeeId = value;
    });
    setState(() {
      geoTag = _userModel
              .userData?.employee?.employeeOffrollment?.location?.geoTag ??
          "null";
      var arr = geoTag?.split(", ");
      locationId =
          _userModel.userData?.employee?.employeeOffrollment?.location?.id ??
              "null";
      empLatitude = arr?[0];
      empLongitude = arr?[1];
    });
    print(locationId);
    print(empLatitude);
    print(empLongitude);
  }

  var In, Out;
  var cI;
  var empLatitude, empLongitude, locationId;

  String? geoTag;

  //Alert Box
  showAlertDialog(BuildContext context) {
    // Create button
    Widget noButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget deleteButton = TextButton(
      child: Text("Exit"),
      onPressed: () {
        SystemNavigator.pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("Details: "),
      content: Text(
        "Are you sure want to Exit?",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [noButton, deleteButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showAlertDialog(context);
      },
      child: Scaffold(
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                    // setState(() {
                    //   checkIn = "--:--";
                    //   checkOut = "--:--";
                    //   wrkHRS = "--:--";
                    // });
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
              onPressed: () {
                Get.to(FileUpload());
              },
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
                        child: show == true && isClockedIn == false
                            ? InkWell(
                                onTap: clockOutDate ==
                                        DateFormat('dd.MM.yy')
                                            .format(DateTime.now())
                                    ? () {}
                                    : () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();

                                        //Api call
                                        //If status is successfull then update screen
                                        //Save

                                        Position position =
                                            await _getGeoLocationPosition();
                                        location =
                                            'Lat: ${position.latitude} , Long: ${position.longitude}';
                                        GetAddressFromLatLong(position);
                                        setState(() {
                                          latitude = position.latitude;
                                          longitude = position.longitude;
                                          geoTagAction = "geoTagIn";
                                        });

                                        distanceBetweenTwoPoint =
                                            Geolocator.distanceBetween(
                                                position.latitude,
                                                position.longitude,
                                                double.parse(empLatitude),
                                                double.parse(empLongitude));
                                        print(distanceBetweenTwoPoint);
                                        clockIn("checkIn");
                                        // setState(() {
                                        //   cI = DateFormat('yyyy-MM-ddTHH:mm:ss')
                                        //       .format(DateTime.now());
                                        //   In = DateFormat('hh:mm a')
                                        //       .format(DateTime.now());
                                        //   checkIn = In;
                                        // });
                                        // await prefs.setString(
                                        //     "clockInTime", checkIn);
                                        // setState(() {
                                        //   show = false;
                                        // });
                                        // if (response == null) {
                                        //   setState(() {
                                        //     CircularProgressIndicator(
                                        //       color: AppColors.maincolor,
                                        //     );
                                        //     show = false;
                                        //   });
                                        // } else {
                                        //   setState(() {
                                        //     show = true;
                                        //   });
                                        // }
                                      },
                                child: Image.asset("assets/clockIn.png"))
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();

                                        print(prefs.getBool('isClockedIn'));

                                        Position position =
                                            await _getGeoLocationPosition();
                                        location =
                                            'Lat: ${position.latitude} , Long: ${position.longitude}';
                                        setState(() {
                                          latitude = position.latitude;
                                          longitude = position.longitude;
                                          geoTagAction = "geoTagOut";
                                        });
                                        GetAddressFromLatLong(position);
                                        distanceBetweenTwoPoint =
                                            Geolocator.distanceBetween(
                                                position.latitude,
                                                position.longitude,
                                                double.parse(empLatitude),
                                                double.parse(empLongitude));
                                        print(
                                            "distanceBetweenTwoPoint: $distanceBetweenTwoPoint");
                                        clockIn("checkOut");
                                        // setState(() {
                                        //   var cO =
                                        //       DateFormat('yyyy-MM-ddTHH:mm')
                                        //           .format(DateTime.now());
                                        //   Out = DateFormat('hh:mm a')
                                        //       .format(DateTime.now());
                                        //   checkOut = Out;
                                        //   clockOut = true;
                                        //   clockOutDate = DateFormat('dd.MM.yy')
                                        //       .format(DateTime.now());
                                        //   DateTime dt1 = DateTime.parse(cO);
                                        //   DateTime dt2 = DateTime.parse(cI);
                                        //   Duration ddd = dt1.difference(dt2);
                                        //   wrkHRS =
                                        //       "${ddd.inHours % 24} hrs : ${ddd.inMinutes % 60} mins";
                                        // });
                                        // await prefs.setString("wrkHrs", wrkHRS);
                                        // await prefs.setString(
                                        //     "clockOutTime", checkOut);
                                        // Future.delayed(const Duration(hours: 3),
                                        //     () {
                                        //   setState(() {
                                        //     checkIn = "--:--";
                                        //     checkOut = "--:--";
                                        //     wrkHRS = "--:--";
                                        //   });
                                        // });
                                        // setState(() {
                                        //   show = true;
                                        // });
                                        // if (response == null) {
                                        //   setState(() {
                                        //     CircularProgressIndicator(
                                        //       color: AppColors.maincolor,
                                        //     );
                                        //     show = true;
                                        //   });
                                        // } else {
                                        //   setState(() {
                                        //     show = false;
                                        //   });
                                        // }
                                      },
                                      child:
                                          Image.asset("assets/clockOut.png")),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  showResume == false && isBreak == false
                                      ? GestureDetector(
                                          onTap: () {
                                            clockIn("break");
                                            // setState(() {
                                            //   showResume = true;
                                            // });
                                            // if (response == null) {
                                            //   setState(() {
                                            //     CircularProgressIndicator(
                                            //       color: AppColors.maincolor,
                                            //     );
                                            //     showResume = false;
                                            //   });
                                            // } else {
                                            //   setState(() {
                                            //     showResume = true;
                                            //   });
                                            // }
                                          },
                                          child:
                                              Image.asset("assets/break.png"))
                                      : GestureDetector(
                                          onTap: () {
                                            clockIn("resume");
                                            setState(() {
                                              showResume = false;
                                            });
                                            // if (response == null) {
                                            //   setState(() {
                                            //     CircularProgressIndicator(
                                            //       color: AppColors.maincolor,
                                            //     );
                                            //     showResume = true;
                                            //   });
                                            // } else {
                                            //   setState(() {
                                            //     showResume = false;
                                            //   });
                                            // }
                                          },
                                          child:
                                              Image.asset("assets/resume.png")),
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
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
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
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Row(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         Text(
                        //           'Break',
                        //           style: TextStyle(
                        //               fontSize: 12, fontWeight: FontWeight.w500),
                        //         ),
                        //         SizedBox(
                        //           width: 4,
                        //         ),
                        //         Icon(
                        //           Icons.coffee,
                        //           size: 10,
                        //         ),
                        //       ],
                        //     ),
                        //     SizedBox(
                        //       height: 3,
                        //     ),
                        //     Text(
                        //       "--:--",
                        //       style: TextStyle(fontSize: 12.5),
                        //     ),
                        //   ],
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Working HRS',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.timer_sharp,
                                  size: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              wrkHRS,
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
      ),
    );
  }

//Api Calling here---------

  clockIn(String action) async {
    try {
      final uri = Uri.parse(
          "${TextConstant.baseURL}/api/attendance/employeeAttendance/update");
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
        "locationId": distanceBetweenTwoPoint < 100 ? locationId : "null",
        "$geoTagAction": "$latitude,$longitude",
      };
      String jsonBody = json.encode(body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(body);
      // final encoding = Encoding.getByName('utf-8');
      var response = await post(
        uri,
        headers: headers,
        body: jsonBody,
        // encoding: encoding,
      );
      if (response.statusCode == 200) {
        print(action);

        if (action == "checkIn") {
          await prefs.setBool("isClockedIn", true);
          setState(() {
            isClockedIn = true;
          });
          setState(() {
            show = false;
          });
          setState(() {
            cI = DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now());
            In = DateFormat('hh:mm a').format(DateTime.now());
            checkIn = In;
          });
          await prefs.setString("clockInTime", checkIn);
          //true
          print(prefs.getBool('isClockedIn'));
        }
        if (action == "checkOut") {
          await prefs.setBool("isClockedIn", false);
          setState(() {
            isClockedIn = false;
          });
          print(prefs.getBool('isClockedIn'));
          setState(() {
            show = true;
          });
          setState(() {
            var cO = DateFormat('yyyy-MM-ddTHH:mm').format(DateTime.now());
            Out = DateFormat('hh:mm a').format(DateTime.now());
            checkOut = Out;
            clockOut = true;
            clockOutDate = DateFormat('dd.MM.yy').format(DateTime.now());
            DateTime dt1 = DateTime.parse(cO);
            DateTime dt2 = DateTime.parse(cI);
            Duration ddd = dt1.difference(dt2);
            wrkHRS = "${ddd.inHours % 24} hrs : ${ddd.inMinutes % 60} mins";
          });
          await prefs.setString("wrkHrs", wrkHRS);
          await prefs.setString("clockOutTime", checkOut);
          Future.delayed(const Duration(hours: 3), () {
            setState(() {
              checkIn = "--:--";
              checkOut = "--:--";
              wrkHRS = "--:--";
            });
          });
        }
        if (action == "break") {
          await prefs.setBool("isBreak", true);
          setState(() {
            isBreak = true;
          });
          setState(() {
            showResume = true;
          });
          //true
          print(prefs.getBool('isBreak'));
        }
        if (action == "resume") {
          await prefs.setBool("isBreak", false);
          setState(() {
            isBreak = false;
          });
          setState(() {
            showResume = false;
          });
          print(prefs.getBool('isBreak'));
        }
      } else {}
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nTry Again",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      print(e.toString());
    }
  }
}
