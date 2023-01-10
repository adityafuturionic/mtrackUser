// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/Constants/text_constant.dart';
import 'package:mtrackuser/Models/announcementsModels.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:http/http.dart' as http;

class Annoucements extends StatefulWidget {
  const Annoucements({super.key});

  @override
  State<Annoucements> createState() => _AnnoucementsState();
}

class _AnnoucementsState extends State<Annoucements> {
  AnnouncementsModel _announcementsModel = AnnouncementsModel();
  @override
  void initState() {
    _getAnnouncementsDetails();
    // Future.delayed(const Duration(seconds: 5), () {
    //   setState(() {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         backgroundColor: AppColors.maincolor,
    //         content: Text(
    //           "It may take some time.",
    //           style: TextStyle(color: Colors.white, fontSize: 18),
    //         )));
    //   });
    //   _getAnnouncementsDetails();
    // });
    super.initState();
  }

  @override
  void dispose() {
    _getAnnouncementsDetails();

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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: list.isEmpty
                  ? Align(
                      heightFactor: 6,
                      alignment: Alignment.center,
                      child: Lottie.asset("assets/loading.json", height: 100))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                "Announcements",
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
                              // height: 0.6.sw,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 20,
                                      ),
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: list[0].count!,
                                  shrinkWrap: true,
                                  itemBuilder: ((BuildContext context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      height: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 233, 233, 233),
                                              width: 2)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  list[0]
                                                      .rows![index]
                                                      .subject
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 0.4,
                                                      color: Color.fromARGB(
                                                          255, 47, 90, 197)),
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder:
                                                                (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        state) {
                                                          return Container(
                                                              height: 320,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          27,
                                                                      vertical:
                                                                          10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          230,
                                                                          230,
                                                                          230),
                                                                      width:
                                                                          2)),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Flexible(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                270,
                                                                            child:
                                                                                Text(
                                                                              list[0].rows![index].subject.toString(),
                                                                              // maxLines:
                                                                              //       2,
                                                                              style: TextStyle(color: Colors.black87, fontSize: 18, letterSpacing: 0.4, fontWeight: FontWeight.w600),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            icon:
                                                                                Icon(
                                                                              Icons.close,
                                                                              size: 20,
                                                                            ))
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .calendar_month,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              6,
                                                                        ),
                                                                        Text(
                                                                          " ${DateFormat.yMMMd().format(DateTime.parse(list[0].rows![index].publishDate.toString()))}",
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors.grey,
                                                                              fontWeight: FontWeight.w500),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Divider(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          228,
                                                                          227,
                                                                          227),
                                                                      thickness:
                                                                          2,
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Text(
                                                                      list[0]
                                                                          .rows![
                                                                              index]
                                                                          .description
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              155,
                                                                              155,
                                                                              155),
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          letterSpacing:
                                                                              0.4),
                                                                    ),
                                                                  ]));
                                                        });
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    "View More",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color.fromARGB(
                                                          255, 39, 94, 233),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1.5,
                                            color: Color.fromARGB(
                                                255, 224, 224, 224),
                                            height: 0,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            list[0]
                                                .rows![index]
                                                .description
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 165, 165, 165),
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                " ${DateFormat.yMMMd().format(DateTime.parse(list[0].rows![index].publishDate.toString()))}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }))),
                          SizedBox(
                            height: 20,
                          )
                        ])),
        ));
  }

  List<AnnouncementsModel> list = [];
  dynamic announcementsData;
  Future<List<AnnouncementsModel>> _getAnnouncementsDetails() async {
    try {
      String url =
          '${TextConstant.baseURL}/api/announcement/location?locationId=5';
      http.Response res;
      res = await http.get(Uri.parse(url));
      announcementsData = jsonDecode(res.body);

      for (int i = 0; i < announcementsData.length; i++) {
        list.add(AnnouncementsModel.fromJson(announcementsData));
      }
      setState(() {});
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nLoading Again...",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Annoucements(),
      ));
    }
    return list;
  }
}
