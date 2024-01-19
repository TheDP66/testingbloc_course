import 'dart:math' as math show Random;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: true,
      home: const TempHomePage(),
    ),
  );
}

const names = [
  'Foo',
  'Bar',
  'Baz',
];

// ? 1.CubitFunc. Create function to pick random name
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

// 1.Cubit. Define Cubit class provide initial state
class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  // ? 2.CubitFunc. Allow pickRandomName in Cubit
  void pickRandomName() {
    emit(
      names.getRandomElement(),
    );
  }
}

class TempHomePage extends StatefulWidget {
  const TempHomePage({super.key});

  @override
  State<TempHomePage> createState() => _TempHomePageState();
}

class _TempHomePageState extends State<TempHomePage> {
  // 2.Cubit. Define cubit late
  late final NamesCubit cubit;

  // 3.Cubit. Initialize cubit
  @override
  void initState() {
    super.initState();
    cubit = NamesCubit();
  }

  // 4.Cubit. Close cubit
  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      // 5.Cubit. StreamBuilder on cubit.stream
      body: StreamBuilder<String?>(
        stream: cubit.stream,
        builder: (context, snapshot) {
          final button = TextButton(
            onPressed: () => cubit.pickRandomName(),
            child: const Text('Pick a random name'),
          );

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                  Text(snapshot.data ?? ''),
                  button,
                ],
              );
            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
