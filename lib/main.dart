import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './widgets/chart.dart';

import './models/transaction.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

/*class MyHomePage extends StatelessWidget {
  final titleController=TextEditingController();
  final amountController=TextEditingController();
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bctx){
      return NewTransaction();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {}
            )
        ],
      ),
      body: SingleChildScrollView(child:
      Column(
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              width: double.infinity,
              child: Text('CHART'),
            ),
          ),
          UserTransaction(),
        ],
       ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}
        )
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions=[
   //Transaction(id: 'shoe', title: 'shoe', amount: 1204, date: DateTime.now())
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(
          Duration(days:7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txtitle,double amount,DateTime chosenDate) {
    final newTx=Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: amount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }
  void _startAddNewTransaction(BuildContext ctx) {
    print("context 1");
    print(ctx);
    showModalBottomSheet(context: ctx, builder: (bctx){
      print("context 2");
      print(bctx);
      return NewTransaction(_addNewTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx){
        return  tx.id==id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("inside build");
    print("recent transaction");
    print(_recentTransactions);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(context);
              }
            )
        ],
      ),
      body: SingleChildScrollView(child:
      Column(
        children: [
         Chart(_recentTransactions),
          TransactionList(_userTransactions,_deleteTransaction),
        ],
       ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
          }
        )
    );
  }
}
