import 'package:result_dart/result_dart.dart';
import 'package:todolist/data/service/client/client_http.dart';
import 'package:todolist/domain/dtos/todo_DTO.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

class ClientHttpTodo{
  final ClientHttp _clientHttp;
  final String _baseUrl = '/todo';

  ClientHttpTodo(this._clientHttp);

   AsyncResult<Todo> addTodo(TodoDTO todoDTO) async {
    final result = await _clientHttp.post(_baseUrl, todoDTO.toJson());

    return result.map((response) {
      final data = response.data;
      return Todo.fromJson(data);
    });
  }

    AsyncResult<List<Todo>> getAllTodos() async {
    final result = await _clientHttp.get(_baseUrl);

    return result.map((response) {
      final List<dynamic> list = response.data;
      return list.map((item) => Todo.fromJson(item)).toList();
    });
  }

  AsyncResult<Todo> updateTodo(int id, TodoDTO todoDTO) async {
    final result = await _clientHttp.patch('$_baseUrl/$id', todoDTO.toJson());

    return result.map((response) {
      final data = response.data;
      return Todo.fromJson(data);
    });
  }

  AsyncResult<Unit> deleteTodo(int id) async {
    final result = await _clientHttp.delete('$_baseUrl/$id');

    return result.map((response) => unit);
  }

  AsyncResult<Todo> completedTodo(int id) async {
    final result = await _clientHttp.patch('$_baseUrl/$id', {'completed': true});

    return result.map((response) {
      final data = response.data;
      return Todo.fromJson(data);
    });
  }


}