import 'package:flutter/material.dart';
import 'package:configurator/widgets/pages/main_config_page.dart';
import 'package:configurator/widgets/pages/_debug_serial_comm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainConfigPage(),
    );
  }
}
