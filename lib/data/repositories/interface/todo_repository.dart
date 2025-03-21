import 'package:result_dart/result_dart.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  AsyncResult<Todo>addTodo();
  AsyncResult<Todo>getAllTodos();
  AsyncResult<Todo>updateTodo();
  AsyncResult<Unit>deleteTodo();   
  AsyncResult<Todo>completedTodo(); 
}