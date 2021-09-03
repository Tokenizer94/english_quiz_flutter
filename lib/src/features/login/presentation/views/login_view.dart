import 'package:english_quiz_flutter/src/features/login/presentation/widgets/mybackground_widget.dart';
import 'package:english_quiz_flutter/src/features/login/presentation/widgets/mybutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:tokenizer/tokenizer.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyBaseWidget(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      hasScrollView: false,
      mobileChild: LoginMobileView(),
    );
  }
}

class LoginMobileView extends HookWidget {
  LoginMobileView({Key? key}) : super(key: key);

  late String _fullName;
  late String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil().uiSize = designSize;
    return Stack(
      children: [
        const MyBackgroundWidget(),
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 0.1.sh),
          Text(
            translate('login_page'),
            style: fontCreator(
              fontSize: 26,
              fontWeights: FontWeights.bold,
            ),
          ),
          SizedBox(height: 0.02.sh),
          Text(
            translate('desc.login_desc'),
            style: fontCreator(),
          ),
          SizedBox(height: 0.1.sh),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _buildFullName(),
                SizedBox(height: 0.03.sh),
                _buildPhoneNumber(),
                SizedBox(height: 0.2.sh),
                MyButtonWidget(btnText: translate('continue'), onPressBtn: _onTapSubmit),
                SizedBox(height: 0.1.sh),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullName() {
    return Padding(
      padding: syma(horizontal: 0.1.sw),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        style: fontCreator(),
        maxLength: 30,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: translate('full_name'),
          labelStyle: fontCreator(),
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 1.w, color: Colors.white70),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 1.w, color: Colors.white70),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 2.w, color: Colors.greenAccent),
          ),
          contentPadding: syma(horizontal: 16, vertical: 16),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return translate('validation.required');
          }
          if (value.length < 3) {
            return translate('validation.3_char');
          }
        },
        onSaved: (String? value) {
          _fullName = value ?? '';
        },
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: syma(horizontal: 0.1.sw),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        style: fontCreator(),
        maxLength: 11,
        decoration: InputDecoration(
          labelText: translate('phone_number'),
          labelStyle: fontCreator(),
          errorStyle: fontCreator(fontColor: Colors.pink, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 1.w, color: Colors.white70),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 1.w, color: Colors.white70),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 2.w, color: Colors.greenAccent),
          ),
          contentPadding: syma(horizontal: 16, vertical: 16),
          counterText: '',
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return translate('validation.required');
          }
          if (!RegExp("09(0[1-9]|1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}").hasMatch(value)) {
            return translate('validation.wrong_phone');
          }
        },
        onSaved: (String? value) {
          _phoneNumber = value ?? '';
        },
      ),
    );
  }

  void _onTapSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
  }
}
