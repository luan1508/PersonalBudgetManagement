import 'package:personal_budget_management/data/payment_category.dart';
import 'package:personal_budget_management/data/payment_method.dart';

class Payment {
  String? reason;
  DateTime? date;
  double? amount;
  PaymentCategory? category;
  PaymentMethod? paymentMethod;

  Payment.empty();

  Payment(
  {required this.reason, required this.date, required this.amount, required this.category, required this.paymentMethod});

  @override
  String toString() {
    return 'Payment{reason: $reason, date: $date, amount: $amount, category: $category, paymentMethod: $paymentMethod}';
  }
}