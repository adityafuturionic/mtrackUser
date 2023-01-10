// ignore_for_file: prefer_const_constructors, file_names, avoid_unnecessary_containers, prefer_const_declarations, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/Constants/text_constant.dart';
import 'package:mtrackuser/Models/policyModel.dart';
import 'package:mtrackuser/custom_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class CompanyPolicies extends StatefulWidget {
  const CompanyPolicies({super.key});

  @override
  State<CompanyPolicies> createState() => _CompanyPoliciesState();
}

class _CompanyPoliciesState extends State<CompanyPolicies> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getPolicyList());
    // Future.delayed(const Duration(seconds: 4), () {
    //   setState(() {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         backgroundColor: AppColors.maincolor,
    //         content: Text(
    //           "It may take some time.",
    //           style: TextStyle(color: Colors.white, fontSize: 18),
    //         )));
    //   });
    //   _getPolicyList();
    // });
  }

  @override
  void dispose() {
    _getPolicyList();
    // TODO: implement dispose
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
          child: responseBody == null
              ? Align(
                  heightFactor: 6,
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/loading.json", height: 100))
              : Column(
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
                          "Company Policies",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _policyModel.totalCount,
                          itemBuilder: (BuildContext context, int index) {
                            final Color background = Color(
                                    (math.Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                .withOpacity(1.0);
                            final Color fill = Colors.white;
                            final List<Color> gradient = [
                              background,
                              background,
                              fill,
                              fill,
                            ];
                            final double fillPercent = 97.00;
                            final double fillStop = (100 - fillPercent) / 100;
                            final List<double> stops = [
                              0.0,
                              fillStop,
                              fillStop,
                              1.0
                            ];
                            return Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 242, 240, 240)),
                                gradient: LinearGradient(
                                  colors: gradient,
                                  stops: stops,
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ExpansionTile(
                                tilePadding:
                                    EdgeInsets.symmetric(horizontal: 25),
                                childrenPadding: EdgeInsets.only(bottom: 10),
                                iconColor: AppColors.maincolor,
                                collapsedIconColor: AppColors.maincolor,
                                title: Text(
                                  "${_policyModel.policy?[index].name}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: AppColors.maincolor,
                                      fontWeight: FontWeight.w500),
                                ),
                                children: [
                                  ListTile(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 30),
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
                                          Text(
                                            "${_policyModel.policy?[index].description}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.2,
                                                wordSpacing: 0.2),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
        ),
      ),
    );
  }

  var responseBody;
  PolicyModel _policyModel = PolicyModel();
  Future<void> _getPolicyList() async {
    try {
      var url = Uri.parse('${TextConstant.baseURL}/api/policy/company-policy');

      http.Response res = await http.get(url);
      setState(() {
        responseBody = res.body;
      });
      if (res.statusCode == 200) {
        setState(() {
          _policyModel = policyFromMap(responseBody);
        });
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.maincolor,
          content: Text(
            "${e.toString()} \nLoading Again...",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const CompanyPolicies(),
      ));
    }
    return;
  }
}
