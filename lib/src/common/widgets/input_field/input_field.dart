// ignore_for_file: lines_longer_than_80_chars, comment_references

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';

final class InputField extends StatelessWidget {
  final GlobalKey<FormState>? formKey;

  final String? Function(String?)? validator;

  final String? hintText;

  // By default , value of {onChanged} is [null]
  final ValueChanged<String>? onChanged;

  // By default , value of {controller} is [null]
  final TextEditingController? controller;

  // By default, value of {fieldTitle} is [null]
  final String? fieldTitle;

  final VoidCallback? onTap;

  /// By default, the value of {focusNode} is [null]
  final FocusNode? focusNode;

  final bool? readOnly;

  final bool? obscureText;

  /// By default, the value of {textCapitalization} is [TextCapitalization.sentences]
  final TextCapitalization textCapitalization;

  /// By default, the value of {minLines} is [1]
  // final int minLines;

  final InputDecoration? inputDecoration;

  final TextInputType? keyboardType;

  /// By default, the value of {maxLines} is [2]
  final int maxLines;

  final String? initialValue;

  final List<TextInputFormatter>? formatters;

  final TextStyle? textStyle;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  final TextStyle? hintStyle;

  final String? labelText;

  final TextStyle? labelStyle;

  final int? maxLength;
  const InputField({
    this.hintText,
    this.keyboardType,
    this.formKey,
    this.validator,
    this.onChanged,
    this.controller,
    this.inputDecoration,
    this.onTap,
    this.readOnly,
    this.obscureText,
    this.fieldTitle,
    this.formatters,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    // this.minLines = AppDimensions.defaultMinLines,
    this.maxLines = AppDimensions.defaultMinLines,
    this.initialValue,
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Form(
      key: formKey,
      child: TextFormField(
        
        initialValue: initialValue,
        onTap: onTap,
        readOnly: readOnly ?? false,
        // minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters: formatters,
        textCapitalization: textCapitalization,
        style: textStyle ??
            themePath.headlineMedium?.copyWith(
              color: colorPath.primaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
        controller: controller,
        validator: validator,
        cursorColor: colorPath.mainColor,
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        decoration: inputDecoration ??
            InputDecoration(
              contentPadding: const EdgeInsets.all(
                AppDimensions.large,
              ),
              filled: true,
              fillColor: context.theme.inputFieldFillColor,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,

              // border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(
              //     Radius.circular(
              //       AppDimensions.large,
              //     ),
              //   ),
              //   borderSide: BorderSide(
              //     color: context.theme.mainColor,
              //   ),
              // ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorPath.transparentColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.large,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorPath.mainColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.large,
                  ),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorPath.errorColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.medium,
                  ),
                ),
              ),
              labelText: labelText,
              labelStyle: labelStyle,
              hintText: hintText,
              hintStyle: hintStyle ??
                  themePath.titleLarge?.copyWith(
                    color: context.theme.tertiaryTextColor,
                    height: AppFonts.sizeFactorLarge,
                  ),
            ),
        onChanged: onChanged,
        maxLength: maxLength,
        autocorrect: false,
        enableSuggestions: false,
      ),
    );
  }
}
