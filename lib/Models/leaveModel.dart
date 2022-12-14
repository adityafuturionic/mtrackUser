// ignore_for_file: unnecessary_this, file_names

class LeaveType {
  int id;
  String name;

  LeaveType(this.id, this.name);

  @override
  String toString() {
    return '{${this.id},${this.name}}';
  }
}

class LeaveDetailsData {
  int id;
  String status;
  int totalLeavesToConsider;
  String reasonForLeave;
  int employeeId;
  int leaveTypeId;
  String startDateTime;
  String endDateTime;
  String name;
  int leaveRemaining;
  String createdAt;

  LeaveDetailsData(
      this.id,
      this.status,
      this.totalLeavesToConsider,
      this.reasonForLeave,
      this.employeeId,
      this.leaveTypeId,
      this.startDateTime,
      this.endDateTime,
      this.name,
      this.leaveRemaining,
      this.createdAt);

  @override
  String toString() {
    return '{${this.id},${this.status},${this.totalLeavesToConsider},${this.reasonForLeave},${this.employeeId},${this.leaveTypeId},${this.startDateTime},${this.endDateTime},${this.name},${this.leaveRemaining},${this.createdAt}}';
  }
}

class AppliedLeaveData {
  int id;
  String status;
  String reasonForLeave;
  int employeeId;
  int leaveTypeId;
  String startDateTime;
  String endDateTime;
  String name;
  String createdAt;

  AppliedLeaveData(
      this.id,
      this.status,
      this.reasonForLeave,
      this.employeeId,
      this.leaveTypeId,
      this.startDateTime,
      this.endDateTime,
      this.name,
      this.createdAt);

  @override
  String toString() {
    return '{${this.id},${this.status},${this.reasonForLeave},${this.employeeId},${this.leaveTypeId},${this.startDateTime},${this.endDateTime},${this.name},${this.createdAt}}';
  }
}

//Leave Balance
class LeaveBalance {
  int leavesAccruedThisMonth;

  int leavesTakenThisMonth;
  int leavesMonthOpeningBalance;

  LeaveBalance(this.leavesAccruedThisMonth, this.leavesTakenThisMonth,
      this.leavesMonthOpeningBalance);

  @override
  String toString() {
    return '{${this.leavesAccruedThisMonth},${this.leavesMonthOpeningBalance}}';
  }
}
