import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/blocs/counter_bloc.dart';
import 'package:flutter_counter/pages/counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      home: BlocProvider(
        bloc: _counterBloc,
        child: CounterPage(),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
