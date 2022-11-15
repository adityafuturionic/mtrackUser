class UserData {
  int id;
  String email;
  String mobile;
  String firstName;
  String lastName;

  UserData(this.id, this.email, this.mobile, this.firstName, this.lastName);

  @override
  String toString() {
    return '{${this.id},${this.email},${this.mobile},${this.firstName},${this.lastName}}';
  }
}
