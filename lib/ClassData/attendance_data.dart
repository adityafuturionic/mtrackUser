import 'dart:ffi';

class AttendanceData {
  DateTime date;
  String status;
  var overTime;
  int employeeId;

  AttendanceData(
    this.date,
    this.status,
    this.overTime,
    this.employeeId,
  );

  @override
  String toString() {
    return '{${this.date},${this.status},${this.overTime},${this.employeeId}}';
  }

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      DateTime.parse(json['date']),
      json['status'],
      json['overTime'],
      json['employeeId'],
    );
  }

  bool Pstatus(String) {
    if (status == "P") {
      return true;
    } else {
      return false;
    }
  }

  bool Astatus(String) {
    if (status == "A") {
      return true;
    } else {
      return false;
    }
  }

  bool HDtatus(String) {
    if (status == "HD") {
      return true;
    } else {
      return false;
    }
  }

  bool Lstatus(String) {
    if (status == "HL" || status == "PL" || status == "UL") {
      return true;
    } else {
      return false;
    }
  }

  bool DOstatus(String) {
    if (status == "DO") {
      return true;
    } else {
      return false;
    }
  }
}
