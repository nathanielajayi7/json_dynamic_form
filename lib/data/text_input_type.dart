import 'package:flutter/cupertino.dart';

class AppTextInputType extends TextInputType {
  const AppTextInputType.numberWithOptions() : super.numberWithOptions();

  static const List<String> _names = <String>[
    'text',
    'multiline',
    'number',
    'phone',
    'datetime',
    'emailAddress',
    'url',
    'visiblePassword',
    'name',
    'address',
    'none',
  ];

  // Enum value name, this is what enum.toString() would normally return.
  String get _name => _names[index];


  @override
  String toString() {
    return _name;
  }

  static const Map<String, TextInputType> values = <String, TextInputType>{
    "text": TextInputType.text,
    "multiline": TextInputType.multiline,
    "number": TextInputType.number,
    "phone": TextInputType.phone,
    "datetime": TextInputType.datetime,
    "emailAddress": TextInputType.emailAddress,
    "url": TextInputType.url,
    "visiblePassword": TextInputType.visiblePassword,
    "name": TextInputType.name,
    "streetAddress": TextInputType.streetAddress,
    "none": TextInputType.none,
  };
}
