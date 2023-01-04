import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_menegement/bloc/counter_bloc.dart';

class page_state_show extends StatelessWidget {
  page_state_show({super.key});

  @override
  Widget build(BuildContext context) {
    // final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
          // bloc: counterBloc,
          builder: (context, state) {
        return Center(
          child: Text(
            state.count.toString(),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementEven());
              },
              elevation: 30,
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrementEven());
              },
              elevation: 30,
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
