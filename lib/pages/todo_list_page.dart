import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                //O expanded ajuda a deixar o widget ocupando todo espaco disponivel.
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adicione uma tarefa',
                    hintText:
                        'Ex.: Estudar', //Esse comando serve para deixar uma dica para o usuario.
                  ),
                ),
              ),
              SizedBox(
                  width:
                      8), // Para separa um componente do outro com um espaço no meio.
              ElevatedButton(
                onPressed: () {},
                child: Text('+'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
