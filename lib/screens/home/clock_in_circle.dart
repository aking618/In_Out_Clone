import 'package:flutter/material.dart';
import 'package:in_out_clone/models/employee.dart';

class ClockInCircle extends StatelessWidget {
  ClockInCircle({this.employee});
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          employee.clockedIn == 'IN' ? Colors.green[700] : Colors.red,
      radius: 25.0,
      child: Text(
        employee.clockedIn,
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
    );
  }
}
