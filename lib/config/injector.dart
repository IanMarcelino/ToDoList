import 'package:auto_injector/auto_injector.dart';
import 'package:todolist/data/repositories/interface/remote_todo_repository.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/data/service/client/client_http.dart';
import 'package:todolist/data/service/client/client_http_todo.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<TodoRepository>(RemoteTodoRepository.new);
  injector.addSingleton(ClientHttp.new);
  injector.addSingleton(ClientHttpTodo.new);
  } 