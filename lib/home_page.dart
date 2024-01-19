import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingbloc_course/bloc/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increase();
                    },
                    child: const Text('increase'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrease();
                    },
                    child: const Text('decrease'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
