import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/logic/blocs/greeting/greeting_bloc.dart';
import 'package:flutter_task/logic/blocs/internet/internet_bloc.dart';
import 'package:flutter_task/repository/public_api_repository.dart';
import 'package:flutter_task/screens/greetings_screen.dart';
import 'package:flutter_task/screens/home_screen.dart';
import 'package:flutter_task/screens/web_view_screen.dart';

import '/utils/app_colors.dart';
import 'logic/blocs/public_api/public_api_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc()..add(CheckInternetEvent()),
        ),
        BlocProvider<PublicApiBloc>(
          create: (context) => PublicApiBloc(
            PublicApiRepository(),
            BlocProvider.of<InternetBloc>(context),
          ),
        ),
        BlocProvider<GreetingBloc>(
          create: (context) => GreetingBloc()..add(GreetingStart()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 33, 124, 243),
            secondary: const Color.fromARGB(132, 33, 124, 243),
          ),
        ),
        home: const MyHomePage(title: 'Flutter Task'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    GreetingsScreen(),
    WebViewScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gesture_outlined),
            label: 'Greeting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Webview',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.colorPrimary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
