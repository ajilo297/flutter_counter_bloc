import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/blocs/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: BlocBuilder<CounterEvent, int>(
        bloc: _counterBloc,
        builder: (BuildContext context, int count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _floatingActionButton(
            onPressed: () => _counterBloc.dispatch(CounterEvent.increment),
            child: Icon(Icons.add),
          ),
          _floatingActionButton(
            onPressed: () => _counterBloc.dispatch(CounterEvent.decrement),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  Widget _floatingActionButton(
      {@required VoidCallback onPressed, @override Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}