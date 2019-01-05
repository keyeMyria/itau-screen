import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../bloc/application_bloc.dart';
import '../screens/home/home_screen.dart';
import '../screens/login_screen.dart';

class LoginMiddleware extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: BlocProvider.of<ApplicationBloc>(context).outAcessou,
      builder: (context, snapshot) {
        return AnimatedCrossFade(
          firstCurve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          firstChild: LoginScreen(),
          secondChild: HomeScreen(),
          crossFadeState: snapshot.hasData && snapshot.data
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
        );
      },
    );
  }
}
