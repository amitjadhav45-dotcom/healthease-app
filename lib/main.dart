import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override Widget build(BuildContext c) => MaterialApp(
    title: 'Healthease', debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
    home: const HomePage(),
  );
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Healthease')),
    body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.medical_services, size: 80, color: Theme.of(c).colorScheme.primary),
      Text('Healthease', style: Theme.of(c).textTheme.headlineLarge),
      Text('Healthcare Management System'),
      Text('v1.0.0 - Built on Codemagic'),
    ]),
  );
}