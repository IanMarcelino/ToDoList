import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:todolist/config/injector.dart';

import 'main.route.dart';
part 'main.g.dart';
void main() {
  setupDependencies();

  runApp(const Myapp());
}

@Main('lib/UI/') 
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.home,
        ),
    );
}
}