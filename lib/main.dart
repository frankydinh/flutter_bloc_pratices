import 'package:bloc_pattern_sample/cubit/counter_cubit.dart';
import 'package:bloc_pattern_sample/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
    //   return MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //   );
    // });
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  _incrementCounter(BuildContext context) {
    BlocProvider.of<CounterCubit>(context).increment();
  }

  _decrementCounter(BuildContext context) {
    BlocProvider.of<CounterCubit>(context).decrement();
    // context.read<CounterCubit>().decrement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        // body: const CounterView(),
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () => _incrementCounter(context),
              // onPressed: () => context.read<CounterCubit>().increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => _decrementCounter(context),
              // onPressed: () => context.read<CounterCubit>().decrement(),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
