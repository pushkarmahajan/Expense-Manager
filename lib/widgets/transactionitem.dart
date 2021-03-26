import 'package:flutter/material.dart';
import 'package:expense_manager/model/transactions.dart';;
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deletetx,
  }) : super(key: key);

  final Transactions transaction;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          child: Text('\$ ${transaction.amount}'),
          radius: 30,
        ),
        title: Text(
          '${transaction.title}',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
            DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
            onPressed: () => deletetx(transaction.id),
            icon: Icon(Icons.delete),
            label: Text('Delete'))
            : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deletetx(transaction.id),
        ),
      ),
    );
  }
}