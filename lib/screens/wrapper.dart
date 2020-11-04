import 'package:flutter/material.dart';
import 'package:in_out_clone/models/user.dart';
import 'package:in_out_clone/screens/authenticate/authenticate.dart';
import 'package:in_out_clone/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
