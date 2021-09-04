import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:ndialog/ndialog.dart';
import 'package:supercharged/supercharged.dart';
import 'package:tokenizer/tokenizer.dart';

class MyToast {
  const MyToast();

  void call({
    required String message,
    Color? toastColor,
    Toast toastLength = Toast.LENGTH_LONG,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: toastColor ?? Colors.lightBlue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

class MyLoading {
  CustomProgressDialog? _progressDialog;

  MyLoading();

  Future<void> call(
    BuildContext context,
    Function job, {
    String msg = 'loading',
    bool autoDismiss = false,
  }) async {
    _progressDialog = CustomProgressDialog(
      context,
      blur: 3,
      dismissable: false,
      loadingWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingBouncingGrid.circle(
            backgroundColor: Colors.white,
            size: 60.w,
          ),
          SizedBox(height: 20.h),
          Text(
            msg,
            style: fontCreator(),
          )
        ],
      ),
    );
    _progressDialog?.show();
    await job();
    if (autoDismiss) {
      await Future.delayed(400.milliseconds).then((value) {
        dismissLoading();
      });
    }
  }

  void dismissLoading() {
    if (_progressDialog != null) _progressDialog?.dismiss();
  }
}
