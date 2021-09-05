import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/auth/auth_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/local_user_info/local_user_info_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/user_info/user_info_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/widgets/loading_widget.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/widgets/mybackground_widget.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/widgets/mybutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:tokenizer/tokenizer.dart';

//ToDo: Add resend code button
//ToDo: Add timer. 2 min
//ToDo: Add change phoneNumber button
class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyBaseWidget(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      hasScrollView: false,
      mobileChild: VerificationCodeMobileView(),
    );
  }
}

class VerificationCodeMobileView extends HookWidget {
  VerificationCodeMobileView({Key? key}) : super(key: key);

  late String _verifyCode;
  late TextEditingController _verifyCodeTEC;
  late FocusNode _verifyCodeFN;
  late BuildContext mContext;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _verifyCodeTEC = useTextEditingController();
    _verifyCodeFN = useFocusNode();
    ScreenUtil().uiSize = designSize;
    return Stack(
      children: [
        const MyBackgroundWidget(),
        BlocConsumer<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            mContext = context;
            if (state is UserInfoInitial) {
              return _buildBody();
            }
            if (state is UserInfoLoading) {
              return const LoadingWidget();
            }
            if (state is UserInfoError) {
              _verifyCodeTEC.clear();
              return _buildBody();
            }
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is UserInfoSuccess) {
              context.read<LocalUserInfoBloc>().add(SaveUserInfo(userInfo: state.userInfo));
              Navigator.popAndPushNamed(context, '/home');
            }
          },
        ),
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
                _buildVerifyCode(),
                SizedBox(height: 0.2.sh),
                MyButtonWidget(btnText: translate('login'), onPressBtn: _onTapSubmit),
                SizedBox(height: 0.1.sh),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyCode() {
    return Padding(
      padding: syma(horizontal: 0.1.sw),
      child: TextFormField(
        controller: _verifyCodeTEC,
        focusNode: _verifyCodeFN,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        style: fontCreator(),
        maxLength: 5,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: translate('verify_code'),
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
          if (value.length < 5) {
            return translate('validation.5_char');
          }
        },
        onSaved: (String? value) {
          _verifyCode = value ?? '';
        },
      ),
    );
  }

  void _onTapSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    final authSuccessState = mContext.read<AuthBloc>().state as AuthSuccess;
    mContext.read<UserInfoBloc>().add(
          GetUserInfo(
            fullname: authSuccessState.fullname,
            phoneNumber: authSuccessState.phoneNumber,
            verifyCode: _verifyCode,
          ),
        );
  }
}
