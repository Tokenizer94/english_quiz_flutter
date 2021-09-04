import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokenizer/tokenizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingBouncingGrid.circle(
            backgroundColor: Colors.white,
            size: 60.w,
          ),
          SizedBox(height: 20.h),
          Text(
            translate('loading'),
            style: fontCreator(),
          )
        ],
      ),
    );
  }
}
