import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';

class Payroll extends StatefulWidget {
  const Payroll({super.key});

  @override
  State<Payroll> createState() => _PayrollState();
}

class _PayrollState extends State<Payroll> {
  String? selectedFromHalf;
  String? selectedToHalf;
  var month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  var year = [
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
  ];

  List<String> svg = [
    "assets/Payroll/1.png",
    "assets/CompanyProfilePNG/3.png",
    "assets/CompanyProfilePNG/2.png",
    "assets/CompanyProfilePNG/4.png",
    "assets/Payroll/3.png",
    "assets/WorkProfilePNG/Five.png",
    "assets/Payroll/2.png",
  ];
  List<String> empDetailsHeader = [
    "Employee Name:",
    "Employee ID:",
    "Designation:",
    "Department:",
    "Work Days:",
    "Location:",
    "LOP:",
  ];
  List empDetailsSubHeader = [
    "Sahil Sharma",
    "E15614",
    "Accountant",
    "Finance",
    "31",
    "Bengaluru",
    "0"
  ];
  List<String> svg2 = [
    "assets/Payroll/4.png",
    "assets/Payroll/5.png",
    "assets/Payroll/6.png",
    "assets/Payroll/7.png",
  ];
  List<String> empBankDetailsHeader = [
    "Bank Name:",
    "PAN No.:",
    "Bank Account No.:",
    "PF No.:",
  ];
  List empBankDetailsSubHeader = [
    "CITI Bank",
    "CUSPG0970B",
    "848582394",
    "AS/ASD/12",
  ];
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
                // attendanceData == null
                //     ? Align(
                //         heightFactor: 6,
                //         alignment: Alignment.center,
                //         child: Lottie.asset("assets/loading.json", height: 100))
                //     :
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Payroll",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Payroll coming soon",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 200,
                    width: 0.9.sw,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 230, 230, 230),
                            width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PAYSLIP",
                          style: TextStyle(
                              color: AppColors.maincolor,
                              fontSize: 16,
                              letterSpacing: 0.4,
                              fontWeight: FontWeight.w600),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 228, 227, 227),
                          thickness: 2,
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Month",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 120,
                                  height: 40,
                                  child: DropdownButtonFormField<String>(
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0, horizontal: 8),
                                        hintText: "Month",
                                        hintStyle: const TextStyle(
                                          fontSize: 13,
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
                                              color: Color.fromARGB(
                                                  255, 215, 215, 215),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    isExpanded: true,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    iconSize: 25,
                                    value: selectedToHalf,
                                    items: month
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400))))
                                        .toList(),
                                    onChanged: (item) {
                                      selectedToHalf = item!;
                                      print(selectedToHalf);
                                    },
                                    onSaved: (newValue) {
                                      newValue = selectedToHalf;
                                      print(selectedToHalf);
                                      print(newValue);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Color.fromARGB(255, 120, 120, 120),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Year",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 120,
                                  height: 40,
                                  child: DropdownButtonFormField<String>(
                                    borderRadius: BorderRadius.circular(10),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0.0, horizontal: 8),
                                        hintText: "Year",
                                        hintStyle: const TextStyle(
                                          fontSize: 13,
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
                                              color: Color.fromARGB(
                                                  255, 215, 215, 215),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    isExpanded: true,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_outlined),
                                    iconSize: 25,
                                    value: selectedFromHalf,
                                    items: year
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400))))
                                        .toList(),
                                    onChanged: (item) {
                                      selectedFromHalf = item!;
                                      print(selectedFromHalf);
                                    },
                                    onSaved: (newValue) {
                                      newValue = selectedFromHalf;
                                      print(selectedFromHalf);
                                      print(newValue);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "View",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 123, 123, 123),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,

                                  //maximumSize: Size(7, 3),
                                  minimumSize: const Size(101, 35),
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
                              onPressed: () {},
                              child: Text(
                                "Download",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 30, 67, 159),

                                  //maximumSize: Size(7, 3),
                                  minimumSize: const Size(101, 35),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.5),
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 0.9.sw,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromARGB(255, 230, 230, 230),
                              width: 2)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EMPLOYEE DETAILS",
                              style: TextStyle(
                                  color: AppColors.maincolor,
                                  fontSize: 16,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.w600),
                            ),
                            Divider(
                              color: Color.fromARGB(255, 228, 227, 227),
                              thickness: 2,
                              height: 24,
                            ),
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 4 / 2,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 50,
                                        mainAxisSpacing: 0),
                                itemCount: 7,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          svg[index],
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              empDetailsHeader[index],
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.darkgrey,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              empDetailsSubHeader[index],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.darkgrey,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ])),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 0.9.sw,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromARGB(255, 230, 230, 230),
                              width: 2)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EMPLOYEE DETAILS",
                              style: TextStyle(
                                  color: AppColors.maincolor,
                                  fontSize: 16,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.w600),
                            ),
                            Divider(
                              color: Color.fromARGB(255, 228, 227, 227),
                              thickness: 2,
                              height: 24,
                            ),
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 4 / 2,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 35,
                                        mainAxisSpacing: 0),
                                itemCount: 4,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          svg2[index],
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              empBankDetailsHeader[index],
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.darkgrey,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              empBankDetailsSubHeader[index],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.darkgrey,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ])),
                  SizedBox(
                    height: 30,
                  )
                ])));
  }
}
