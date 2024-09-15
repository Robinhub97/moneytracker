import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      type: TransactionType.Income,
      amount: 1000.00,
      description: 'Salary',
    ),
    Transaction(
      type: TransactionType.Expense,
      amount: -500.00,
      description: 'Rent',
    ),
  ];

  List<Transaction> get transactions => _transactions;

  double getTocalIncomes() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.Income)
        .map((transaction) => transaction.amount)
        .fold(0,(a,b) => a+b);  
  }

  double getBalance() {return _transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);}

  double getIncomes() {return _transactions
      .where((transaction) => transaction.type == TransactionType.Income)
      .fold(0.0, (sum, transaction) => sum + transaction.amount);}

  double getTotalExpenses() {return _transactions
      .where((transaction) => transaction.type == TransactionType.Expense)
      .fold(0.0, (sum, transaction) => sum + transaction.amount);}

  void addTransaction(transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
