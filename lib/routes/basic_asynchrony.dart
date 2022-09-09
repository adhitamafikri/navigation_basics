import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BasicAsynchrony extends StatelessWidget {
  const BasicAsynchrony({Key? key}) : super(key: key);

  void _printAsync(String text) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    print(text);
  }

  void _onButtonClick() async {
    print('Ane habib jindan');
    _printAsync('Istilah Kate');
    print('Jikalau ente ditendang');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Basic Asynchrony')),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
                child: ListView(
              children: [
                const Text('basic Asynchrony'),
                ElevatedButton(
                    onPressed: _onButtonClick,
                    child: const Text('Press Button to Print Result'))
              ],
            ))
          ]),
        ));
  }
}
