import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/domain/dtos/todo_DTO.dart';
import 'package:todolist/domain/entities/todo_entity.dart';
import 'package:todolist/domain/validators/task_validator.dart';

class AddController {
  final TodoRepository _todoRepository;
  final TaskValidator _validator = TaskValidator();

  AddController(this._todoRepository);

  late final addCommand = Command1<Todo, TodoDTO>(_addTodo);

  AsyncResult<Todo> _addTodo(TodoDTO todoDTO) {
    return _todoRepository.addTodo(todoDTO);
  }

  Future<Result<Todo>> submitTodo(String title) async {
    final todoDTO = TodoDTO(title: title.trim());

    final validation = _validator.validate(todoDTO);
    if (!validation.isValid) {
      return Failure(Exception('Erro de validação'));
    }

    final result = await _addTodo(todoDTO);
    return result;
  }
}
