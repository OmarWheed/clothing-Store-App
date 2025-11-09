import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 23 - 12),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.bgColorTextField,
            child: SvgPicture.asset(AppSVG.arrowSvg, height: 16),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
