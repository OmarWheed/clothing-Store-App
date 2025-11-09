import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:clothing_store/core/utils/app_toast.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AboutYouView extends StatelessWidget {
  const AboutYouView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthViewModelState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.isSuccess != current.isSuccess ||
          previous.isFailure != current.isFailure,
      listener: (context, state) {
        Toast.showLoading(context: context, isLoading: state.isLoading);
        if (state.isSuccess) {
          Toast.showToast(context: context, msg: "Success");
          Navigator.of(context).pushReplacementNamed(Routes.homeView);
        } else if (state.isFailure) {
          Toast.showToast(context: context, msg: "${state.errorMessage}");
        }
      },
      child: Scaffold(
        bottomNavigationBar: _finishButton(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text("Tell us About yourself", style: context.appTheme.bold32),
              SizedBox(height: 49),
              Text("Who do you shop for ?", style: context.appTheme.medium16),
              SizedBox(height: 22),
              _buildChooseGender(),
              SizedBox(height: 56),
              Text("How Old are you ?", style: context.appTheme.medium16),
              SizedBox(height: 13),
              _buildAgeRange(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _finishButton(BuildContext context) {
    var entity = ModalRoute.of(context)?.settings.arguments as SignUpEntity;
    return Container(
      color: AppColor.bgColorTextField,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: ElevatedButton(
        child: Text("Finish"),
        onPressed: () {
          entity.age = "";
          entity.gender = "";
          context.read<AuthViewModel>().signUp(entity);
        },
      ),
    );
  }

  Widget _buildChooseGender() {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: ElevatedButton(child: Text("Men"), onPressed: () {}),
        ),
        Expanded(
          child: ElevatedButton(onPressed: () {}, child: Text("Women")),
        ),
      ],
    );
  }

  Widget _buildAgeRange(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.bgColorTextField,

        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Row(
        children: [
          Text("Age Range", style: context.appTheme.medium16),
          Spacer(),
          SvgPicture.asset(AppSVG.arrowDownSvg),
        ],
      ),
    );
  }
}
