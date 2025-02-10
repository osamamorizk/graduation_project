import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: ColorsManger.darkBlue,
      size: 60.0,
    );
  }
}
