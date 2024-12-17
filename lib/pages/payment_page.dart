import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_budget_management/customwidgets/regexp_form_field.dart';
import 'package:personal_budget_management/data/payment.dart';
import 'package:personal_budget_management/data/payment_category.dart';

import '../customwidgets/date_picker.dart';
import '../customwidgets/required_text_form_field.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Payment payment=Payment.empty();
  PaymentCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final _formKey=GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child:Column(
        children: [
          RequiredTextFormField(
            decoratorText: "Payment Reason",
            errorMsg: "Please type in a reason for your payment",
            onSave: (value) {
              payment.reason=value!;
            },
          ),
          const SizedBox(height: 16),
          // DatePicker Widget
          DatePicker(),
          const SizedBox(height: 16),
          RequiredTextFormField(
            decoratorText: "Amount",
            errorMsg: "Please type in the amount you spent",
            onSave: (value) {
              payment.reason=value!;
            },
          ),
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
                child: Text("Debitcard"),
              )
          ],
          onChanged: (newValue) {
              payment.category = newValue!;
          },
          validator: (value) {
              if (value == null) {
              return 'Bitte eine Option auswählen';
              }
              return null;
              },
            ),
              ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(payment);
                }
              },
              child: Text("Personendaten speichern"))
        ],
      )
    );

  }

}




