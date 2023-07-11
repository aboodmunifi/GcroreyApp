import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String content;
  Color backgroundColor,textColor;
  double width,elevation,radius,height;
  final void Function() onPressed;

   AppButton({
    Key? key,
    required this.content,
    required this.onPressed,
     this.backgroundColor = AppColors.primary,
     this.textColor = AppColors.white,
     this.width = double.infinity,
     this.height = 56,
     this.elevation = 4,
     this.radius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: backgroundColor,
        minimumSize: Size(width.w, height.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.r),
        ),
        alignment: Alignment.center,
      ),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(
          fontSize: 16.sp,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
