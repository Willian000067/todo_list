import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  // Codigo para pescar as tarefas digitadas.

  List<Todo> todos = [];
  // Escrever sempre em ingles Tarefas = Todos (to do(s)).
  Todo? deletedTodo;
  int? deletedTodoPos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      //O expanded ajuda a deixar o widget ocupando todo espaco disponivel.
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText:
                              'Adicionar sua tarefa!', //Esse comando serve para deixar uma dica para o usuario.
                        ),
                      ),
                    ),

                    SizedBox(
                        width:
                            8), // Para separa um componente do outro com um espaço no meio.

                    ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                        });
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.all(14),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 16,
                ), // Esse codigo serve para realizar o afastamento na VERTICAL.

                Flexible(
                  child: ListView(
                    shrinkWrap:
                        true, // Esse comando serve para deixar a lista mais enxuta possivel.
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete:
                              onDelete, //parte da ligacao de pegar o que é digitado para salvar na lista.
                        ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                Row(
                  children: [
                    Expanded(
                      // Expanded serve para fazer com que o componente utilize o maior espaco possivel.
                      child: Text(
                        'Voce possui ${todos.length} tarefas pendentes!',
                      ),
                    ),

                    SizedBox(
                        width:
                            8), // Para separa um componente do outro com um espaço no meio.

                    ElevatedButton(
                      onPressed: showDeleteTodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.all(14),
                      ),
                      child: Text(
                        'Limpar tudo',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi remolvida com sucesso!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo?'),
        content: Text('Voce tem certeza?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Para apenas fechar o a caixa de diagolo sem nenhuma acao.
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deletedAllTodos();
            },
            style: TextButton.styleFrom(primary: Colors.red),
            child: Text('Limpar tudo'),
          ),
        ],
      ),
    );
  }

  void deletedAllTodos() {
    setState(() {
      todos.clear();
    });
  }
}
