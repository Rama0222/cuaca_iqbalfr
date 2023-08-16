import 'package:flutter/material.dart';

import 'list_cuaca.dart';

void main() {
  runApp(const MyCuaca());
}

class MyCuaca extends StatelessWidget {
  const MyCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perkiraan Cuaca IFR',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListCuaca();
  }
}
