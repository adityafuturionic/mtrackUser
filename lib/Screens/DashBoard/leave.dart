// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:mtrackuser/ClassData/leave_type_data.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:page_transition/page_transition.dart';

//Leaves
class Leaves extends StatefulWidget {
  const Leaves({super.key});

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  List<Map<String, dynamic>> _items = List.generate(
      10,
      (index) => {
            'id': index,
            'title': 'Item $index',
            'description':
                'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            'isExpanded': false
          });
  bool expand = false;
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
        child: Column(
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
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(ApplyLeaves());
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
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Applied Leaves",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkgrey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                        scrollDirection: Axis.vertical,
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: ((BuildContext context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Jul 25,2022",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkgrey),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "View Details",
                                        style: TextStyle(
                                          fontSize: 14.5,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.maincolor,
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
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.darkgrey),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Pending",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Leave Type",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.darkgrey),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Sick Leave",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Start Date",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.darkgrey),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "27/07/2022",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Days",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.darkgrey),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "2 Days",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.darkgrey),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
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
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {},
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text('Item 1'),
                          );
                        },
                        body: ListTile(
                          title: Text('Item 1 child'),
                          subtitle: Text('Details goes here'),
                        ),
                        isExpanded: expand ? true : false,
                      ),
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text('Item 2'),
                          );
                        },
                        body: ListTile(
                          title: Text('Item 2 child'),
                          subtitle: Text('Details goes here'),
                        ),
                        isExpanded: expand == true ? true : false,
                      ),
                    ],
                  ),
                  ExpansionPanelList(
                    elevation: 3,
                    expansionCallback: (index, isExpanded) {
                      setState(() {
                        _items[index]['isExpanded'] = !isExpanded;
                      });
                    },
                    animationDuration: Duration(milliseconds: 600),
                    children: _items
                        .map(
                          (item) => ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: item['isExpanded'] == true
                                ? Colors.cyan[100]
                                : Colors.white,
                            headerBuilder: (_, isExpanded) => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                child: Text(
                                  item['title'],
                                  style: TextStyle(fontSize: 20),
                                )),
                            body: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Text(item['description']),
                            ),
                            isExpanded: item['isExpanded'],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
  @override
  void initState() {
    _getLeaveList();
    super.initState();
  }
//CALLING STATE API HERE
// Get State information by API

  List<LeaveType> allLeave = List.empty(growable: true);

  dynamic leaveData;

  String url = 'http://mtrackapi.innoyuga.com/api/leave/leave-type/list';
  void _getLeaveList() async {
    http.Response res;

    res = await http.get(Uri.parse(url));
    leaveData = jsonDecode(res.body);
    for (int i = 0; i < leaveData.length; i++) {
      allLeave.add(LeaveType(leaveData[i]["id"], leaveData[i]["name"]));
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
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
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
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Leave Type*",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 17),
                                hintText: "Select Leave",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 136, 136, 136),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 227, 227, 227),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.white,
                                filled: true),
                            isExpanded: false,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 8),
                                      onTap: () async {
                                        var from = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050));
                                        fromDate.text =
                                            from.toString().substring(0, 10);
                                      },
                                      suffixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Colors.black54,
                                        size: 20,
                                      )),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: DropdownButtonFormField<String>(
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 10),
                                          hintText: "Select Half",
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
                                      value: selectedFromHalf,
                                      items: fromHalf
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item,
                                                      style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .w400))))
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 8),
                                      onTap: () async {
                                        var to = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050));
                                        toDate.text =
                                            to.toString().substring(0, 10);
                                      },
                                      suffixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Colors.black54,
                                        size: 20,
                                      )),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: DropdownButtonFormField<String>(
                                      borderRadius: BorderRadius.circular(10),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 10),
                                          hintText: "Select Half",
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
                                      value: selectedToHalf,
                                      items: toHalf
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item,
                                                      style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .w400))))
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
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Reason for Leave*",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Cancel",
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
                              nextPage
                                  ? const CircularProgressIndicator(
                                      color: Color.fromARGB(255, 30, 67, 159),
                                    )
                                  : ElevatedButton(
                                      onPressed: () async {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        var baseUrl =
                                            'http://mtrackapi.innoyuga.com';
                                        final uri = Uri.parse(
                                            "$baseUrl/api/leave/leave-request/add");
                                        final headers = {
                                          'Content-Type': 'application/json',
                                          'Accept': '*/*',
                                        };

                                        Map<String, dynamic> body = {
                                          "id": 4,
                                          "companyId": 1,
                                          "leaveTypeId": selectLeaveId,
                                          "entityId": 1,
                                          "employeeId": 1,
                                          "startDateTime": fromDate.text,
                                          "endDateTime": toDate.text,
                                          "status": "pending",
                                          "reasonForLeave": reason.text,
                                          "totalLeavesToConsider": 1,
                                          "reasonLeaveToConsider": null,
                                          "approvingAuthorityId": null,
                                        };
                                        String jsonBody = json.encode(body);
                                        final encoding =
                                            Encoding.getByName('utf-8');

                                        var response = await http.post(
                                          uri,
                                          headers: headers,
                                          body: jsonBody,
                                          encoding: encoding,
                                        );

                                        int statusCode = response.statusCode;

                                        var responseBody = response.body;
                                        if (statusCode == 200) {
                                          setState(() {
                                            nextPage = true;
                                          });

                                          Get.to(Leaves());
                                        } else if (statusCode != 200) {
                                          setState(() {
                                            nextPage = false;
                                          });
                                          if (response.body.isNotEmpty) {
                                            var errMsg =
                                                json.decode(responseBody);
                                            print(errMsg);
                                            if (errMsg["message"] ==
                                                "Must be greater than 10 words") {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Reason for leave must be greater than 10 words")));
                                            } else if (errMsg["msg"] ==
                                                "Leave Request created successfully") {
                                              setState(() {
                                                nextPage = true;
                                              });
                                              Get.to(Leaves());
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          errMsg["message"]
                                                              .toString())));
                                            }

                                            setState(() {
                                              nextPage == false;
                                            });
                                          }
                                        }
                                        print(responseBody);
                                      },
                                      child: Text(
                                        "Apply",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 30, 67, 159),

                                          //maximumSize: Size(7, 3),
                                          minimumSize: const Size(100, 40),
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
                  ]),
            )));
  }
}

//Leave Details

class LeaveDetails extends StatefulWidget {
  const LeaveDetails({super.key});

  @override
  State<LeaveDetails> createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {
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
            child: Column(
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
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //  height: 600,
                    width: 400,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Leaves Details",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkgrey),
                            ),
                            Text(
                              "Approved",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(168, 0, 126, 65)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "From",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.maincolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "(First Half)",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.maincolor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "07/08/2022",
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "To",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.maincolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "(Second Half)",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.maincolor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "11/08/2022",
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
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 227, 227, 227),
                                    blurRadius: 1,
                                    spreadRadius: 0.5)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "4.0 Days",
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
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 227, 227, 227),
                                    blurRadius: 1,
                                    spreadRadius: 0.5)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "25/07/2022",
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
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 227, 227, 227),
                                    blurRadius: 1,
                                    spreadRadius: 0.5)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "Casual Leave",
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
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 227, 227, 227),
                                    blurRadius: 1,
                                    spreadRadius: 0.5)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "8.0",
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
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 227, 227, 227),
                                    blurRadius: 1,
                                    spreadRadius: 0.5)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                "Vacation",
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
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 227, 227, 227),
                                    blurRadius: 1,
                                    spreadRadius: 0.5)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color: Color.fromARGB(255, 232, 232, 232),
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(8.0))),
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
                            backgroundColor: Color.fromARGB(255, 30, 67, 159),

                            //maximumSize: Size(7, 3),
                            minimumSize: const Size(160, 40),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.transparent, width: 1.5),
                                borderRadius: BorderRadius.circular(8.0))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ])));
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
