import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    Key key,
    this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    'No transactions',
                    style: Theme.of(context).appBarTheme.textTheme.headline6,
                  ),
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];

                return Card(
                  elevation: .7,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('R\$ ${transaction.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).appBarTheme.textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(transaction.date),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
