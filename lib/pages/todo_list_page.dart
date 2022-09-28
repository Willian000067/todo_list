import 'package:flutter/material.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  // Codigo para pescar as tarefas digitadas.
  List<String> todos = [];
  // Escrever sempre em ingles Tarefas = Todos (to do(s)).
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
                          todos.add(text);
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
                      for (String todo in todos)
                        TodoListItem(
                          title:
                              todo, //parte da ligacao de pegar o que é digitado para salvar na lista.
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
                      onPressed: () {},
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
}
