import 'package:flutter/material.dart';
import 'package:holistic/providers/login_provider.dart';
import 'package:holistic/providers/news_app_provider.dart';
import 'package:holistic/providers/registration_provider.dart';
import 'package:holistic/screens/news_app_screen.dart';
import 'package:holistic/screens/registration_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => NewsAppProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RegistrationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
