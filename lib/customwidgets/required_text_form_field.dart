import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequiredTextFormField extends StatelessWidget {

  final void Function(String?)? onSave;

  String decoratorText;
  String errorMsg;

  RequiredTextFormField({
    super.key,
    required this.decoratorText,
    required this.errorMsg,
    required this.onSave
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: this.decoratorText,
        ),
        validator: (value) {
          if(value==null || value.isEmpty) {
            return this.errorMsg;
          }
        },
        onSaved: onSave,
    );
  }
}