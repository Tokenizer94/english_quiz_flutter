import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/user_info/user_info_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/widgets/loading_widget.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/widgets/mybackground_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokenizer/tokenizer.dart';

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
        BlocConsumer(
          builder: (context, state) {
            mContext = context;
            if (state is UserInfoInitial) {}
            if (state is UserInfoLoading) {
              return const LoadingWidget();
            }
            if (state is UserInfoError) {}
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is UserInfoSuccess) {}
          },
        ),
      ],
    );
  }
}
