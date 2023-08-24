import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/favorite_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/cart_details.dart';
import 'pages/favorite_screen.dart';
import 'pages/home_screen.dart';
import 'pages/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          title: 'CR Tech',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: Colors.pink,
            scaffoldBackgroundColor: Colors.grey.shade100,
          ),
          home: const HomePage(),
        ),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CR Tech"), //nome loja
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartDetails(),
              ),
            ),
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);},
        selectedItemColor: Color(0xFFD23066),
        unselectedItemColor: Color(0xFFA2A2A2),
        items: const [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favoritos",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Perfil",
            icon: Icon(Icons.person),
          ),
        ],
      ), //BottomNavigantionBar
    );
  }
}
