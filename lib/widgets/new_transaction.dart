import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

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
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text('No Date Chosen!'),
                    TextButton(
                        style: TextButton.styleFrom(
                            primary: Theme.of(context).colorScheme.primary),
                        onPressed: () {},
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        elevation: 5,
      ),
    );
  }
}
