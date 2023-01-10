// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables, sort_child_properties_last, await_only_futures, avoid_unnecessary_containers, unnecessary_cast, must_be_immutable, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/text_constant.dart';
import 'package:mtrackuser/Models/leaveBalanceModel.dart';
import 'package:mtrackuser/Models/leaveModel.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Leaves
class Leaves extends StatefulWidget {
  const Leaves({super.key});

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  @override
  void initState() {
    _getAppliedLeaveDetails();
    _getLeaveBalance();

    super.initState();
  }

  @override
  void dispose() {
    _getAppliedLeaveDetails();
    _getLeaveBalance();
    super.dispose();
  }

  var employeeId;

  List<Color> dotColor = [AppColors.maincolor, Colors.green, Colors.red];
  List<String> leaves = ["Casual Leaves", "Earned Leaves", "Sick Leaves"];
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: ((OverscrollIndicatorNotification? notification) {
          notification!.disallowIndicator();
          return true;
        }),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: (appliedLeaveData == null && leaveBalance == null)
              ? Align(
                  heightFactor: 6,
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/loading.json", height: 100))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                            "Leaves",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => ApplyLeaves(),
                            ),
                          );
                        },
                        child: Text(
                          "Apply Leave",
                          style: TextStyle(fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(103, 20),
                          splashFactory: NoSplash.splashFactory,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: AppColors.maincolor,
                        ),
                      ),
                      Align(
                        widthFactor: 2.88,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Applied Leaves",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkgrey),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (appliedLeaveData != null) ...[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                  width: 1.7)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 0.6.sw,
                                child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 20,
                                        ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: appliedLeaveData.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        ((BuildContext context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                " • ${DateFormat.yMMMd().format(DateTime.parse(appliedLeaveData[index]["createdAt"]))}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.darkgrey),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          LeaveDetails(
                                                        id: appliedLeaveData[
                                                            index]["id"],
                                                      ),
                                                    ));
                                                  },
                                                  child: Text(
                                                    "View Details",
                                                    style: TextStyle(
                                                      fontSize: 14.5,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 21, 78, 222),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1.5,
                                            height: 2,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "Status",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.darkgrey),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    appliedLeaveData[index]
                                                        ["status"],
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.darkgrey),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Leave Type",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.darkgrey),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    appliedLeaveData[index]
                                                        ["leaveType"]["name"],
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.darkgrey),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Start Date",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.darkgrey),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    DateFormat('dd.MM.yy')
                                                        .format(DateTime.parse(
                                                            appliedLeaveData[
                                                                    index][
                                                                "startDateTime"])),
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.darkgrey),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Days",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.darkgrey),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    "${appliedLeaveData[index]["totalLeavesToConsider"]} Days",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.darkgrey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    })),
                              ),
                            ],
                          ),
                        ),
                      ] else ...[
                        Container()
                      ],
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              "Leave Balance",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkgrey),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.8,
                                                  color: Color.fromARGB(
                                                      255, 227, 227, 227)),
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          margin: EdgeInsets.only(
                                            bottom: 10.0,
                                          ),
                                          child: ExpansionTile(
                                            tilePadding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            iconColor: AppColors.maincolor,
                                            collapsedIconColor:
                                                AppColors.maincolor,
                                            title: Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  color: dotColor[index],
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      leaves[index],
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .maincolor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "(9 Remaining)",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .maincolor,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            children: [
                                              ListTile(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 5),
                                                  title: Column(
                                                    children: [
                                                      Divider(
                                                        thickness: 1.5,
                                                        color: Color.fromARGB(
                                                            255, 218, 218, 218),
                                                        height: 0,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                right: 20,
                                                                bottom: 13),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Credited Leaves- ",
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              97,
                                                                              97,
                                                                              97,
                                                                              1),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          3.5,
                                                                    ),
                                                                    Text(
                                                                      "1",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey[600],
                                                                        fontSize:
                                                                            13,
                                                                        height:
                                                                            1.3,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Penalty- ",
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              97,
                                                                              97,
                                                                              97,
                                                                              1),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          3.5,
                                                                    ),
                                                                    Text(
                                                                      "2",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey[600],
                                                                        fontSize:
                                                                            13,
                                                                        height:
                                                                            1.3,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Applied Leaves- ",
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              97,
                                                                              97,
                                                                              97,
                                                                              1),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          3.5,
                                                                    ),
                                                                    Text(
                                                                      "3",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey[600],
                                                                        fontSize:
                                                                            13,
                                                                        height:
                                                                            1.3,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                // SizedBox(
                                                                //   width: 120,
                                                                // ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Balance-  ",
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              97,
                                                                              97,
                                                                              97,
                                                                              1),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          3.5,
                                                                    ),
                                                                    FittedBox(
                                                                      child:
                                                                          Text(
                                                                        "4",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.grey[600],
                                                                          fontSize:
                                                                              13,
                                                                          height:
                                                                              1.3,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ));
                                    }))
                          ]))
                    ]),
        ),
      ),
    );
  }

  dynamic appliedLeaveData;
  void _getAppliedLeaveDetails() async {
    List<AppliedLeaveData> allData = List.empty(growable: true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = await prefs.getInt('UserId');
    if (!mounted) return;
    setState(() {
      employeeId = value;
    });
    try {
      String url =
          '${TextConstant.baseURL}/api/leave/leave-request/list?employeeId=$employeeId&status=pending';
      http.Response res;
      res = await http.get(Uri.parse(url));
      appliedLeaveData = jsonDecode(res.body);
      for (int i = 0; i < appliedLeaveData.length; i++) {
        allData.add(AppliedLeaveData(
          appliedLeaveData[i]["id"],
          appliedLeaveData[i]["status"],
          appliedLeaveData[i]["reasonForLeave"],
          appliedLeaveData[i]["employeeId"],
          appliedLeaveData[i]["leaveTypeId"],
          appliedLeaveData[i]["startDateTime"],
          appliedLeaveData[i]["endDateTime"],
          appliedLeaveData[i]["leaveType"]["name"],
          appliedLeaveData[i]["createdAt"],
        ));
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nIt may take some time.",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Leaves(),
      ));
    }
    if (!mounted) return;
    setState(() {});
  }

  //Leave Balance Api
  dynamic leaveBalance;
  LeaveBalanceModel _leaveBalanceModel = LeaveBalanceModel();
  List balanceKey = [];
  void _getLeaveBalance() async {
    try {
      List<LeaveBalance> allData = List.empty(growable: true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var value = await prefs.getInt('UserId');
      if (!mounted) return;
      setState(() {
        employeeId = value;
      });
      String url =
          '${TextConstant.baseURL}/api/leave/leave-available/employee-balance-list?employeeId=$employeeId';
      http.Response res;
      res = await http.get(Uri.parse(url));
      leaveBalance = jsonDecode(res.body);
      print(res.body);
      _leaveBalanceModel = LeaveBalanceModel.fromJson(leaveBalance);
      for (int i = 0; i < leaveBalance.length; i++) {
        allData.add(LeaveBalance(
          leaveBalance["Sick Leave"]["leavesAccruedThisMonth"],
          leaveBalance["Sick Leave"]["leavesTakenThisMonth"],
          leaveBalance["Sick Leave"]["leavesMonthOpeningBalance"],
        ));
        print(leaveBalance["Sick Leave"]["leavesAccruedThisMonth"]);
      }
      leaveBalance.forEach((key, value) {
        print('key is $key');
        print('value is $value ');
      });
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nIt may take some time.",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Leaves(),
      ));
    }
    if (!mounted) return;
    setState(() {});
  }
}

//Apply Leaves
class ApplyLeaves extends StatefulWidget {
  const ApplyLeaves({super.key});

  @override
  State<ApplyLeaves> createState() => _ApplyLeavesState();
}

class _ApplyLeavesState extends State<ApplyLeaves> {
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController reason = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedFromHalf;
  String? selectedToHalf;
  var fromHalf = [
    'First Half',
    'Second Half',
  ];
  var toHalf = [
    'First Half',
    'Second Half',
  ];
  bool nextPage = false;
  String? selectedLeaveType;
  int? selectLeaveId;
  var employeeId;
  @override
  void initState() {
    _getLeaveList();
    // Future.delayed(const Duration(seconds: 4), () {
    //   setState(() {
    //     _getLeaveList();
    //   });
    // });
    super.initState();
  }

  List<LeaveType> allLeave = List.empty(growable: true);
  dynamic leaveData;
  String url = '${TextConstant.baseURL}/api/leave/leave-type/list?companyId=1';
  void _getLeaveList() async {
    try {
      http.Response res;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var value = await prefs.getInt('UserId');
      setState(() {
        employeeId = value;
      });
      res = await http.get(Uri.parse(url));
      leaveData = jsonDecode(res.body);
      for (int i = 0; i < leaveData.length; i++) {
        allLeave.add(LeaveType(leaveData[i]["id"], leaveData[i]["name"]));
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nIt may take some time.",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ApplyLeaves(),
      ));
    }
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
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: ((OverscrollIndicatorNotification? notification) {
            notification!.disallowIndicator();
            return true;
          }),
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: leaveData == null
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
                                  "Leaves",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Apply Leaves",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Leave Type*",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField<String>(
                                    validator: (value) {
                                      if (value == null) {
                                        return ("Select Leave Type");
                                      }
                                      return null;
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0, horizontal: 17),
                                        hintText: "Select Leave",
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 136, 136, 136),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 227, 227, 227),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    isExpanded: false,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    iconSize: 30,
                                    value: selectedLeaveType,
                                    items: allLeave
                                        .map((ite) => DropdownMenuItem<String>(
                                            value: ite.id.toString(),
                                            child: Text(
                                              ite.name,
                                            )))
                                        .toList(),
                                    onChanged: (item) {
                                      selectedLeaveType = item! as String?;
                                      setState(() {
                                        selectLeaveId = int.parse(item);
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "From*",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomWidgets.textField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ("Select Date");
                                                }
                                                return null;
                                              },
                                              textController: fromDate,
                                              width: 140,
                                              height: 70,
                                              readOnly: true,
                                              hintText: "Select Date",
                                              lines: 1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 8),
                                              onTap: () async {
                                                var from = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2050));
                                                fromDate.text = from
                                                    .toString()
                                                    .substring(0, 10);
                                              },
                                              suffixIcon: Icon(
                                                Icons.calendar_month,
                                                color: Colors.black54,
                                                size: 20,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Select Half",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child:
                                                DropdownButtonFormField<String>(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 10),
                                                  hintText: "Select Half",
                                                  hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 136, 136, 136),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    227,
                                                                    227,
                                                                    227),
                                                            width: 1.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  fillColor: Colors.white,
                                                  filled: true),
                                              isExpanded: false,
                                              icon: const Icon(Icons
                                                  .arrow_drop_down_outlined),
                                              iconSize: 30,
                                              value: selectedFromHalf,
                                              items: fromHalf
                                                  .map((item) => DropdownMenuItem<
                                                          String>(
                                                      value: item,
                                                      child: Text(item,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))))
                                                  .toList(),
                                              onChanged: (item) {
                                                selectedFromHalf = item!;
                                              },
                                              onSaved: (newValue) {
                                                newValue = selectedFromHalf;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "To*",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomWidgets.textField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ("Select Date");
                                                }
                                                return null;
                                              },
                                              textController: toDate,
                                              width: 140,
                                              height: 70,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                              readOnly: true,
                                              hintText: "Select Date",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 8),
                                              onTap: () async {
                                                var to = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2050));
                                                toDate.text = to
                                                    .toString()
                                                    .substring(0, 10);
                                              },
                                              suffixIcon: Icon(
                                                Icons.calendar_month,
                                                color: Colors.black54,
                                                size: 20,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Select Half",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child:
                                                DropdownButtonFormField<String>(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0.0,
                                                          horizontal: 10),
                                                  hintText: "Select Half",
                                                  hintStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 136, 136, 136),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    227,
                                                                    227,
                                                                    227),
                                                            width: 1.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  fillColor: Colors.white,
                                                  filled: true),
                                              isExpanded: false,
                                              icon: const Icon(Icons
                                                  .arrow_drop_down_outlined),
                                              iconSize: 30,
                                              value: selectedToHalf,
                                              items: toHalf
                                                  .map((item) => DropdownMenuItem<
                                                          String>(
                                                      value: item,
                                                      child: Text(item,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))))
                                                  .toList(),
                                              onChanged: (item) {
                                                selectedToHalf = item!;
                                              },
                                              onSaved: (newValue) {
                                                newValue = selectedToHalf;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Reason for Leave*",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomWidgets.textField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Type Reason");
                                      }
                                      return null;
                                    },
                                    lines: 3,
                                    hintText: "Type here ...",
                                    textController: reason,
                                  ),
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 123, 123, 123),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,

                                            //maximumSize: Size(7, 3),
                                            minimumSize: const Size(100, 40),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 232, 232, 232),
                                                    width: 1.5),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0))),
                                      ),
                                      nextPage == true
                                          ? const CircularProgressIndicator(
                                              color: AppColors.maincolor)
                                          : ElevatedButton(
                                              onPressed: () async {
                                                if (!_formKey.currentState!
                                                    .validate()) {
                                                  return;
                                                }
                                                postApplyLeave();
                                              },
                                              child: Text(
                                                "Apply",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 30, 67, 159),

                                                  //maximumSize: Size(7, 3),
                                                  minimumSize:
                                                      const Size(100, 40),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0))),
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
              )),
        ));
  }

  void postApplyLeave() async {
    try {
      final uri =
          Uri.parse("${TextConstant.baseURL}/api/leave/leave-request/add");
      final headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };

      Map<String, dynamic> body = {
        "id": 4,
        "companyId": 1,
        "leaveTypeId": selectLeaveId,
        "entityId": 1,
        "employeeId": employeeId,
        "startDateTime": fromDate.text,
        "endDateTime": toDate.text,
        "status": "pending",
        "reasonForLeave": reason.text,
        "totalLeavesToConsider": 1,
        "reasonLeaveToConsider": null,
        "approvingAuthorityId": null,
      };
      String jsonBody = json.encode(body);
      final encoding = Encoding.getByName('utf-8');

      var response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      int statusCode = response.statusCode;
      print(statusCode);
      var responseBody = response.body;
      if (statusCode == 200) {
        setState(() {
          nextPage = true;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Leaves(),
          ),
        );
      } else if (statusCode != 200) {
        setState(() {
          nextPage = false;
        });
        if (response.body.isNotEmpty) {
          var errMsg = json.decode(responseBody);

          if (errMsg["message"] == "Must be greater than 10 words") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text("Reason for leave must be greater than 10 words")));
          } else if (errMsg["msg"] == "Leave Request created successfully") {
            setState(() {
              nextPage = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Leaves(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errMsg["message"].toString())));
          }

          setState(() {
            nextPage == false;
          });
        }
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nIt may take some time.",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ApplyLeaves(),
      ));
    }
  }
}

//Leave Details

class LeaveDetails extends StatefulWidget {
  int id;
  LeaveDetails({super.key, required this.id});

  @override
  State<LeaveDetails> createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {
  @override
  void initState() {
    _storeLeaveId();

    super.initState();
    _getLeaveDetails();
    // Future.delayed(const Duration(seconds: 5), () {
    //   setState(() {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         backgroundColor: AppColors.maincolor,
    //         content: Text(
    //           "It may take some time.",
    //           style: TextStyle(color: Colors.white, fontSize: 18),
    //         )));
    //   });
    //   _getLeaveDetails();
    // });
  }

  var leaveid;
  void _storeLeaveId() {
    int id = widget.id;
    setState(() {
      leaveid = id;
    });
  }

  @override
  void dispose() {
    _getLeaveDetails();
    super.dispose();
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
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: ((OverscrollIndicatorNotification? notification) {
            notification!.disallowIndicator();
            return true;
          }),
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: leaveData == null
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
                                "Leaves",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            //  height: 600,
                            width: 400,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 227, 227, 227),
                                      blurRadius: 2,
                                      spreadRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Leaves Details",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkgrey),
                                    ),
                                    Text(
                                      leaveData["status"],
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(168, 0, 126, 65)),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black12,
                                  height: 35,
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: AppColors.maincolor,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "From",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color:
                                                          AppColors.maincolor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "(First Half)",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          AppColors.maincolor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              DateFormat('dd.MM.yy').format(
                                                  DateTime.parse(leaveData[
                                                      "startDateTime"])),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.maincolor,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: AppColors.maincolor,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "To",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color:
                                                          AppColors.maincolor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "(Second Half)",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          AppColors.maincolor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              DateFormat('dd.MM.yy').format(
                                                  DateTime.parse(leaveData[
                                                      "endDateTime"])),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.maincolor,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                            blurRadius: 1,
                                            spreadRadius: 0.5)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Days:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      ),
                                      VerticalDivider(
                                        thickness: 1.5,
                                      ),
                                      Text(
                                        "${leaveData["totalLeavesToConsider"]} Days",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkgrey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                            blurRadius: 1,
                                            spreadRadius: 0.5)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Date Requested:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      ),
                                      VerticalDivider(
                                        thickness: 1.5,
                                      ),
                                      Text(
                                        DateFormat('dd.MM.yy').format(
                                            DateTime.parse(
                                                leaveData["createdAt"])),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkgrey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                            blurRadius: 1,
                                            spreadRadius: 0.5)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Leave Type:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      ),
                                      VerticalDivider(
                                        thickness: 1.5,
                                      ),
                                      Text(
                                        leaveData["leaveType"]["name"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkgrey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                            blurRadius: 1,
                                            spreadRadius: 0.5)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Remaining Balance:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      ),
                                      VerticalDivider(
                                        thickness: 1.5,
                                      ),
                                      Text(
                                        leaveData["leaveAvailable"]
                                                ["leaveRemaining"]
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkgrey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                            blurRadius: 1,
                                            spreadRadius: 0.5)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Reason for Leave:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      ),
                                      VerticalDivider(
                                        thickness: 1.5,
                                      ),
                                      Text(
                                        leaveData["reasonForLeave"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkgrey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                            blurRadius: 1,
                                            spreadRadius: 0.5)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Approved By:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      ),
                                      Align(
                                        child: VerticalDivider(
                                          thickness: 1.5,
                                        ),
                                      ),
                                      Text(
                                        "Vijay Das",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.darkgrey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Cancel Request",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 123, 123, 123),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,

                                    //maximumSize: Size(7, 3),
                                    minimumSize: const Size(100, 40),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 232, 232, 232),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                              ),
                              ElevatedButton(
                                onPressed: () async {},
                                child: Text(
                                  "Edit Request",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 30, 67, 159),

                                    //maximumSize: Size(7, 3),
                                    minimumSize: const Size(160, 40),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ])),
        ));
  }

  dynamic leaveData;
  void _getLeaveDetails() async {
    try {
      List<LeaveDetailsData> allData = List.empty(growable: true);
      String url = '${TextConstant.baseURL}/api/leave/leave-detail/$leaveid';
      http.Response res;
      res = await http.get(Uri.parse(url));
      leaveData = jsonDecode(res.body);
      // for (int i = 0; i < leaveData.length; i++) {
      // allData.add(LeaveDetailsData(
      //   leaveData["id"],
      //   leaveData["status"],
      //   leaveData["totalLeavesToConsider"],
      //   leaveData["reasonForLeave"],
      //   leaveData["employeeId"],
      //   leaveData["leaveTypeId"],
      //   leaveData["startDateTime"],
      //   leaveData["endDateTime"],
      //   leaveData["leaveType"]["name"],
      //   leaveData["leaveAvailable"]["leaveRemaining"],
      //   leaveData["createdAt"],
      // ));
      // }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nIt may take some time.",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      _getLeaveDetails();
    }
    if (!mounted) return;
    setState(() {});
  }
}

//Edit Leave Request

class EditLeaveRequest extends StatefulWidget {
  const EditLeaveRequest({super.key});

  @override
  State<EditLeaveRequest> createState() => _EditLeaveRequestState();
}

class _EditLeaveRequestState extends State<EditLeaveRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
