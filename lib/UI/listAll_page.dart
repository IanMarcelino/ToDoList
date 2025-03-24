import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todolist/UI/View/list_controller.dart';
import 'package:todolist/config/injector.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

class ListTodoPage extends StatefulWidget {
  const ListTodoPage({super.key});

  @override
  State<ListTodoPage> createState() => _ListTodoPageState();
}

class _ListTodoPageState extends State<ListTodoPage> {
  late ListController _controller;
  late Future<Result<List<Todo>>> _futureTodos;

  @override
  void initState() {
    super.initState();
    _controller = injector.get<ListController>();
    _futureTodos = _controller.loadTodos();
  }

  Future<void> _refreshTodos() async {
    setState(() {
      _futureTodos = _controller.loadTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar Todos'),
      ),
      body: FutureBuilder<Result<List<Todo>>>(
        future: _futureTodos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            return snapshot.data!.fold(
              (todos) {
                if (todos.isEmpty) {
                  return const Center(child: Text('Nenhum Todo encontrado.'));
                }
                return RefreshIndicator(
                  onRefresh: _refreshTodos,
                  child: Center(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return ListTile(
                          title: Text(todo.title),
                          subtitle: Text('ID: ${todo.id}'),
                          
                        );
                      },
                    ),
                  ),
                );
              },
              (error) => Center(child: Text('Erro ao carregar: ${error.toString()}')),
            );
          }
          return const Center(child: Text('Nenhum dado disponível'));
        },
      ),
    );
  }
}