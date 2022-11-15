class Holiday {
  int id;
  String date;
  String name;

  Holiday(
    this.id,
    this.date,
    this.name,
  );

  @override
  String toString() {
    return '{${this.id},${this.date},${this.name}}';
  }
}
