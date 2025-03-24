import 'package:flutter/material.dart';
import 'package:todolist/UI/View/update_controller.dart';
import 'package:todolist/config/injector.dart';

class UpdateTodoPage extends StatefulWidget {
  const UpdateTodoPage({super.key});

  @override
  State<UpdateTodoPage> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _controller = injector.get<UpdateController>();

  bool _isLoading = false;
  bool _completed = false; 

  @override
  void dispose() {
    _idController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _handleUpdate() async {
    setState(() => _isLoading = true);

    final idText = _idController.text;
    final title = _titleController.text;
    final result = await _controller.submitUpdate(idText, title, _completed);

    result.fold(
      (todo) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Todo atualizado com sucesso!')),
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
        title: const Text('Atualizar Todo'),
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
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: 'ID do Todo',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  enabled: !_isLoading,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Novo Título',
                    border: OutlineInputBorder(),
                  ),
                  enabled: !_isLoading,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Concluído:'),
                    Switch(
                      value: _completed,
                      onChanged: (value) {
                        setState(() {
                          _completed = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleUpdate,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          )
                        : const Text('Atualizar Todo'),
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