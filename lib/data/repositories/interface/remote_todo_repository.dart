import 'package:result_dart/src/types.dart';
import 'package:result_dart/src/unit.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

class RemoteTodoRepository implements TodoRepository {
  @override
  AsyncResult<Todo> addTodo() {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  AsyncResult<Todo> completedTodo() {
    // TODO: implement completedTodo
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> deleteTodo() {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  AsyncResult<Todo> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  @override
  AsyncResult<Todo> updateTodo() {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}