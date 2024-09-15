import 'package:flutter/material.dart';
import 'package:moneytracker/controller/transactions_provider.dart';
import 'package:moneytracker/model/transaction.dart';
import 'package:provider/provider.dart';

class Transactionslist extends StatelessWidget {
  const Transactionslist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionsProvider>(context).transactions;
    
    return Expanded(
      child: Container(
      // height:  200, con el expanded esta altura ya dejaría de tener sentido.
        decoration: const BoxDecoration(
          color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) { 
          final transaction = transactions[index];
          final type = transaction.type == TransactionType.Income
              ? 'Income'
              : 'Expense';
          final value = transaction.type == TransactionType.Expense
              ? '- € ${transaction.amount.abs().toStringAsFixed(2)}'
              :'+ € ${transaction.amount.toStringAsFixed(2)}';

          final color = transaction.type == TransactionType.Expense
              ? Colors.red
              : Colors.green;
          return ListTile (
          title: Text(transaction.description),
          subtitle: Text(type),  
          trailing: Text(value, style: TextStyle(fontSize: 14, color: color),

          ),
          ); 
        }),
        
          // ListTile(
          //   leading: Icon(Icons.attach_money,color: Colors.teal),
          //   title: Text('Income'),
          //   subtitle: Text('Salary € 1.000,00'),
          //   trailing: Text('€1.000,00',
          //   style: TextStyle(fontSize: 15)),
          // ),
          // ListTile(
          //   leading: Icon(Icons.money_off, color: Colors.red),
          //   title: Text('Expense'),
          //   subtitle: Text('Rent €-500.00'),
          //   trailing: Text('€-500',
          //   style: TextStyle(fontSize: 15)),
          // )
        
        )
      );
    
  }
}
