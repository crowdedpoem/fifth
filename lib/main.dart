import 'package:fifth/user.dart';

import 'package:fifth/home_screen.dart';
import 'package:fifth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fifth/auth.dart';
import 'package:provider/provider.dart';

main() {
  runApp(App());

//gets rid of notifications on the top of screen
  // SystemChrome.setEnabledSystemUIOverlays([]);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //replacing wrapper class
    Widget _wrapper(User user) {
      //return hello or authenticate
      if (user == null) {
        return RegistrationScreen();
      } else {
        return View();
      }
    }

    //This works!!
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: Consumer<User>(
        builder: (_, rt, hef) {
          return MaterialApp(
            home: _wrapper(rt),
          );
        },
      ),
    );
  }

  // ThemeData _theme() {
  //   return ThemeData(
  //     appBarTheme: AppBarTheme(
  //       textTheme: TextTheme(headline6: AppBarTextStyle),
  //     ),
  //     textTheme: TextTheme(
  //       headline6: TitleTextStyle,
  //       bodyText2: Body1TextStyle,
  //     ),
  //   );
  // }
}
