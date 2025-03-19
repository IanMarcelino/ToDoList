import 'package:lucid_validation/lucid_validation.dart';
import 'package:todolist/domain/dtos/TodoDTO.dart';

class TaskValidator extends LucidValidator<TodoDTO> {
  TaskValidator() {

    ruleFor((t) => t.title, key: 'title')
    .notEmpty()
    .minLength(3);

    ruleFor((t) => t.description, key: 'description')
    .notEmpty() 
    .minLength(6);
  }

}
