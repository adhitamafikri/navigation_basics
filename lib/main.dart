import 'package:flutter/material.dart';
import 'package:navigation_basics/classes/screen_arguments.dart';

import 'package:navigation_basics/routes/home.dart';
import 'package:navigation_basics/routes/profile.dart';
import 'package:navigation_basics/routes/basic_asynchrony.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Basics',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // If `initialRoute` exists, don't define `home`
      // home: const Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        // '/profile': (context) => const Profile(),
        '/basic-asynchrony': (context) => const BasicAsynchrony(),
      },

      // We can also define the routes this way
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/profile':
                  final screenArgs = settings.arguments as ScreenArguments;
                  return Profile(
                    screenTitle: screenArgs.screenTitle,
                    screenDescription: screenArgs.screenDescription,
                  );
                default:
                  return Container();
              }
            });
      },
    );
  }
}
