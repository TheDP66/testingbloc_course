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
      home: const HomePage(),
    ),
  );
}

// 1.LoadAction. Create LoadAction abstract
// ? Abstract class cant be initialize
@immutable
abstract class LoadAction {
  const LoadAction();
}

// 4.LoadAction.
// ? whenever this action dispatched this action will required url to be loaded
@immutable
class LoadPersonsAction extends LoadAction {
  late final PersonUrl url;
}

// 2.LoadAction. Create enum
enum PersonUrl {
  persons1,
  persons2,
}

// 3.LoadAction. Create extension on PersonUrl
extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.persons1:
        return 'http://127.0.0.1:5500/api/persons1.json';
      case PersonUrl.persons2:
        return 'http://127.0.0.1:5500/api/persons2.json';
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final Bloc myBloc;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}
