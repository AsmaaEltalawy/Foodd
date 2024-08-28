import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Theme%20Provider.dart';

import 'counter_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Consumer<CounterModel>(
      builder: (context, value, child) => Scaffold(
        // final consumer = Provider.of<CounterModel>(context);
        appBar: AppBar(
          title: Text('Test'),
          actions: [
            Switch(
                    value:provider.isDark ,
                    onChanged: (value) {
                      provider.toggleTheme();
                    },activeColor: Colors.green,

            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                value.current_number.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.increment();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
