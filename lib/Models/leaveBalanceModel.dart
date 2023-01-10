class LeaveBalanceModel {
  CasualLeave? casualLeave;
  String? casualKey;
  CasualLeave? sickLeave;
  String? sickKey;
  LeaveBalanceModel(
      {this.casualLeave, this.sickLeave, this.casualKey, this.sickKey});

  factory LeaveBalanceModel.fromJson(Map<String, dynamic> json) {
    String? cK;
    dynamic cl;
    String? sK;
    dynamic sl;
    json.forEach((k, v) {
      if (k == 'Casual Leave') {
        cK = k;
        cl = v;
      } else {
        sK = k;
        sl = v;
      }
    });
    return LeaveBalanceModel(
        casualLeave: cK != null ? CasualLeave.fromJson(cl) : null,
        sickLeave: sK != null ? CasualLeave.fromJson(sl) : null,
        casualKey: "",
        sickKey: "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.casualLeave != null) {
      data['Casual Leave'] = this.casualLeave!.toJson();
    }
    if (this.sickLeave != null) {
      data['Sick Leave'] = this.sickLeave!.toJson();
    }
    return data;
  }
}

class CasualLeave {
  int? leavesAccruedThisMonth;
  int? leavesTakenThisMonth;
  int? leavesMonthOpeningBalance;

  CasualLeave(
      {this.leavesAccruedThisMonth,
      this.leavesTakenThisMonth,
      this.leavesMonthOpeningBalance});

  CasualLeave.fromJson(Map<String, dynamic> json) {
    leavesAccruedThisMonth = json['leavesAccruedThisMonth'];
    leavesTakenThisMonth = json['leavesTakenThisMonth'];
    leavesMonthOpeningBalance = json['leavesMonthOpeningBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leavesAccruedThisMonth'] = this.leavesAccruedThisMonth;
    data['leavesTakenThisMonth'] = this.leavesTakenThisMonth;
    data['leavesMonthOpeningBalance'] = this.leavesMonthOpeningBalance;
    return data;
  }
}
