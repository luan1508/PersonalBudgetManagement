import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {

  DateTime? _selectedDate;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: "Payment Date",
            hintText: _selectedDate == null
                ? "No date selected"
                : _selectedDate!.toLocal().toString().split(' ')[0],
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          validator: (value) {
            if (_selectedDate == null) {
              return "Please select a payment date";
            }
            return null;
          },
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
  }

}