class CustomFormFieldData {
  String? label;
  String? fillColor;
  String? labelColor;
  String? enabledBorderColor;
  String? borderColor;
  String? textColor;
  String? labelBgColor;
  num? fontSize;
  num? spacing;
  num? width;
  String? whiteListFormatterRegex;
  String? blackListFormatterRegex;
  bool? showBorder;
  bool? showLabel;
  bool? filled;
  bool? enabled;
  bool? readOnly;
  bool? obscureText;
  String? suffix;
  String? prefix;
  String? inputType;
  String? inputAction;
  num? verticalPadding;
  num? horizontalPadding;
  double? borderRadius;
  String? hint;
  int? maxLines;
  int? maxLength;
  String? validatorRegex;

  CustomFormFieldData(
      {this.label,
      this.fillColor,
      this.labelColor,
      this.enabledBorderColor,
      this.borderColor,
      this.textColor,
      this.labelBgColor,
      this.fontSize,
      this.spacing,
      this.width,
      this.whiteListFormatterRegex,
      this.blackListFormatterRegex,
      this.showBorder,
      this.showLabel,
      this.filled,
      this.enabled,
      this.readOnly,
      this.obscureText,
      this.suffix,
      this.prefix,
      this.inputType,
      this.inputAction,
      this.verticalPadding,
      this.horizontalPadding,
      this.borderRadius,
      this.hint,
      this.maxLines,
      this.maxLength,
      this.validatorRegex});

  CustomFormFieldData.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    fillColor = json['fillColor'];
    labelColor = json['labelColor'];
    enabledBorderColor = json['enabledBorderColor'];
    borderColor = json['borderColor'];
    textColor = json['textColor'];
    labelBgColor = json['labelBgColor'];
    fontSize = json['fontSize'];
    spacing = json['spacing'];
    width = json['width'];
    whiteListFormatterRegex = json['white_list_formatter_regex'];
    blackListFormatterRegex = json['black_list_formatter_regex'];
    showBorder = json['showBorder'];
    showLabel = json['showLabel'];
    filled = json['filled'];
    enabled = json['enabled'];
    readOnly = json['readOnly'];
    obscureText = json['obscureText'];
    suffix = json['suffix'];
    prefix = json['prefix'];
    inputType = json['inputType'];
    inputAction = json['inputAction'];
    verticalPadding = json['vertical_padding'];
    horizontalPadding = json['horizontal_padding'];
    borderRadius = json['border_radius'];
    hint = json['hint'];
    maxLines = json['maxLines'];
    maxLength = json['maxLength'];
    validatorRegex = json['validator_regex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['fillColor'] = fillColor;
    data['labelColor'] = labelColor;
    data['enabledBorderColor'] = enabledBorderColor;
    data['borderColor'] = borderColor;
    data['textColor'] = textColor;
    data['labelBgColor'] = labelBgColor;
    data['fontSize'] = fontSize;
    data['spacing'] = spacing;
    data['width'] = width;
    data['white_list_formatter_regex'] = whiteListFormatterRegex;
    data['black_list_formatter_regex'] = blackListFormatterRegex;
    data['showBorder'] = showBorder;
    data['showLabel'] = showLabel;
    data['filled'] = filled;
    data['enabled'] = enabled;
    data['readOnly'] = readOnly;
    data['obscureText'] = obscureText;
    data['suffix'] = suffix;
    data['prefix'] = prefix;
    data['inputType'] = inputType;
    data['inputAction'] = inputAction;
    data['vertical_padding'] = verticalPadding;
    data['horizontal_padding'] = horizontalPadding;
    data['border_radius'] = borderRadius;
    data['hint'] = hint;
    data['maxLines'] = maxLines;
    data['maxLength'] = maxLength;
    data['validator_regex'] = validatorRegex;
    return data;
  }
}
