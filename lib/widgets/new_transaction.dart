import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: (titleController),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
              ),
              TextButton(
                onPressed: () {
                  addTx(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(primary: Colors.purple),
              ),
            ],
          ),
        ),
        elevation: 5,
      ),
    );
  }
}