import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List transactions;
  final Function  deleteTx;
  TransactionList(this.transactions,this.deleteTx);
  @override
  Widget build(BuildContext context) {
      return transactions.isEmpty ? LayoutBuilder(builder: (ctx,constraints) {
        return Column(
          children: [
            Text('No transaction added yet',style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              height: 100,
            ),
            Container(
              height: constraints.maxHeight*0.5,
              child:Image.asset('assets/images/waiting.png',fit: BoxFit.cover,),
           )  
          ],
        );
      })  : ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('Rs${transactions[index].amount.toStringAsFixed(2)}'),
                  ),
                )
             ),
              title: Text(transactions[index].title,
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: (){
                  deleteTx(transactions[index].id);
                }
              ),
            ),
          );
        },
        itemCount: transactions.length,
      );
  }
}

/*Column(
            children:
              transactions.map((tx){
                return Card(
                  child: Row(
                    children:[
                      Container(
                        margin: EdgeInsets.symmetric(vertical:10,horizontal:15),
                        child: Text('Rs ${tx.amount.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                            )
                        ),
                        decoration: BoxDecoration(border:Border.all(width: 2,color: Colors.purple)),
                        padding:EdgeInsets.symmetric(vertical:10,horizontal:10)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tx.title,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat.yMMMd().format(tx.date)),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
          );*/


/*
Card(
                  child: Row(
                    children:[
                      Container(
                        margin: EdgeInsets.symmetric(vertical:10,horizontal:15),
                        child: Text('Rs ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark,
                            )
                        ),
                        decoration: BoxDecoration(border:Border.all(width: 2,color: Theme.of(context).primaryColor)),
                        padding:EdgeInsets.symmetric(vertical:10,horizontal:10)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat.yMMMd().format(transactions[index].date)),
                        ],
                      )
                    ],
                  ),
                );
*/