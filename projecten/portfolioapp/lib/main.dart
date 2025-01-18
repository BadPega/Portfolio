import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BasicApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NextApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentScreenIndex = 0;

  // Define screens for NavigationBar
  final screens = [
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        children: <Widget>[
          ClipImage("assets/images/builder.png"), // Display image for Home
          SizedBox(height: 20), // Add spacing between image and text
          Text(
            'werkzaamheden', // Add text for Home
            style: TextStyle(fontSize: 30), // Style the text
          ),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipImage("assets/images/flutter.png"), // Display image for Favorites
          SizedBox(height: 20),
          Text(
            'Ik leer flutter',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
    Center( // Explore screen with an image
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipImage("assets/images/dart.png"), // Display image for Explore
          SizedBox(height: 20),
          Text(
            'Explore Dart en flutter',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/maps_placeholder.png', // Replace this with your map image
            height: 200, // Adjust height
            width: 300,  // Adjust width
            fit: BoxFit.cover, // Adjust fit
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 225, 246),
        title: Text(widget.title),
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
      ),
      body: screens[currentScreenIndex], // Display selected screen
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 18), // Adjusted font size
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentScreenIndex = index;
            });
          },
          selectedIndex: currentScreenIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
          ],
        ),
      ),
    );
  }
}

// ClipImage widget class
class ClipImage extends StatelessWidget {
  final String _assetPath;

  const ClipImage(this._assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(72), // Adjust size as needed
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
