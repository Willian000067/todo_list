import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            4), //Para arredondar as bordas da lista de tarefas.
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start, //para deixar os itens fixado do lado esquerdo.
        children: [
          Text(
            '20/11/2015',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            'Tarefa 123',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
