import 'dart:convert';
import 'dart:math';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:date_format/date_format.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/ClassData/attendance_data.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:mtrackuser/ClassData/holiday_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay, focusedDay = DateTime.now();
  dynamic attendanceData;
  DateTime? SelectedDay;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int radioValue = -1;
  var employeeId;
  double boxHeight = 60;
  double bottomSheetHeight = 350;
  bool show = false;
  TimeOfDay _inTime = TimeOfDay.now();
  TimeOfDay _outTime = TimeOfDay.now();
  String inTime = "In Time";
  String outTime = "Out Time";
  void inTimeChanged(TimeOfDay newTime) {
    setState(() {
      _inTime = newTime;
    });
  }

  void outTimeChanged(TimeOfDay newTime) {
    setState(() {
      _outTime = newTime;
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        focusedDay = focusedDay;
        _selectedDay = selectedDay;
        // _selectedEvents = _getEventsForDay(selectedDay);
      });
    }
  }

  void _expandBox() {
    setState(() {
      boxHeight = 120;
      bottomSheetHeight = 420;
    });
  }

  void _normalBox() {
    setState(() {
      boxHeight = 60;
      bottomSheetHeight = 350;
    });
  }

  @override
  void initState() {
    _getAttendance();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var value = prefs.getInt('UserId');
      setState(() {
        employeeId = value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool nextPage = false;
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
            child: attendanceData == null
                ? Align(
                    heightFactor: 6,
                    alignment: Alignment.center,
                    child: Lottie.asset("assets/loading.json", height: 100))
                : Form(
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
                                "Attendance",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      "Present",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 78, 200, 82),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 60,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        Present.toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 190, 190, 190),
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),

                              //Absent
                              Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      "Absent",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 200, 78, 78),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 60,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        Absent.toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 190, 190, 190),
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),

                              //Half Day
                              Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      "Half Day",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 235, 215, 33),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 60,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        HalfDay.toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 190, 190, 190),
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),

                              //Leaves
                              Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      "Leaves",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 78, 129, 200),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 60,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "01",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 190, 190, 190),
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),

                              //Day Off
                              Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    child: Text(
                                      "Day Off",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 97, 89, 89),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5))),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 60,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 190, 190, 190),
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          TableCalendar(
                            rowHeight: 45,
                            focusedDay: focusedDay!,
                            firstDay: DateTime(2022),
                            lastDay: DateTime(2024),
                            calendarFormat: _calendarFormat,
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            headerStyle: HeaderStyle(
                                headerPadding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                formatButtonVisible: false,
                                titleCentered: true,
                                leftChevronIcon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.maincolor,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.maincolor,
                                ),
                                titleTextStyle: TextStyle(
                                    color: AppColors.maincolor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            daysOfWeekStyle: DaysOfWeekStyle(
                                weekendStyle:
                                    TextStyle(fontWeight: FontWeight.w500),
                                weekdayStyle:
                                    TextStyle(fontWeight: FontWeight.w500)),
                            calendarBuilders: CalendarBuilders(
                              defaultBuilder: (
                                context,
                                day,
                                focusedDay,
                              ) {
                                for (AttendanceData d in list) {
                                  if (day.day == d.date.day &&
                                      day.month == d.date.month &&
                                      day.year == d.date.year) {
                                    return Container(
                                      height: 33,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: d.Pstatus("P")
                                              ? Color.fromARGB(255, 78, 200, 82)
                                              : d.Astatus("A")
                                                  ? Color.fromARGB(
                                                      255, 200, 78, 78)
                                                  : d.HDtatus("HD")
                                                      ? Color.fromARGB(
                                                          255, 235, 215, 33)
                                                      : d.Lstatus("HL UL PL")
                                                          ? Color.fromARGB(
                                                              255, 78, 129, 200)
                                                          : d.DOstatus("DO")
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  97,
                                                                  89,
                                                                  89)
                                                              : Colors
                                                                  .transparent,
                                          border: Border.all(
                                              color: Colors.transparent),
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          '${day.day}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return null;
                              },
                            ),
                            calendarStyle: CalendarStyle(
                                outsideDaysVisible: false,
                                defaultTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                defaultDecoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                todayDecoration: BoxDecoration(
                                    color: Colors.purple,
                                    border:
                                        Border.all(color: Colors.transparent),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5)),
                                weekendTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                weekendDecoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent),
                                    color: Color.fromARGB(255, 126, 124, 118),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5)),
                                selectedTextStyle:
                                    TextStyle(color: Colors.black),
                                selectedDecoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10))),
                            onDaySelected: ((selectedDay, changedDate) {
                              setState(() {
                                changedDate = selectedDay;
                                SelectedDay = selectedDay;
                              });

                              for (AttendanceData d in list) {
                                if (selectedDay.day == d.date.day &&
                                    selectedDay.month == d.date.month &&
                                    selectedDay.year == d.date.year) {
                                  if (d.Astatus("A")) {
                                    showModalBottomSheet<void>(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter state) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              height: bottomSheetHeight,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255, 226, 226, 226)),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10))),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        DateFormat.yMMMd().format(
                                                            DateTime.parse(d
                                                                .date
                                                                .toString())),
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Icon(
                                                              Icons.close)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 2,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      216,
                                                                      216,
                                                                      216)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: RadioListTile(
                                                          activeColor:
                                                              Colors.black,
                                                          title: Row(
                                                            children: [
                                                              Icon(
                                                                Icons.more_time,
                                                                size: 30,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Text(
                                                                "Mark as Present",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        17),
                                                              )
                                                            ],
                                                          ),
                                                          value: 0,
                                                          groupValue:
                                                              radioValue,
                                                          onChanged: (val) {
                                                            state(() {
                                                              radioValue = val!;
                                                              _normalBox();
                                                              show = false;
                                                            });

                                                            print(radioValue);
                                                          })),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  AnimatedContainer(
                                                      padding: EdgeInsets.only(
                                                          bottom: 6),
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      height: boxHeight,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 2,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      216,
                                                                      216,
                                                                      216)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: RadioListTile(
                                                          activeColor:
                                                              Colors.black,
                                                          title: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time_filled,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 30,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Text(
                                                                    "Mark Exact Time",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            17),
                                                                  )
                                                                ],
                                                              ),
                                                              show == true
                                                                  ? StatefulBuilder(builder: (BuildContext
                                                                          context,
                                                                      StateSetter
                                                                          state) {
                                                                      return Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(fixedSize: Size(120, 0), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.black, width: 1), backgroundColor: Colors.white),
                                                                              onPressed: () {
                                                                                Navigator.of(context).push(
                                                                                  showPicker(
                                                                                    context: context,
                                                                                    value: _inTime,
                                                                                    onChange: inTimeChanged,
                                                                                    minuteInterval: MinuteInterval.ONE,
                                                                                    // Optional onChange to receive value as DateTime
                                                                                    onChangeDateTime: (DateTime dateTime) {
                                                                                      // print(dateTime);

                                                                                      state(() {
                                                                                        inTime = DateFormat.jm().format(dateTime);
                                                                                      });
                                                                                      print(_inTime);
                                                                                      debugPrint("[debug datetime]:  ${DateFormat.jm().format(dateTime)}");
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    inTime,
                                                                                    style: TextStyle(color: Colors.black),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.timer_rounded,
                                                                                    color: Colors.black,
                                                                                  )
                                                                                ],
                                                                              )),
                                                                          ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(fixedSize: Size(120, 0), elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.black, width: 1), backgroundColor: Colors.white),
                                                                              onPressed: () {
                                                                                Navigator.of(context).push(
                                                                                  showPicker(
                                                                                    context: context,
                                                                                    value: _outTime,
                                                                                    onChange: outTimeChanged,
                                                                                    minuteInterval: MinuteInterval.ONE,
                                                                                    // Optional onChange to receive value as DateTime
                                                                                    onChangeDateTime: (DateTime dateTime) {
                                                                                      // print(dateTime);
                                                                                      state(() {
                                                                                        outTime = DateFormat.jm().format(dateTime);
                                                                                      });
                                                                                      debugPrint("[debug datetime]:  ${DateFormat.jm().format(dateTime)} ");
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    outTime,
                                                                                    style: TextStyle(color: Colors.black),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.timer_rounded,
                                                                                    color: Colors.black,
                                                                                  )
                                                                                ],
                                                                              ))
                                                                        ],
                                                                      );
                                                                    })
                                                                  : Container(),
                                                            ],
                                                          ),
                                                          value: 1,
                                                          groupValue:
                                                              radioValue,
                                                          onChanged: (val) {
                                                            state(() {
                                                              radioValue = val!;
                                                              _expandBox();
                                                              show = true;
                                                            });

                                                            print(radioValue);
                                                          })),
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      123,
                                                                      123,
                                                                      123),
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,

                                                                //maximumSize: Size(7, 3),
                                                                minimumSize:
                                                                    const Size(
                                                                        100,
                                                                        40),
                                                                elevation: 0,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            232,
                                                                            232,
                                                                            232),
                                                                        width:
                                                                            1.5),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0))),
                                                      ),
                                                      nextPage
                                                          ? const CircularProgressIndicator(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      30,
                                                                      67,
                                                                      159),
                                                            )
                                                          : ElevatedButton(
                                                              onPressed: () {
                                                                _validateInputs();
                                                              },
                                                              child: Text(
                                                                "Apply",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Color.fromARGB(
                                                                              255,
                                                                              30,
                                                                              67,
                                                                              159),

                                                                      //maximumSize: Size(7, 3),
                                                                      minimumSize:
                                                                          const Size(
                                                                              100,
                                                                              40),
                                                                      elevation:
                                                                          0,
                                                                      shape: RoundedRectangleBorder(
                                                                          side: BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.5),
                                                                          borderRadius: BorderRadius.circular(8.0))),
                                                            )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        });
                                  }
                                }
                              }
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  focusedDay = changedDate;
                                });
                              }
                            }),
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onPageChanged: (changedDate) {
                              print("World");
                              focusedDay = changedDate;
                              // monthHolidays = showHolidayList(changedDate);
                              setState(() {});
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 1.3,
                            height: 10,
                            color: Colors.grey[350],
                          ),

                          // if (monthHolidays.isNotEmpty) ...[
                          //   SizedBox(
                          //     height: 400,
                          //     child: ListView.builder(
                          //         itemCount: monthHolidays.length,
                          //         itemBuilder: (BuildContext context, index) {
                          //           return Padding(
                          //             padding: const EdgeInsets.all(10.0),
                          //             child: Container(
                          //               height: 60,
                          //               padding: EdgeInsets.symmetric(
                          //                   vertical: 10, horizontal: 10),
                          //               decoration: BoxDecoration(
                          //                   border: Border.all(
                          //                       color: Color.fromARGB(
                          //                           255, 235, 234, 234),
                          //                       width: 2),
                          //                   borderRadius:
                          //                       BorderRadius.circular(10)),
                          //               child: Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.start,
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   Align(
                          //                     alignment: Alignment.center,
                          //                     child: Icon(
                          //                       Icons.calendar_month,
                          //                       color: AppColors.maincolor,
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 12,
                          //                   ),
                          //                   Column(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.start,
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     children: [
                          //                       Text(
                          //                         monthHolidays[index].status,
                          //                         style: TextStyle(
                          //                             color: AppColors.maincolor,
                          //                             fontWeight:
                          //                                 FontWeight.w500),
                          //                       ),
                          //                       SizedBox(
                          //                         height: 4,
                          //                       ),
                          //                       Text(
                          //                         "ss",
                          //                         style: TextStyle(
                          //                             color: AppColors.darkgrey,
                          //                             fontWeight:
                          //                                 FontWeight.w400),
                          //                       )
                          //                     ],
                          //                   ),
                          //                   // const SizedBox(width: 80),
                          //                   Expanded(
                          //                     child: Text(
                          //                       "aa",
                          //                       textAlign: TextAlign.right,
                          //                       style: TextStyle(
                          //                           color: Color.fromARGB(
                          //                               255, 116, 116, 116),
                          //                           fontSize: 13,
                          //                           fontWeight: FontWeight.w500),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           );
                          //         }),
                          //   ),
                          // ],
                        ]),
                  )));
  }

  // Get Document information by API
  List<AttendanceData> list = [];
  var Present, Absent, HalfDay, Leaves, DayOff;
  Future<List<AttendanceData>> _getAttendance() async {
    String url =
        'http://mtrackapi.innoyuga.com/api/attendance/attendanceReport/month?employeeId=119&month=11&year=2022';
    http.Response res;

    res = await http.get(Uri.parse(url));
    attendanceData = jsonDecode(res.body);

    for (int i = 0; i < attendanceData.length; i++) {
      list.add(AttendanceData.fromJson(attendanceData[i]));
    }
    setState(() {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = await prefs.getInt('UserId');
    setState(() {
      employeeId = value;
    });
    for (AttendanceData d in list) {
      setState(() {
        Present = d.status;
        Absent = d.Astatus("A").toString().length;
        HalfDay = d.HDtatus("HD").toString().length;
        Leaves = d.Lstatus("HL PL UL").toString().length;
        DayOff = d.DOstatus("DO").toString().length;
      });
    }

    return list;
  }

  void markPresent() async {
    var baseUrl = 'http://mtrackapi.innoyuga.com';
    final uri =
        Uri.parse("$baseUrl/api/attendance/attendanceRegularisation/add");
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };

    Map<String, dynamic> body = {
      "date": SelectedDay.toString(),
      "requestedOverTime": "00:00:00.000",
      "requestedInTime": radioValue == 0 ? ":10:00 AM" : inTime,
      "requestedOutTime": radioValue == 0 ? "07:00 PM" : outTime,
      "reason": "forget",
      "employeeId": employeeId
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

    var responseBody = response.body;
    if (statusCode == 200) {
      setState(() {
        nextPage = true;
      });
      Get.to(Attendance());
    } else if (statusCode != 200) {
      setState(() {
        nextPage = false;
      });
      if (response.body.isNotEmpty) {
        var errMsg = json.decode(responseBody);
        print(errMsg);

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errMsg["message"].toString())));

        setState(() {
          nextPage == false;
        });
      }
    }
    print(responseBody);
  }

  void _validateInputs() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      if (radioValue < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              margin: EdgeInsets.only(bottom: 300),
              content: Text(
                "Select Any One",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              )),
        );
      } else if (radioValue >= 0) {
        markPresent();
      }
    }
  }
}
