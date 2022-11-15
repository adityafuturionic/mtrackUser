import 'package:flutter/material.dart';
import 'package:mtrackuser/Screens/DashBoard/annoucements.dart';
import 'package:mtrackuser/Screens/DashBoard/attendance.dart';
import 'package:mtrackuser/Screens/DashBoard/companyPolicies.dart';
import 'package:mtrackuser/Screens/DashBoard/companyProfile.dart';
import 'package:mtrackuser/Screens/DashBoard/dashboard_screen.dart';
import 'package:mtrackuser/Screens/DashBoard/holiday_list.dart';
import 'package:mtrackuser/Screens/DashBoard/leave.dart';
import 'package:mtrackuser/Screens/DashBoard/myprofile.dart';
import 'package:mtrackuser/Screens/DashBoard/payroll.dart';
import 'package:mtrackuser/Screens/DashBoard/workProfile.dart';
import 'package:mtrackuser/Screens/login/forgot_password_screen.dart';
import 'package:mtrackuser/Screens/login/login_screen.dart';
import 'package:mtrackuser/Screens/login/update_password_screen.dart';
import 'package:mtrackuser/Screens/login/verify_otp_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/ForgotPassword':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case '/VerifyOTP':
        return MaterialPageRoute(builder: (_) => const VerifyOTP());
      case '/UpdatePassword':
        return MaterialPageRoute(builder: (_) => const UpdatePassword());
      case '/DashboardScreen':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/MyProfile':
        return MaterialPageRoute(builder: (_) => const MyProfile());
      case '/Attendance':
        return MaterialPageRoute(builder: (_) => const Attendance());
      case '/CompanyProfile':
        return MaterialPageRoute(builder: (_) => const CompanyProfile());
      case '/Payroll':
        return MaterialPageRoute(builder: (_) => const Payroll());
      case '/HolidayList':
        return MaterialPageRoute(builder: (_) => const HolidayList());
      case '/Leaves':
        return MaterialPageRoute(builder: (_) => const Leaves());
      case '/ApplyLeaves':
        return MaterialPageRoute(builder: (_) => const ApplyLeaves());
      case '/LeaveDetails':
        return MaterialPageRoute(builder: (_) => const LeaveDetails());
      case '/EditLeaveRequest':
        return MaterialPageRoute(builder: (_) => const EditLeaveRequest());
      case '/CompanyPolicies':
        return MaterialPageRoute(builder: (_) => const CompanyPolicies());
      case '/Annoucements':
        return MaterialPageRoute(builder: (_) => const Annoucements());
      case '/WorkProfile':
        return MaterialPageRoute(builder: (_) => const WorkProfile());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
