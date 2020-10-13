import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerCounter/blocs/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CounterPage(title: 'Counter using Provider'),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  final String title;
  CounterPage({this.title});
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Container(
        child: Center(
          child: Text(
            counterBloc.counter.toString(),
            style: TextStyle(fontSize: 25.0, color: Colors.red),
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child:Icon(Icons.add),onPressed: counterBloc.increment),
    );
  }
}
