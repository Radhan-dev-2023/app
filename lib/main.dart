import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/screens/bottom_navigation.dart';
import 'package:untitled6/screens/provider_class.dart';
import 'package:untitled6/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIns') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child:  MyApp(isLoggedIns: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIns;
  const MyApp({super.key, required this.isLoggedIns});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIns ? const bottom_Navigation():const SplashScreen(),
    );
  }
}
