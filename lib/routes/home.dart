import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:navigation_basics/classes/screen_arguments.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Methods
  Future<void> _navigateToProfile(BuildContext context) async {
    // final result = await Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const Profile()));

    /**
     * Prefer using this `pushNamed` method instead of only `push`
     * Because we can define the routes just like in vue or react
     */
    final result = await Navigator.of(context).pushNamed('/profile',
        arguments: ScreenArguments(
            'Profile Page Yahoo', 'See the Profile Info of this User'));

    if (!mounted) return;
    if (result != null && result is String) {
      _showSnackbar(context, result);
    }
  }

  Future<void> _navigateToBasicAsynchrony(BuildContext context) async {
    // final result = await Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const Profile()));

    /**
     * Prefer using this `pushNamed` method instead of only `push`
     * Because we can define the routes just like in vue or react
     */
    final result = await Navigator.of(context).pushNamed('/basic-asynchrony');

    if (!mounted) return;
    if (result != null && result is String) {
      _showSnackbar(context, result);
    }
  }

  void _showSnackbar(BuildContext context, String value) {
    SnackBar snackBar = SnackBar(content: Text(value));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
                child: ListView(
              children: [
                const Text('This is homepage'),
                const SizedBox(height: 32),
                ElevatedButton(
                    onPressed: () => _navigateToProfile(context),
                    child: const Text('Go to Profile')),
                const SizedBox(height: 32),
                ElevatedButton(
                    onPressed: () => _navigateToBasicAsynchrony(context),
                    child: const Text('Go to Basic Asynchrony')),
              ],
            ))
          ]),
        ));
  }
}
