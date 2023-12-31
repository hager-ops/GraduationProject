import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final String? hint;
  final String? labelText;
  final Widget? suffix;
  final Color? borderColor;
  final void Function(String)? onchange;
  final VoidCallback? onTap;
  final bool? isEnabled;
  final bool isValid;
  final Color? textColor;
  final double? contentPadding;
  final double? hintTextFontSize;
  final Color? color;

  const AppTextFormField({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.hint,
    this.labelText,
    this.suffix,
    this.borderColor,
    this.isEnabled,
    this.onchange,
    this.onTap,
    this.isValid = true,
    this.initialValue,
    this.textColor,
    this.contentPadding,
    this.hintTextFontSize,
    this.color,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool passwordObscured = false;

  @override
  void initState() {
    passwordObscured = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      cursorColor: AppColors.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.isEnabled,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          filled: true,
          hintText: widget.hint,
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: onEyePressed,
                  behavior: HitTestBehavior.translucent,
                  child: Icon(
                    passwordObscured
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    color: AppColors.textPrimaryColor,
                    size: 16,
                  ),
                )
              : const SizedBox(),
          hintStyle: TextStyles.regular(
            color: AppColors.textPrimaryColor.withOpacity(.5),
          ),
          labelStyle: TextStyles.regular(
            color: AppColors.greyColor,
          ),
          fillColor: AppColors.forthColor,
          errorStyle: const TextStyle(color: Colors.redAccent),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: AppColors.borderColor.withOpacity(.4),
                width: 1,
                style: BorderStyle.solid),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: AppColors.warning, width: 1, style: BorderStyle.solid),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
                style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
                style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
                style: BorderStyle.solid),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: AppColors.warning, width: 1, style: BorderStyle.solid),
          ),
          counterText: ""),
      obscureText: passwordObscured,
      style: TextStyles.regular(
        color: widget.isValid
            ? widget.textColor ?? AppColors.textPrimaryColor
            : Colors.redAccent,
        fontSize: 16,
      ),
      validator: (value) {
        if (value == null || value == '') {
          return '${widget.hint} can\'t be empty';
        }
        return null;
      },
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onChanged: widget.onchange,
      onTap: widget.onTap,
    );
  }

  void onEyePressed() {
    setState(() {
      passwordObscured = !passwordObscured;
    });
  }
}
