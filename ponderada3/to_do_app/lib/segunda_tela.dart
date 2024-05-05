import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Task 1'),
              subtitle: const Text('Description for Task 1'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Task 2'),
              subtitle: const Text('Description for Task 2'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Task 3'),
              subtitle: const Text('Description for Task 3'),
            ),
          ),
          // Adicione mais Cards conforme necessário para as tarefas
        ],
      ),
    );
  }
}
