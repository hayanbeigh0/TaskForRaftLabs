import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logic/blocs/greeting/greeting_bloc.dart';
import '../logic/blocs/internet/internet_bloc.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          BlocBuilder<GreetingBloc, GreetingState>(
            builder: (context, state) {
              if (state is GoodMorning) {
                return const GreetingMessage(
                    greetingMessage: 'Good Morning!👋🏻');
              }
              if (state is GoodAfternoon) {
                return const GreetingMessage(
                    greetingMessage: 'Good Afternoon!👋🏻');
              }
              if (state is GoodEvening) {
                return const GreetingMessage(
                    greetingMessage: 'Good Evening!👋🏻');
              }
              return const SizedBox();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Welcome to our App!',
            style: GoogleFonts.lato(fontSize: 18),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetConnected) {
                return const SizedBox();
              }
              if (state is InternetDisconnected) {
                return Text(
                  state.msg,
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                );
              }
              return const Text('');
            },
          ),
        ],
      ),
    );
  }
}

class GreetingMessage extends StatelessWidget {
  const GreetingMessage({
    Key? key,
    required this.greetingMessage,
  }) : super(key: key);

  final String greetingMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      greetingMessage,
      style: GoogleFonts.lato(fontSize: 30),
    );
  }
}
