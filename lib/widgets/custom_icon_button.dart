import 'package:bibliotheque/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    this.bgColor,
    this.onPressed,
  }) : super(key: key);
  final Widget icon;
  final Color? bgColor;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      width: 46.w,
      color: AppColors.transparentColor,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashColor: Colors.transparent,
            icon: icon,
            color: bgColor ?? Colors.transparent,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
