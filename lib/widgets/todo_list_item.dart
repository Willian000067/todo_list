import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      height: 120,
      child: Column(
        children: [
          Text('20/11/2015'),
          Text('Tarefa 123'),
        ],
      ),
    );
  }
}
