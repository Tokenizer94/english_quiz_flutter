import 'package:english_quiz_flutter/src/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokenizer/tokenizer.dart';

class MyButtonWidget extends StatelessWidget {
  final bool hasIcon;
  final String btnText;
  final Icon? btnIcon;
  final Function()? onPressBtn;
  final ButtonStyle? buttonStyle;

  const MyButtonWidget({
    Key? key,
    required this.onPressBtn,
    this.btnText = '',
    this.buttonStyle,
    this.btnIcon,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressBtn,
      style: buttonStyle ??
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(lightBlue),
            //elevation: MaterialStateProperty.all<double>(4.0),
            //shadowColor: MaterialStateProperty.all<Color>(Colors.white54),
            alignment: Alignment.center,
            fixedSize: MaterialStateProperty.all<Size>(Size(0.5.sw, 0.1.sh)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
            ),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hasIcon) btnIcon!,
          if (hasIcon) SizedBox(width: 8.w),
          Text(btnText, style: fontCreator(fontSize: 22)),
        ],
      ),
    );
  }
}
