import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view/tasks/tasks_route.dart';
import 'view/works/works_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          cardTheme: CardTheme(elevation: 5),
          textTheme: TextTheme(),
        ),
        initialRoute: TasksRoute.route,
        routes: {
          TasksRoute.route: (context) => TasksRoute(),
          WorksRoute.route: (context) => WorksRoute(),
        },
      ),
    );
  }
}
