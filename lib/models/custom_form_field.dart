import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import '../enums/formfield_type.dart';
// import '../ui/shared/app_colors.dart';

enum FormFieldType {
  // heading,
  input,
  // dropdown,
  // select,
  // date,
  // row,
  // otp,
  // customWidget
}


class CustomFormField {
  final String label;
  final Widget? labelAction;
  final String? hintText;
  final double borderRadius;
  final FormFieldType type;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function(String?)? onFieldSubmitted;
  Function(dynamic)? onChanged;
  final List? choices;
  final TextEditingController? controller;
  final TextInputType inputType;
  final TextInputAction? keyboardAction;
  final int? minLines, maxLines, maxLength;
  final EdgeInsets? padding;
  final List? selectedOptions;
  final FocusNode? focusNode;
  final bool? obscureText, showLabel;
  final Widget? prefix;
  final Widget? suffix;
  final bool? readOnly;
  final bool? enabled;
  final bool filled;
  final bool? fullBorder;
  final Color? fillColor,
      labelColor,
      enabledBorderColor,
      borderColor,
      textColor,
      labelBgColor;
  final double? fontSize, spacing, width;
  final FontWeight? fontWeight;
  final List<CustomFormField> children;
  final Map<String, dynamic> config;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? customWidget;

  final TextStyle? textStyle;
  final DateTime? maxDate;
  final DateTime? minDate;

  final bool showBorder;

  CustomFormField({
    required this.label,
    this.labelAction,
    this.hintText,
    required this.type,
    this.borderRadius = 5,
    this.validator,
    this.onSaved,
    this.textStyle,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.choices,
    this.controller,
    this.inputType = TextInputType.text,
    this.keyboardAction = TextInputAction.next,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.padding = EdgeInsets.zero,
    this.selectedOptions,
    this.focusNode,
    this.obscureText = false,
    this.showLabel = false,
    this.showBorder = true,
    this.prefix,
    this.suffix,
    this.readOnly = false,
    this.enabled = true,
    this.fullBorder = true,
    this.filled = true,
    this.fillColor,
    this.labelColor = Colors.grey,
    this.enabledBorderColor,
    this.borderColor,
    this.textColor,
    this.labelBgColor = const Color(0xFF7B8381),
    this.fontSize,
    this.fontWeight,
    this.spacing,
    this.children = const [],
    this.config = const {},
    this.width,
    this.inputFormatters = const [],
    this.customWidget, 
    this.maxDate, 
    this.minDate
  });
}
