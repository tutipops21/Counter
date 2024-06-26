import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:weartest/counter/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      child: const CounterPage(),
      builder: (context, mode, child) {
        return MaterialApp(
          title: 'Contador Werable',
          theme: ThemeData(
            visualDensity: VisualDensity.compact,
            colorScheme: mode == WearMode.active
                ? const ColorScheme.dark(
                    primary: Color(0xFF00B5FF),
                  )
                : const ColorScheme.dark(
                    primary: Colors.white24,
                    onBackground: Colors.white10,
                    onSurface: Colors.white10,
                  ),
          ),
          home: child,
        );
      },
    );
  }
}
