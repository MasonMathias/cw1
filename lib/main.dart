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
  int _imageIndex = 1;
  final List<String> _images = const [
    'https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn8XeZpoD0ScPkpnB0WFMtlbu6KevRzmizJw&s',
  ];

  void _toggleImage() => setState(() => _imageIndex = 1 - _imageIndex);

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
                  const SizedBox(height: 8),
                  
                  ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 160,
                    width: 280,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      transitionBuilder: (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                      child: Image.network(
                        _images[_imageIndex],
                        key: ValueKey(_images[_imageIndex]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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

                // Image toggle button
                FloatingActionButton(
                  onPressed: _toggleImage,
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
