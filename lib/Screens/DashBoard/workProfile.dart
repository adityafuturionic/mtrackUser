import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';

class WorkProfile extends StatefulWidget {
  const WorkProfile({super.key});

  @override
  State<WorkProfile> createState() => _WorkProfileState();
}

class _WorkProfileState extends State<WorkProfile> {
  List<String> svg = [
    "assets/WorkProfilePNG/One.png",
    "assets/WorkProfilePNG/Two.png",
    "assets/WorkProfilePNG/Three.png",
    "assets/WorkProfilePNG/Four.png",
    "assets/WorkProfilePNG/Five.png",
    "assets/WorkProfilePNG/Six.png",
    "assets/WorkProfilePNG/Seven.png",
    "assets/WorkProfilePNG/Eigth.png",
  ];
  List<String> gridHeader = [
    "Company Name:",
    "Field Officer:",
    "Phone Number:",
    "Client Name:",
    "Location:",
    "City:",
    "Address:",
    "Pincode:"
  ];
  List<String> gridSubHeader = [
    "GenTech",
    "Rohit Sharma",
    "9876543210",
    "Grofers",
    "M.G.Road",
    "Gurgaon",
    "656,sec 56",
    "122001"
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
          child: Column(
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
                      "Work Profile",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: 104,
                        height: 104,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.5,
                              color: Color.fromARGB(255, 30, 67, 159)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       spreadRadius: 2,
                          //       blurRadius: 20,
                          //       color: Colors.black.withOpacity(0.1),
                          //       offset: Offset(0, 10))
                          // ],
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
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Accountant",
                  style: TextStyle(
                      color: AppColors.maincolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Employee ID: 785662",
                  style: TextStyle(
                      color: Color.fromARGB(255, 136, 136, 136),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 7 / 3.8,
                          crossAxisCount: 2,
                          crossAxisSpacing: 26,
                          mainAxisSpacing: 18),
                      itemCount: 8,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 224, 224, 224),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                svg[index],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                gridHeader[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.darkgrey,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                gridSubHeader[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.darkgrey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ])),
    );
  }
}
