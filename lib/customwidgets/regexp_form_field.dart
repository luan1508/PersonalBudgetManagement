import 'package:flutter/material.dart';

class RegExpFormField extends StatelessWidget {

  final void Function(String?)? onSave;

  String decoratorText;
  String regExp;
  String errorMsg;

  RegExpFormField({
    super.key,
    required this.decoratorText,
    required this.regExp,
    required this.errorMsg,
    required this.onSave
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: this.decoratorText),
      validator: (value) {
        if( value==null ||
            value.isEmpty ||
            !RegExp(this.regExp).hasMatch(value)) {

          return this.errorMsg;
        }
        return null;
      },
      onSaved: onSave,
    );
  }
}