import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              4), //Para arredondar as bordas da lista de tarefas.
          color: Colors.grey[200],
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //para corrigir o problema de espaco sobrando e se eu quiser deixar o item a esquerda, deve usar start ao inves de stretch.
          children: [
            Text(
              DateFormat('dd/MM/yyyy - HH:mm')
                  .format(todo.dateTime), //para formatar dd/mm/yyyy
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      actionExtentRatio:
          0.25, //para retirar a parte branca que fica do botao deleter com a tarefas escrita.
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {},
        )
      ],
    );
  }
}
