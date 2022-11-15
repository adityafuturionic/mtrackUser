import 'package:flutter/material.dart';

class Annoucements extends StatefulWidget {
  const Annoucements({super.key});

  @override
  State<Annoucements> createState() => _AnnoucementsState();
}

class _AnnoucementsState extends State<Annoucements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Annoucements"),
      ),
    );
  }
}
