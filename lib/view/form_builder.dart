import 'package:flutter/material.dart';

import '../models/custom_form_field.dart';
import 'input.dart';

class FormBuilder extends StatefulWidget {
  final bool showLabel;
  final double labelSpacing;
  final double widgetSpacing;
  final List<CustomFormField>? formFields;

  const FormBuilder({
    Key? key,
    this.showLabel = false,
    this.labelSpacing = 10,
    this.widgetSpacing = 20,
    this.formFields,
  }) : super(key: key);

  @override
  createState() => _FormBuilderState();
}

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget verticalSpace(double height) => SizedBox(height: height);
Widget horizontalSpace(double width) => SizedBox(width: width);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

class _FormBuilderState extends State<FormBuilder> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    for (var field in widget.formFields!) {
      widgetList.addAll(_buildWidgetItem(field));

      // Add the padding if it's not last item
      if (widget.formFields!.isNotEmpty) {
        if (widget.formFields!.last.label != field.label) {
          widgetList.add(verticalSpace(field.spacing ?? 0));
        } else {
          widgetList.add(verticalSpace(5));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }

  List<Widget> _buildWidgetItem(CustomFormField field) {
    List<Widget> lWidget = [];

    if (widget.showLabel) {
      lWidget.addAll([
        Padding(
          padding: field.padding!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                field.label,
                style: TextStyle(
                  fontSize: field.fontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              field.labelAction != null ? field.labelAction! : Container(),
            ],
          ),
        ),
        verticalSpace(widget.labelSpacing),
      ]);
    }

    // Add the form field
    switch (field.type) {
      case FormFieldType.input:
        lWidget.add(
          Padding(
            padding: field.padding!,
            child: Input(
              borderRadius: field.borderRadius,
              showLabel: field.showLabel!,
              label: field.label,
              textStyle: field.textStyle?.copyWith(fontSize: field.fontSize),
              fontSize: field.fontSize,
              hintText: field.hintText,
              validator: field.validator,
              onSaved: field.onSaved,
              inputType: field.inputType,
              maxLength: field.maxLength,
              minLines: field.minLines ?? 1,
              maxLines: field.maxLines ?? 1,
              keyboardAction: field.keyboardAction ?? TextInputAction.next,
              focusNode: field.focusNode,
              onFieldSubmitted: field.onFieldSubmitted ?? (_) {},
              obscureText: field.obscureText!,
              prefixIcon: field.prefix,
              suffixIcon: field.suffix,
              showBorder: field.showBorder,
              textController: field.controller,
              readOnly: field.readOnly!,
              fullBorder: field.fullBorder ?? true,
              labelColor: field.labelColor,
              textColor: field.textColor,
              onTap: field.onTap ?? () {},
              filled: field.filled,
              fillColor: field.fillColor ?? Colors.white,
              enabled: field.enabled ?? true,
              enabledBorderColor:
                  field.enabledBorderColor ?? Colors.transparent,
              borderColor: field.borderColor ?? Colors.grey,
              onChanged: field.onChanged,
              inputFormatters: field.inputFormatters ?? [],
            ),
          ),
        );
        break;

      default:
        lWidget.add(
          const Center(
            child: Text(
              "Unhandled Form Field Type",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        );
        break;
    }

    return lWidget;
  }
}
