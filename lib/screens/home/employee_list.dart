import 'package:flutter/material.dart';
import 'package:in_out_clone/models/employee.dart';
import 'package:in_out_clone/screens/home/employee_tile.dart';
import 'package:provider/provider.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    final employees = Provider.of<List<Employee>>(context) ?? [];

    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return EmployeeTile(employee: employees[index]);
      },
    );
  }
}
