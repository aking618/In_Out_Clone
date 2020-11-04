import 'package:flutter/material.dart';
import 'package:in_out_clone/models/employee.dart';
import 'package:in_out_clone/screens/home/employee_list.dart';
import 'package:in_out_clone/screens/home/settings_form.dart';
import 'package:in_out_clone/services/auth.dart';
import 'package:in_out_clone/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Employee>>.value(
      initialData: [],
      value: DatabaseService().employees,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Text('In-Out Board'),
          backgroundColor: Colors.deepPurple[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('Logout'),
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              onPressed: () => _showSettingsPanel(),
              label: Text('Settings'),
            )
          ],
        ),
        body: EmployeeList(),
      ),
    );
  }
}
