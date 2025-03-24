import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:todolist/UI/View/add_controller.dart';
import 'package:todolist/UI/View/delete_controller.dart';
import 'package:todolist/UI/View/list_controller.dart';
import 'package:todolist/UI/View/update_controller.dart';
import 'package:todolist/data/repositories/interface/remote_todo_repository.dart';
import 'package:todolist/data/repositories/interface/todo_repository.dart';
import 'package:todolist/data/service/client/client_http.dart';
import 'package:todolist/data/service/client/client_http_todo.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton(() => Dio(BaseOptions(
    baseUrl: 'http://localhost:3000', ))); 
  injector.addSingleton(ClientHttp.new);
  injector.addSingleton(ClientHttpTodo.new);
  injector.addSingleton<TodoRepository>(RemoteTodoRepository.new);
  injector.addSingleton<AddController>(AddController.new);
  injector.addSingleton<ListController>(ListController.new);
  injector.addSingleton<UpdateController>(UpdateController.new);
  injector.addSingleton<DeleteController>(DeleteController.new);
  injector.commit(); 
}