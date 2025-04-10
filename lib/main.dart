import 'package:flutter/material.dart';
import 'package:shimmerpoc/presentation/bloc/user_bloc.dart';
import 'package:shimmerpoc/presentation/screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserBloc(),
        child: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
