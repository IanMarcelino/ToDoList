import 'package:result_dart/result_dart.dart';
import 'package:todolist/domain/dtos/todo_DTO.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  AsyncResult<Todo>addTodo(TodoDTO todoDTO); 
  AsyncResult<List<Todo>> getAllTodos();
  AsyncResult<Todo>updateTodo(int id, TodoDTO todoDTO);
  AsyncResult<Unit>deleteTodo(int id);   
  AsyncResult<Todo>completedTodo(int id); 
  
  void dispose();
  }