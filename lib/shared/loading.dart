import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:in_out_clone/shared/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: deepSpaceSparkle,
      child: Center(
        child: SpinKitChasingDots(
          color: champagnePink,
          size: 50.0,
        ),
      ),
    );
  }
}
