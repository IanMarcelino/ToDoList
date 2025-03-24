import 'package:result_dart/result_dart.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';

class DeleteController {
  final TodoRepository _todoRepository;

  DeleteController(this._todoRepository);

  AsyncResult<Unit> _deleteTodo(int id) {
    return _todoRepository.deleteTodo(id);
  }

  Future<Result<Unit>> submitDelete(String idText) async {
    final id = int.tryParse(idText);
    if (id == null) {
      return Failure(Exception('ID inválido'));
    }
    final result = await _deleteTodo(id);
    return result;
  }
}
