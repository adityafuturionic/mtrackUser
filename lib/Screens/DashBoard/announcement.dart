import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtrackuser/Constants/color_constant.dart';
import 'package:mtrackuser/custom_widgets.dart';

class announcement extends StatefulWidget {
  const announcement({Key? key}) : super(key: key);
  @override
  State<announcement> createState() => _announcementState();
}

class _announcementState extends State<announcement> {
  List<String> title = [
    "Salary Update",
    "Holiday on Account of Eid",
    "Open Staff Meeting",
    "Promotion Announcement",
    "Payslip Generated"
  ];
  List<String> titleData = [
    "Salary has been credited for the month of \nMay..",
    "Office will remain close tomorrow on \naccount of Eid",
    "Dear all,A reminder that Open staff \nMeeting is taking place on Thursday",
    "Dear all staff members, I am happy \nto announce that David has been Promted.",
    "Payslip have been Generated for thr \nmonth of December"
  ];
  List<String> titeDate = [
    "May 07,2022",
    "April 25,2022",
    "Jan 28,2022",
    "Jan 03,2022",
    "Jan 05,2022"
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
        child: Column(
          children: [
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  "Annoucement coming soon",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 1000,
              child: ListView.builder(
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,
                      width: 40,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(20, 35, 0, 0)),
                              Text(
                                title[index],
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(100, 35, 0, 0)),
                              InkWell(
                                onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) => buildSheet(),
                                ),
                                child: Text('View More'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(20, 40, 0, 0)),
                              Text(titleData[index])
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 65, 0, 0),
                              ),
                              Icon(Icons.calendar_month_rounded),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(12, 65, 10, 0)),
                              Text(
                                titeDate[index],
                              ),
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
    );
  }

  Widget buildSheet() => Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                ),
                Text(
                  "Promotion Announcement",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 250, 0),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.cancel_outlined),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 65, 0, 0),
                ),
                Icon(Icons.calendar_month_rounded),
                Padding(padding: EdgeInsets.fromLTRB(12, 65, 10, 0)),
                Text("Jan 26,2022"),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                ),
                Expanded(
                    child: Text(
                  'Dear all Staff members, I am happy to announce that David has been promated to the position of Sr. Node Js Developer. David has been working for 6 years, and played a vital role. During all these time, he has always been dedicated to and dispalyed a great team spirit, which we are happy to reward them with this promotion.',
                  softWrap: true,
                  maxLines: 9,
                ))
              ],
            )
          ],
        ),
      );
}
