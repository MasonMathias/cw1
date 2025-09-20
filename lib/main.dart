import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  int _counter = 0;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {

    final light = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
    );

    final dark = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(),
    );

    return MaterialApp(
      title: 'CW1',
      theme: light,
      darkTheme: dark,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,

      home: Builder(
        builder: (context) {
          return Scaffold(

            appBar: AppBar(
              title: const Text('CW1'),
            ),

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have pushed the button this many times:',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            floatingActionButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Increment Button
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 12),

                // Light / Dark button
                FloatingActionButton(
                  onPressed: _toggleTheme,
                  tooltip: 'Toggle theme',
                  child: Icon(
                    _themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                ),
                const SizedBox(width: 12),

                FloatingActionButton(
                  onPressed: () => print('toggled image'),
                  tooltip: 'Toggle image',
                  child: const Icon(Icons.image),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
