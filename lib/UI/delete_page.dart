import 'package:flutter/material.dart';
import 'package:todolist/UI/View/delete_controller.dart';
import 'package:todolist/config/injector.dart';

class DeleteTodoPage extends StatefulWidget {
  const DeleteTodoPage({super.key});

  @override
  State<DeleteTodoPage> createState() => _DeleteTodoPageState();
}

class _DeleteTodoPageState extends State<DeleteTodoPage> {
  final _idController = TextEditingController();
  final _controller = injector.get<DeleteController>();
  bool _isLoading = false;

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  void _handleDelete() async {
    setState(() => _isLoading = true);

    final idText = _idController.text;
    final result = await _controller.submitDelete(idText);

    result.fold(
      (unit) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Todo removido com sucesso!')),
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
        title: const Text('Deletar Todo'),
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
                    labelText: 'ID do Todo que deseja deletar',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  enabled: !_isLoading,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleDelete,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          )
                        : const Text('Deletar Todo'),
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