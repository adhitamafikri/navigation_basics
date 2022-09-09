import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation_basics/classes/screen_arguments.dart';

class Profile extends StatefulWidget {
  final String screenTitle;
  final String screenDescription;

  const Profile(
      {Key? key, required this.screenTitle, required this.screenDescription})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _navigateToHome() {
    const word = 'Welcome Back to Home Page';
    Navigator.of(context).pop(word);
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('This is bottom sheet modal'),
                  const SizedBox(height: 32),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close BottomSheet'))
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.screenTitle)),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
                child: ListView(
              children: [
                Text(widget.screenDescription),
                ElevatedButton(
                    onPressed: _navigateToHome,
                    child: const Text('Go to Home')),
                const SizedBox(height: 32),
                ElevatedButton(
                    onPressed: _showBottomSheet,
                    child: const Text('Show BottomSheet Modal'))
              ],
            ))
          ]),
        ));
  }
}
