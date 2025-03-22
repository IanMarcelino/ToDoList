import 'package:flutter/cupertino.dart';
import 'package:todolist/config/injector.dart';

void main() {
  setupDependencies();

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  
}
}