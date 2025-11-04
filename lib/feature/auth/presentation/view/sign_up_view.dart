import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_toast.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model_state.dart';
import 'package:clothing_store/feature/auth/presentation/widget/create_account_view.dart';
import 'package:clothing_store/feature/auth/presentation/widget/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 23 - 12),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.bgColorTextField,
            child: SvgPicture.asset(AppSVG.arrowSvg, height: 16),
          ),
        ),
      ),
      body: BlocListener<AuthViewModel, AuthViewModelState>(
        listener: (context, state) {
          Toast.showLoading(context: context, isLoading: state.isLoading);

          if (state.isSuccess) {
            Toast.showToast(context: context, msg: "Success");
          } else if (state.isFailure) {
            Toast.showToast(context: context, msg: "${state.errorMessage}");
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: _signViewPage.length,
                  itemBuilder: (context, index) => _signViewPage[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get _signViewPage => [
    CreateAccountView(
      onPressed: () {
        _pageController.nextPage(
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      },
    ),
    ForgetPasswordView(),
  ];
}
