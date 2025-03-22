import 'package:lucid_validation/lucid_validation.dart';
import 'package:todolist/domain/dtos/todo_DTO.dart';

class TaskValidator extends LucidValidator<TodoDTO> {
  TaskValidator() {
    ruleFor((t) => t.title, key: 'title')
    .notEmpty()
    .minLength(3);
  }

}
