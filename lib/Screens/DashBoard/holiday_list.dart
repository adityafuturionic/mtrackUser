// ignore_for_file: prefer_const_constructors

// import 'dart:collection';
import 'dart:convert';
// import 'dart:html';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:mtrackuser/ClassData/holiday_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class HolidayList extends StatefulWidget {
  const HolidayList({super.key});

  @override
  State<HolidayList> createState() => _HolidayListState();
}

class _HolidayListState extends State<HolidayList> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay, focusedDay = DateTime.now();
  dynamic holidayData;
  List<Holiday> allData = List.empty(growable: true);
  List<Holiday> monthHolidays = List.empty(growable: true);
  var employeeId;
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        focusedDay = focusedDay;
        _selectedDay = selectedDay;
        // _selectedEvents = _getEventsForDay(selectedDay);
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var value = prefs.getInt('UserId');
      setState(() {
        employeeId = value;
      });

      allData = await _getHolidays();
      setState(() {});
      showHolidayList(DateTime.now());
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);

// final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
//     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
//     value: (item) => List.generate(
//         item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
//   ..addAll({
//     kToday: [
//       Event('Today\'s Event 1'),
//       Event('Today\'s Event 2'),
//     ],
//   });

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
            child: holidayData == null
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
                              "Holidays",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
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

                          // calendarBuilders: CalendarBuilders(
                          //   markerBuilder: (context, day, events) => Center(
                          //     child: Text(
                          //       day.day.toString(),
                          //       style: TextStyle(color: Colors.red),
                          //     ),
                          //   ),
                          // ),

                          calendarStyle: CalendarStyle(
                              markerDecoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(color: Colors.transparent),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10)),
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
                                  border: Border.all(color: Colors.transparent),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10)),
                              weekendTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              weekendDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                  color: Color.fromARGB(255, 244, 199, 87),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10)),
                              selectedTextStyle: TextStyle(color: Colors.black),
                              selectedDecoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10))),
                          eventLoader: (day) {
                            if (day.weekday == DateTime.tuesday) {
                              return ['asd'];
                            }

                            return [];
                          },

                          onDaySelected: ((selectedDay, changedDate) {
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
                            monthHolidays = showHolidayList(changedDate);
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          thickness: 1.3,
                          height: 30,
                          color: Colors.grey[350],
                        ),
                        if (monthHolidays.isEmpty) ...[
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 224, 223, 223),
                                          width: 2)),
                                  child: Image.asset("assets/calendar.png"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'No Holidays This Month',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 150, 150, 150),
                                      letterSpacing: 0.7,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (monthHolidays.isNotEmpty) ...[
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                                itemCount: monthHolidays.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 60,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 235, 234, 234),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.calendar_month,
                                              color: AppColors.maincolor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                monthHolidays[index].name,
                                                style: TextStyle(
                                                    color: AppColors.maincolor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                DateFormat.EEEE().format(
                                                    DateTime.parse(
                                                        monthHolidays[index]
                                                            .date)),
                                                style: TextStyle(
                                                    color: AppColors.darkgrey,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          // const SizedBox(width: 80),
                                          Expanded(
                                            child: Text(
                                              DateFormat.yMMMMd().format(
                                                  DateTime.parse(
                                                      monthHolidays[index]
                                                          .date)),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 116, 116, 116),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ])));
  }

  // Get Document information by API
  Future<List<Holiday>> _getHolidays() async {
    String url =
        'http://mtrackapi.innoyuga.com/api/holiday/list?companyId=1&locationId=4';
    http.Response res;
    List<Holiday> list = [];
    res = await http.get(Uri.parse(url));
    holidayData = jsonDecode(res.body);
    for (int i = 0; i < holidayData["holidays"].length; i++) {
      list.add(Holiday(
          holidayData["holidays"][i]["id"],
          holidayData["holidays"][i]["date"],
          holidayData["holidays"][i]["name"]));
    }
    return list;
  }

  List<Holiday> showHolidayList(DateTime focusedDay) {
    monthHolidays.clear();
    int i;
    for (i = 0; i < allData.length; i++) {
      //print(holidayData["holidays"][i]["date"]);
      String date = allData[i].date;
      DateTime parseDate = DateTime.parse(date);
      // DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
      // var inputDate = DateTime.parse(parseDate.toString());
      // var outputFormat = DateFormat('MM');

      // var outputMonth = int.parse(outputFormat.format(inputDate));
      // print(outputMonth);
      if (parseDate.month == focusedDay.month) {
        monthHolidays.add(allData[i]);
      }
    }

    // setState(() {});

    return monthHolidays;
  }
}
