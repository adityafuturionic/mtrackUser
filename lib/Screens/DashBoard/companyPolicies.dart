import 'package:flutter/material.dart';

class CompanyPolicies extends StatefulWidget {
  const CompanyPolicies({super.key});

  @override
  State<CompanyPolicies> createState() => _CompanyPoliciesState();
}

class _CompanyPoliciesState extends State<CompanyPolicies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Company Policies"),
      ),
    );
  }
}
