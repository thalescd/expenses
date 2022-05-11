import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  final void Function(String) onRemove;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text('No transaction registered.'),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
