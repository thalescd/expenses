import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
  ];
  
  late Color _bgColor;

  @override
  void initState(){
    super.initState();
    int i = Random().nextInt(colors.length);
    _bgColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _bgColor,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$ ${widget.tr.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(widget.tr.title),
        subtitle: Text(
          DateFormat('dd/MM/y').format(widget.tr.date),
        ),
        trailing: IconButton(
          onPressed: () {
            widget.onRemove(widget.tr.id);
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
