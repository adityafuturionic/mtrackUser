class LeaveType {
  int id;
  String name;

  LeaveType(this.id, this.name);

  @override
  String toString() {
    return '{${this.id},${this.name}}';
  }
}
