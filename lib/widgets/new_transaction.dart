import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
/*class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController=TextEditingController();
  final amountController=TextEditingController();
  NewTransaction(this.addTx);
  void submitData() {
    String enteredTitle=titleController.text;
    double amount=double.parse(amountController.text);
    if(enteredTitle==''||amount<=0) {
      return;
    }
    addTx(enteredTitle,amount);
  }
  @override
  Widget build(BuildContext context) {
    return  Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    onSubmitted: (_){
                      submitData();
                    },
                  ),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_){
                      submitData();
                    },
                  ),
                  FlatButton(
                    onPressed: submitData,
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                  ),
                ],
              )
            ),
          );
  }
}*/
class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //final Function addTx;
  final titleController=TextEditingController();
  final amountController=TextEditingController();
  DateTime _selectedDate;
  void submitData() {
    String enteredTitle=titleController.text;
    double amount=double.parse(amountController.text);
    if(enteredTitle==''||amount<=0|| _selectedDate==null) {
      return;
    }
    widget.addTx(enteredTitle,amount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now()
    ).then((pickedDate){
        if(pickedDate ==null) {
          return;
        }
        setState(() {
          _selectedDate=pickedDate;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    print("new transaction build context");
    print(context);
    return  Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    onSubmitted: (_){
                      submitData();
                    },
                  ),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_){
                      submitData();
                    },
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child:Text (_selectedDate==null ? ('No Date Chosen') : DateFormat.yMd().format(_selectedDate)),
                        ),                        
                        FlatButton(
                          textColor: Colors.purple,
                          onPressed: _presentDatePicker,
                          child: Text(
                            'choose Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: submitData,
                      child: Text('Add Transaction'),
                     textColor: Colors.purple,
                     ),
                  )
                ],
              )
            ),
          );
  }
}