import 'package:flutter/material.dart';
import 'package:in_out_clone/models/employee.dart';
import 'package:in_out_clone/screens/home/clock_in_circle.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;
  EmployeeTile({this.employee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 0.0),
        child: ListTile(
          leading: ClockInCircle(employee: employee),
          title: Text(employee.name),
          subtitle: Text(employee.title),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(employee.location),
              Text(employee.timeStamp),
            ],
          ),
        ),
      ),
    );
  }
}
