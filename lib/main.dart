import 'package:flutter/material.dart';
import 'package:study_group/ui/courses.dart';
import 'package:study_group/util/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: RouteGenerator.router.routeInformationProvider,
      routeInformationParser: RouteGenerator.router.routeInformationParser,
      routerDelegate: RouteGenerator.router.routerDelegate,
    );
  }
}
