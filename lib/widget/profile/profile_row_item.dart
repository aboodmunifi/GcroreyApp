import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

// ignore: must_be_immutable
class ProfileRowItem extends StatelessWidget {
  Color color;
  String icon, text;
  final void Function() onPressed;

  ProfileRowItem({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 60.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: SvgPicture.asset(
                "imags/$icon.svg",
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                height: 0,
                fontSize: 12.sp,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
