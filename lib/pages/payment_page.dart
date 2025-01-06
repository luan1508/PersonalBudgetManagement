import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_budget_management/customwidgets/regexp_form_field.dart';
import 'package:personal_budget_management/data/payment.dart';
import 'package:personal_budget_management/data/payment_category.dart';

import '../customwidgets/required_text_form_field.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  Payment payment = Payment.empty();
  PaymentCategory? _selectedCategory;
  DateTime? _selectedDate;

  // Funktion zum Anzeigen des DatePickers
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2028),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        payment.date = pickedDate; // Datum im Payment-Objekt speichern
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          RequiredTextFormField(
            decoratorText: "Payment Reason",
            errorMsg: "Please type in a reason for your payment",
            onSave: (value) {
              payment.reason = value!;
            },
          ),
          const SizedBox(height: 16),
          // TextFormField für den DatePicker ohne hintText
          TextFormField(
            readOnly: true, // Macht das Feld nur anklickbar, keine manuelle Eingabe
            decoration: InputDecoration(
              labelText: "Datum auswählen",
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            controller: TextEditingController(
              text: _selectedDate == null
                  ? null
                  : "${_selectedDate!.toLocal()}".split(' ')[0],
            ),
            onTap: () => _selectDate(context),
            validator: (value) {
              if (_selectedDate == null) {
                return "Bitte ein Datum auswählen";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          RequiredTextFormField(
            decoratorText: "Amount",
            errorMsg: "Please type in the amount you spent",
            onSave: (value) {
              payment.amount = double.tryParse(value!) ?? 0.0;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<PaymentCategory>(
            decoration: const InputDecoration(labelText: 'Payment Category'),
            value: _selectedCategory,
            items: const <DropdownMenuItem<PaymentCategory>>[
              DropdownMenuItem<PaymentCategory>(
                value: PaymentCategory.EDUCATION,
                child: Text("Cash"),
              ),
              DropdownMenuItem<PaymentCategory>(
                value: PaymentCategory.ENTERTAINMENT,
                child: Text("Creditcard"),
              ),
              DropdownMenuItem<PaymentCategory>(
                value: PaymentCategory.FOOD_AND_DRINKS,
                child: Text("Debitcard"),
              ),
              DropdownMenuItem<PaymentCategory>(
                value: PaymentCategory.TRANSPORT,
                child: Text("Transport"),
              ),
            ],
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue;
                payment.category = newValue!;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Bitte eine Option auswählen';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print(payment);
              }
            },
            child: const Text("Personendaten speichern"),
          ),
        ],
      ),
    );
  }
}
