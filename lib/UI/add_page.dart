import 'package:flutter/material.dart';
import 'package:todolist/UI/View/add_controller.dart';
import 'package:todolist/config/injector.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  
  final _titleController = TextEditingController();
  final _controller = injector.get<AddController>();

  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    setState(() => _isLoading = true);

    final title = _titleController.text;
    final result = await _controller.submitTodo(title);

    result.fold(
      (todo) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Todo adicionado com sucesso!')),
        );
        Navigator.pop(context);
      },
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      },
    );

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(24),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Título da Tarefa',
                    border: OutlineInputBorder(),
                  ),
                  enabled: !_isLoading,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSubmit,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          )
                        : const Text('Adicionar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}