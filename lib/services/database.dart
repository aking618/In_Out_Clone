import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_out_clone/models/employee.dart';
import 'package:in_out_clone/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference employeeCollection =
      FirebaseFirestore.instance.collection('employees');

  Future updateUserData(String name, String title, String location,
      String timeStamp, String clockedIn) async {
    return await employeeCollection.doc(uid).set({
      'name': name,
      'title': title,
      'location': location,
      'timeStamp': timeStamp,
      'clockIn': clockedIn,
    });
  }

  // employee list from snapshot
  List<Employee> _employeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return Employee(
        name: data['name'] ?? '',
        title: data['title'] ?? '',
        location: data['location'] ?? '',
        timeStamp: data['timeStamp'] ?? '',
        clockedIn: data['clockIn'] ?? '',
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();
    return UserData(
      uid: uid,
      name: data['name'],
      title: data['title'],
      location: data['location'],
      timeStamp: data['timeStamp'],
      clockedIn: data['clockIn'],
    );
  }

  // get employees stream
  Stream<List<Employee>> get employees {
    return employeeCollection.snapshots().map(_employeeListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return employeeCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
