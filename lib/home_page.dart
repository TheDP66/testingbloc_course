import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingbloc_course/bloc/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ? define watcher (example line: 71-76)
    var state = context.watch<CounterCubit>().state;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ? only listen to changes
            // BlocListener<CounterCubit, int>(
            //   listener: (context, state) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text("blocListener: value changed"),
            //       ),
            //     );
            //   },
            //   child: Container(),
            // ),
            // ? listen and build changes
            // BlocConsumer<CounterCubit, int>(
            //   listenWhen: (previous, current) {
            //     if (current == 3 || current == 1) {
            //       return true;
            //     }
            //     return false;
            //   },
            //   buildWhen: (previous, current) {
            //     if (current != 3 || current != 1) {
            //       return true;
            //     }
            //     return false;
            //   },
            //   listener: (context, state) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text("blocConsumer: value changed"),
            //       ),
            //     );
            //   },
            //   builder: (context, state) {
            //     return Text(
            //       state.toString(),
            //       style: const TextStyle(
            //         fontSize: 30,
            //       ),
            //     );
            //   },
            // ),
            // ? only build changes
            // BlocBuilder<CounterCubit, int>(
            //   builder: (context, state) {
            //     return Text(
            //       state.toString(),
            //       style: const TextStyle(
            //         fontSize: 30,
            //       ),
            //     );
            //   },
            // ),
            // ? catch changes using watch (line: 10)
            Text(
              state.toString(),
              style: const TextStyle(
                fontSize: 28,
              ),
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
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrease();
                  },
                  child: const Text('decrease'),
                ),
              ],
            ),
            Builder(
              builder: (context) {
                print("rebuild");
                return Text(
                  state.toString(),
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
