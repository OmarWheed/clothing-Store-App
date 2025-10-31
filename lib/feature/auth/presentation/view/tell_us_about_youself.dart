import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutYouView extends StatelessWidget {
  const AboutYouView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColor.bgColorTextField,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: CustomElevatedButtom(
          child: Text("Finish", style: AppTextStyle.medium16),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text("Tell us About yourself", style: AppTextStyle.bold24),
            SizedBox(height: 49),
            Text("Who do you shop for ?", style: AppTextStyle.regular16),
            SizedBox(height: 22),
            _buildChooseGender(),
            SizedBox(height: 56),
            Text("How Old are you ?", style: AppTextStyle.regular16),
            SizedBox(height: 13),
            _buildAgeRange(),
          ],
        ),
      ),
    );
  }

  Widget _buildChooseGender() {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: CustomElevatedButtom(
            child: Text("Men", style: AppTextStyle.medium16),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: CustomElevatedButtom(
            onPressed: () {},
            color: AppColor.bgColorTextField,
            child: Text("Women", style: AppTextStyle.medium16),
          ),
        ),
      ],
    );
  }

  Widget _buildAgeRange() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.bgColorTextField,

        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Row(
        children: [
          Text("Age Range", style: AppTextStyle.regular16),
          Spacer(),
          SvgPicture.asset(AppSVG.arrowDownSvg),
        ],
      ),
    );
  }
}
