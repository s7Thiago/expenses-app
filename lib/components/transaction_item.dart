import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.onRemove,
  }) : super(key: key);

  final Transaction transaction;
  final Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => onRemove(transaction.id),
                textColor: Theme.of(context).errorColor,
                label: Text('Delete'),
                icon: Icon(Icons.delete),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onRemove(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
