import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';
class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  /*final List<Transaction> _userTransactions=[
    Transaction(id:'t1',title:'shoe',amount:50,date: DateTime.now()),
    Transaction(id:'t2',title:'grocerry',amount:30,date: DateTime.now())
  ];

  void _addNewTransaction(String txtitle,double amount) {
    final newTx=Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: amount,
      date: DateTime.now()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}