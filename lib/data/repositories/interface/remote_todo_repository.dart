import 'dart:async';

import 'package:result_dart/src/types.dart';
import 'package:result_dart/src/unit.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/domain/dtos/TodoDTO.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

class RemoteTodoRepository implements TodoRepository {

  final _streamController = StreamController<Todo>.broadcast();

  @override
  AsyncResult<Todo> addTodo(TodoDTO todoDTO) {
    
    throw UnimplementedError();
  }

  @override
  AsyncResult<Todo> completedTodo(int id) {
    // TODO: implement completedTodo
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<Todo>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  @override
  AsyncResult<Todo> updateTodo(int id, TodoDTO todoDTO) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
  
  @override
  void dispose() {
    _streamController.close(); 
  }
 
}