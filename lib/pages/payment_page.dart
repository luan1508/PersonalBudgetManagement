import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_budget_management/customwidgets/regexp_form_field.dart';
import 'package:personal_budget_management/data/payment.dart';

import '../customwidgets/date_picker.dart';
import '../customwidgets/required_text_form_field.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Payment payment=Payment.empty();

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




