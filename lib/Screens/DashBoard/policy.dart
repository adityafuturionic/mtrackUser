import 'dart:convert';
import 'package:flutter/material.dart';

List dataList = [
  {
    "name": "LEAVE POLICY",
    "data": "How do leave policy works?",
    "data1":
        "\nLorem ipsum dolor sit amet consectetur adipisicing elit. Debitis, inventore.",
    "icon": Icons.arrow_drop_down,
  },
  {
    "name": "OVERTIME POLICY",
    "data": "How do overtime policy works?",
    "data1":
        "\nLorem ipsum dolor sit amet consectetur adipisicing elit. Debitis, inventore.",
    "icon": Icons.arrow_drop_down,
  },
  {
    "name": "PAYROLL POLICY",
    "data": "How do payroll policy works?",
    "data1":
        "\nLorem ipsum dolor sit amet consectetur adipisicing elit. Debitis, inventore.",
    "icon": Icons.arrow_drop_down,
  },
  {
    "name": "WEEKLY OFF POLICY",
    "data": "How do weekly off policy works?",
    "data1":
        "\nLorem ipsum dolor sit amet consectetur adipisicing elit. Debitis, inventore.",
    "icon": Icons.arrow_drop_down,
  },
];

class Menu {
  late String name;
  late String data;
  late String data1;
  late final IconData icon;

  Menu(
      {required this.name,
      required this.data,
      required this.data1,
      required this.icon});
  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    data = json['data'];
    data1 = json['data1'];
    icon = json['icon'];
  }
}

class policy extends StatefulWidget {
  @override
  State<policy> createState() => _policyState();
}

class _policyState extends State<policy> {
  List color = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
  List<Menu> data = [];

  @override
  void initState() {
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('mTrack'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildList(data[index], index),
        ),
      ),
    );
  }

  Widget _buildList(Menu list, index) {
    final Color background = color[index];
    final Color fill = Colors.white12;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 97.00;
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    if (list.data.isEmpty)
      return ListView(
        children: [],
      );
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.5, color: Color.fromARGB(255, 242, 240, 240)),
        gradient: LinearGradient(
          colors: gradient,
          stops: stops,
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(11),
        trailing: Icon(list.icon),
        title: Text(list.name),
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            title: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: (list.data),
                ),
                TextSpan(text: (list.data1))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
