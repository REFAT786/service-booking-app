import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/styles.dart';
import '../../../utils/app_color.dart';
import '../../../utils/dimensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.isSuffix,
    required this.controller,
  });

  final String hintText;
  final bool isSuffix;
  final IconData prefixIcon;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondary100,
          borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.isSuffix ? !passwordVisible : passwordVisible,
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            contentPadding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: AppColors.secondary550,
              size: Dimensions.iconSizeTwenty,
            ),
            suffixIcon: widget.isSuffix
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: !passwordVisible
                        ? const Icon(Icons.visibility_off,
                            color: AppColors.secondary550,
                            size: Dimensions.iconSizeTwenty)
                        : const Icon(Icons.visibility,
                            color: AppColors.secondary550,
                            size: Dimensions.iconSizeTwenty),
                  )
                : null,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: styleNormal.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: AppColors.secondary550),
          ),
        ));
  }
}
