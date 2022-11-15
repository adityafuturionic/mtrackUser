import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/connect.dart';

import 'package:http/http.dart' as http;
import 'package:mtrackuser/ClassData/viewEmp.dart';

import '../../custom_widgets.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ViewEmp allData = ViewEmp();

  @override
  void initState() {
    _viewEmployee();
    super.initState();
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
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Column(
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
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
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
                              color: Color.fromARGB(255, 30, 67, 159)),
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
                        "${allData.firstName!} ${allData.lastName!}",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 30, 67, 159)),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Employee ID: ${allData.id!}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
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
                              color: Color.fromARGB(255, 30, 67, 159)),
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
                                color: Color.fromARGB(255, 30, 67, 159)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Email:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            allData.email!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Designation:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            allData.designation!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 0.24.sw,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                size: 22,
                                color: Color.fromARGB(255, 30, 67, 159),
                              )),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Phone No.:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            allData.mobile!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Education:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            allData.education!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
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
                              color: Color.fromARGB(255, 30, 67, 159)),
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
                                color: Color.fromARGB(255, 30, 67, 159)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Permanent Address",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${empData["addresses"][0]["addressLine1"]} ${empData["addresses"][0]["landmark"]},\n${empData["addresses"][0]["pincode"]}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Temporary Address",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${empData["addresses"][1]["addressLine1"]} ${empData["addresses"][1]["landmark"]},\n${empData["addresses"][1]["pincode"]}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 0.25.sw,
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 22,
                            color: Color.fromARGB(255, 30, 67, 159),
                          )),
                      SizedBox(
                        height: 13,
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
                              color: Color.fromARGB(255, 30, 67, 159)),
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
                                color: Color.fromARGB(255, 30, 67, 159)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "MG Road",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Start Date",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Jan 01,2022",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Malviya Nagar",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Start Date",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Jan 01,2019",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 0.26.sw,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                size: 22,
                                color: Color.fromARGB(255, 30, 67, 159),
                              )),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Designation",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            allData.designation!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "End Date",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Currently Working",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Designation",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "UX Designer",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            "End Date",
                            style: TextStyle(
                                color: Color.fromARGB(255, 84, 84, 84),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Jan 01, 2020",
                            style: TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120),
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
    );
  }

  dynamic empData;
  Future _viewEmployee() async {
    String url =
        "http://mtrackapi.innoyuga.com/api/employee/employee-basic/?employeeId=1";
    // String url = '${TextConstants.baseUrl}employee-basic/?employeeId=1';
    var res = await http.get(Uri.parse(url));
    empData = jsonDecode(res.body);
    allData.id = empData["id"];
    allData.email = empData["employee"]["email"];
    allData.education = empData["education"];
    allData.firstName = empData["employee"]["firstName"];
    allData.lastName = empData["employee"]["lastName"];
    allData.mobile = empData["employee"]["mobile"];
    allData.designation = empData["employeeOnrollment"]["designation"];
    allData.addressLine1 = empData["addresses"][0]["addressLine1"];
    //allData.addressLine2 = empData["addresses"]["addressLine2"];
    allData.userRoles = empData["employeeOnrollment"]["userRoles"];
    allData.department = empData["employeeOnrollment"]["department"];
    allData.joiningDate = empData["employeeOnrollment"]["joiningDate"];
    allData.thisRoleStartDate =
        empData["employeeOnrollment"]["thisRoleStartDate"];
    allData.companyJoiningDate =
        empData["employeeOnrollment"]["companyJoiningDate"];
    allData.lastWorkingDate = empData["employeeOnrollment"]["lastWorkingDate"];
    allData.pincode = empData["addresses"][0]["pincode"];
    allData.landmark = empData["addresses"][0]["landmark"];
    allData.addressType = empData["addresses"][0]["addressType"];

    setState(() {});
  }
}
