import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/blocs/greeting/greeting_bloc.dart';
import '../logic/blocs/internet/internet_bloc.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<GreetingBloc, GreetingState>(
            builder: (context, state) {
              if (state is GoodMorning) {
                return const Center(
                  child: Text('Good Morning!'),
                );
              }
              if (state is GoodAfternoon) {
                return const Center(
                  child: Text('Good Afternoon!'),
                );
              }
              if (state is GoodEvening) {
                return const Center(
                  child: Text('Good Evening!'),
                );
              }
              return const SizedBox();
            },
          ),
          const Text('Welcome!'),
          BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetConnected) {
                return const SizedBox();
              }
              if (state is InternetDisconnected) {
                return Text(state.msg);
              }
              return const Text('');
            },
          )
        ],
      ),
    );
  }
}
