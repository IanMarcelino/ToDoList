import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/domain/dtos/todo_DTO.dart';
import 'package:todolist/domain/entities/todo_entity.dart';
import 'package:todolist/domain/validators/task_validator.dart';

class UpdateController {
  final TodoRepository _todoRepository;
  final TaskValidator _validator = TaskValidator();

  UpdateController(this._todoRepository);

  late final updateCommand = Command1<Todo, TodoDTO>(_updateTodo);

  AsyncResult<Todo> _updateTodo(TodoDTO todoDTO) {
    return _todoRepository.updateTodo(todoDTO.id, todoDTO);
  }

  Future<Result<Todo>> submitUpdate(String idText, String title, bool completed) async {
    final id = int.tryParse(idText);
    if (id == null) {
      return Failure(Exception('ID inválido'));
    }
    final todoDTO = TodoDTO(id: id, title: title.trim(), completed: completed);

    final validation = _validator.validate(todoDTO);
    if (!validation.isValid) {
      return Failure(Exception('Erro de validação'));
    }

    final result = await _updateTodo(todoDTO);
    return result;
  }
}