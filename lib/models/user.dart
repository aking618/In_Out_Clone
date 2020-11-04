class MyUser {
  final String uid;

  MyUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String title;
  final String location;
  final String timeStamp;
  final String clockedIn;

  UserData(
      {this.uid,
      this.name,
      this.title,
      this.location,
      this.timeStamp,
      this.clockedIn});
}
