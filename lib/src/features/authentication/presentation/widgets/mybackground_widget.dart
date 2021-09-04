import 'package:english_quiz_flutter/src/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBackgroundWidget extends StatelessWidget {
  final String imageAddress;

  const MyBackgroundWidget({this.imageAddress = kAppBackgroundAsset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 1.0.sh,
        child: Image.asset(imageAddress, fit: BoxFit.cover),
      );
  }
}
