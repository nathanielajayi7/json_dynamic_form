import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType inputType;
  final TextEditingController? textController;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool fullBorder;
  final bool filled;
  final int? maxLength;
  final int? maxLines;
  final int minLines;
  final TextInputAction keyboardAction;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditComplete;
  final Color? borderColor,
      enabledBorderColor,
      errorBorderColor,
      labelColor,
      textColor,
      fillColor,
      errorTextColor,
      hintTextColor;
  final bool showLabel;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final double borderRadius;
  final List<TextInputFormatter> inputFormatters;
  final TextCapitalization textCapitalization;
  final double? fontSize;
  final bool showBorder;
  const Input({
    Key? key,
    this.label,
    required this.hintText,
    this.initialValue,
    this.textController,
    this.inputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.filled = true,
    this.fullBorder = true,
    this.maxLines,
    this.minLines = 1,
    this.maxLength,
    this.keyboardAction = TextInputAction.next,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.onTap,
    this.fontSize,
    this.onChanged,
    this.showBorder = true,
    this.onFieldSubmitted,
    this.onEditComplete,
    this.borderColor = Colors.grey,
    this.enabledBorderColor = Colors.black12,
    this.errorBorderColor = Colors.red,
    this.labelColor = Colors.black,
    this.textColor = Colors.black,
    this.hintTextColor = Colors.black38,
    this.errorTextColor = Colors.red,
    this.fillColor = Colors.white,
    this.showLabel = true,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.borderRadius = 30,
    this.inputFormatters = const [],
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      initialValue: initialValue,
      textAlign: textAlign,
      
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        contentPadding: !fullBorder
            ? null
            :  const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: showLabel ? label : null,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: fontSize ?? 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: fullBorder
            ? OutlineInputBorder(
              
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(),
        focusedBorder: !showBorder ?  InputBorder.none : (fullBorder
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(borderRadius),
                
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              )),
        errorBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(color: errorBorderColor!, width: 1),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(color: errorBorderColor!, width: 1),
              ),
        enabledBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: enabledBorderColor ?? fillColor!),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
        filled: filled,
        isDense: true,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: fontSize ?? 14
        ),
        hintText: hintText,
        fillColor: fillColor,
        errorStyle: TextStyle(
          color: errorTextColor,
          fontSize: 12,
          fontStyle: FontStyle.italic
        ),
      ),
      style: textStyle ?? TextStyle(color: textColor, fontSize: fontSize),
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: minLines > 1 ? TextInputType.multiline : inputType,
      textInputAction: keyboardAction,
      validator: validator,
      onSaved: onSaved,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: textController,
      onEditingComplete: onEditComplete,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
    );
  }
}
