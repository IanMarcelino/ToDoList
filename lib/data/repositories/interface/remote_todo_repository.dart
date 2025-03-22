import 'dart:async';
import 'package:result_dart/result_dart.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/data/service/client/client_http_todo.dart';
import 'package:todolist/domain/dtos/todo_DTO.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

class RemoteTodoRepository implements TodoRepository {
  final ClientHttpTodo _client;
  final _streamController = StreamController<Todo>.broadcast();

  RemoteTodoRepository(this._client);

  @override
  AsyncResult<Todo> addTodo(TodoDTO todoDTO) {
    return _client.addTodo(todoDTO);
  }

  @override
  AsyncResult<Todo> completedTodo(int id) {
    return _client.completedTodo(id);
  }

  @override
  AsyncResult<Unit> deleteTodo(int id) {
    return _client.deleteTodo(id);
  }

  @override
  AsyncResult<List<Todo>> getAllTodos() {
    return _client.getAllTodos();
  }

  @override
  AsyncResult<Todo> updateTodo(int id, TodoDTO todoDTO) {
    return _client.updateTodo(id, todoDTO);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
