import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_form/data/custom_form_field_data.dart';
import 'package:json_dynamic_form/data/text_input_type.dart';
import '../extensions/color.dart';

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

  CustomFormField(
      {required this.label,
      this.labelAction,
      this.hintText,
      this.type = FormFieldType.input,
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
      this.minDate});

  factory CustomFormField.fromJson(Map<String, dynamic> json) {
    CustomFormFieldData data = CustomFormFieldData.fromJson(json);
    return CustomFormField(
        label: data.label ?? "",
        showLabel: data.showLabel,
        showBorder: data.showBorder ?? true,
        hintText: data.hint,
        fillColor: HexColor.fromHex(data.fillColor),
        labelBgColor: HexColor.fromHex(data.labelBgColor),
        labelColor: HexColor.fromHex(data.labelColor),
        textColor: HexColor.fromHex(data.textColor),
        borderColor: HexColor.fromHex(data.borderColor),
        enabledBorderColor: HexColor.fromHex(data.enabledBorderColor),
        enabled: data.enabled,
        readOnly: data.readOnly,
        obscureText: data.obscureText,
        maxLength: data.maxLength,
        maxLines: data.maxLines,
        padding: EdgeInsets.symmetric(
            vertical: data.verticalPadding?.toDouble() ?? 0,
            horizontal: data.horizontalPadding?.toDouble() ?? 0),
        borderRadius: data.borderRadius ?? 5,
        filled: data.filled ?? true,
        fontSize: data.fontSize?.toDouble(),
        inputType:
            AppTextInputType.values[data.inputType] ?? TextInputType.text,
        keyboardAction: data.inputAction != null
            ? TextInputAction.values.byName(data.inputAction!)
            : TextInputAction.next,
        validator: (entry) {
          if (entry == null) {
            return "Text input cannot be null";
          }
          if (data.validatorRegex == null) return null;
          var regex = RegExp(data.validatorRegex!);
          return regex.hasMatch(entry) ? null : "Invalid input";
        },
        inputFormatters: _buildTextInputFormatters(data));
  }

  static List<TextInputFormatter> _buildTextInputFormatters(
      CustomFormFieldData data) {
    List<TextInputFormatter> formatter = [];
    if (data.blackListFormatterRegex != null) {
      formatter.add(FilteringTextInputFormatter.deny(
          RegExp(data.blackListFormatterRegex!)));
    }
    if (data.whiteListFormatterRegex != null) {
      formatter.add(FilteringTextInputFormatter.allow(
          RegExp(data.whiteListFormatterRegex!)));
    }
    return formatter;
  }
}
