import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:clothing_store/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _signViewPage.length,
                itemBuilder: (context, index) => _signViewPage[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _signViewPage => [
    CreateAccountView(
      onPressed: () {
        _pageController.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        );
      },
    ),
    ForgetPasswordView(),
  ];
}

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Forget Password", style: AppTextStyle.bold32),
        SizedBox(height: 16),
        CustomTextFormField(labelText: "Enter Email address"),
        SizedBox(height: 24),
        CustomElevatedButtom(
          onPressed: (){
            Navigator.pushNamed(context, Routes.sendEmailView);
          },
          child: Text("Continue", style: AppTextStyle.medium16),
        ),
      ],
    );
  }
}

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text("Create Account", style: AppTextStyle.bold32),
          SizedBox(height: 16),
          CustomTextFormField(labelText: "Firstname"),
          CustomTextFormField(labelText: "Lastname"),
          CustomTextFormField(labelText: "Email Address"),
          CustomTextFormField(labelText: "Password"),
          SizedBox(height: 24),
          CustomElevatedButtom(
            onPressed: onPressed,
            child: Text("Continue", style: AppTextStyle.medium16),
          ),
          SizedBox(height: 24),
          _buildCreateAccount(),
        ],
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Forget Password ?", style: AppTextStyle.regular12),
          TextSpan(text: "Reset", style: AppTextStyle.medium12),
        ],
      ),
    );
  }
}
