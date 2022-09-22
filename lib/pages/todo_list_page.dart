import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({Key? key}) : super(key: key);

  // Codigo para pegar o texto que a pessoa digitou (exemplo: email) e utilizar ele. Depois preciso incluir no SCAFFOLD.
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            //Essa linha abaixo serve para centralizar tudo no meio da tela 'horizontalmente'
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              ElevatedButton(
                onPressed: login,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Codigo para o botao 'entrar' funcionar
  void login() {
    print('Entrar');
  }
}
