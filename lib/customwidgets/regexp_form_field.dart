import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

class RegExpFormField extends StatelessWidget {


  final DateTime date=DateTime.now();

  String errorMsg;

  RegExpFormField({
    super.key,
    required this.errorMsg,
  });

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime(2023, 12, 31),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: this.date.toString()),
      validator: (value) {
        if( value==null ||
            value.isEmpty) {

          return this.errorMsg;
        }
        return null;
      },
      onTap: () => _showDatePicker(context),
    );
  }
}