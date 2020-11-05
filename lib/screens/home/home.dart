import 'package:flutter/material.dart';
import 'package:in_out_clone/models/employee.dart';
import 'package:in_out_clone/screens/home/employee_list.dart';
import 'package:in_out_clone/screens/home/settings_form.dart';
import 'package:in_out_clone/services/auth.dart';
import 'package:in_out_clone/services/database.dart';
import 'package:in_out_clone/shared/constants.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.75,
              child: Container(
                color: timberwolf,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: SettingsForm(),
              ),
            );
          });
    }

    return StreamProvider<List<Employee>>.value(
      initialData: [],
      value: DatabaseService().employees,
      child: Scaffold(
        backgroundColor: timberwolf,
        appBar: AppBar(
          title: Text('In-Out Board'),
          backgroundColor: deepSpaceSparkle,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () => _showSettingsPanel(),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: EmployeeList(),
      ),
    );
  }
}
