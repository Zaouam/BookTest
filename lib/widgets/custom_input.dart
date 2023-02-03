import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum InputType { numeric, alphabetic, alphaNumeric }

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    this.autofocus = false,
    this.obscureText = false,
    required this.controller,
    this.hintText = '',
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.maxLines = 1,
    this.inputType,
    this.focusNode,
    this.nextFocusNode,
    this.keyboardType = TextInputType.multiline,
    this.validator,
    this.fillColor = Colors.white,
    this.filled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.title,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.maxLength,
    this.autovalidateMode,
    this.initialValue,
    this.textCapitalization = TextCapitalization.none,
    this.enabled,
  }) : super(key: key);

  final bool autofocus;
  final TextEditingController controller;
  final String hintText;
  final bool? enabled;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final int maxLines;
  final InputType? inputType;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Color fillColor;
  final bool filled;
  final int? maxLength;
  final bool? maxLengthEnforced = true;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? title;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
          padding: EdgeInsets.only(bottom:4.h),
          child: Text(
            title!,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Poppins'
            )
          ),
        )
            : const SizedBox(),
        TextFormField(
          key: key,
          autofocus: autofocus,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          onSaved: onSaved,
          initialValue: initialValue,
          maxLength: maxLength,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          style: TextStyle(
            height: 1.2,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'
          ),
          cursorColor: Colors.black12,
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            hintStyle: TextStyle(
              height: 1.2,
              fontSize: 14.sp,
              fontFamily: 'Poppins'
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right:8.w),
              child: suffixIcon,
            ),
            suffixIconConstraints: BoxConstraints(
              minHeight: 24.h,
              minWidth: 24.w,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 12.w,
            ),
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints(
              minHeight: 24.h,
              minWidth: 24.w,
            ),
          ),
          autocorrect: false,
          enableSuggestions: false,
          enabled: enabled,
          textInputAction: textInputAction,
          autovalidateMode: autovalidateMode,
          validator: validator,
          enableInteractiveSelection: true,
          focusNode: focusNode,
          textCapitalization: textCapitalization,
        ),
      ],
    );
  }
}
