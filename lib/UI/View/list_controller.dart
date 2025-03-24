import 'package:result_dart/result_dart.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

class ListController {
  final TodoRepository _todoRepository;

  ListController(this._todoRepository);

  Future<Result<List<Todo>>> loadTodos() async {
    final result = await _todoRepository.getAllTodos();
    return result;
  }
}
