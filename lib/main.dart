import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'bloc/application_bloc.dart';
import 'middlewares/login_middleware.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: MaterialApp(
        title: 'ItaLú',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginMiddleware(),
      ),
    );
  }
}
