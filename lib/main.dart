import 'package:flutter/material.dart';
import 'package:hora/screens/favorite_screen.dart';
import 'package:hora/screens/parameters_screen.dart';
import 'package:hora/widgets/bottom_tab_screen.dart';
import 'package:hora/common/style.dart';

import 'package:provider/provider.dart';

import 'models/bottomNavigationBarModel.dart';
import 'models/favorite_model.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

BuildContext testContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return FavModel();
          },
        ),
        Provider(create: (context) => BottomNavigationBarModel()),
        ListenableProvider(create: (context) => FavModel())
      ],
      child: MaterialApp(
        title: 'Hora',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kappBar,
          primaryColorLight: ksurface,
          accentColor: ksearch,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: white87),
            headline2: TextStyle(fontSize: 14, color: Colors.white60),
            headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            bodyText1: TextStyle(fontSize: 14.0, color: Colors.white38),
          ),
          scaffoldBackgroundColor: kback,
          shadowColor: Colors.black,
        ),
        home: BottomTabScreen(),
        initialRoute: '/',
        routes: {
          '/first': (context) => Home(),
          '/second': (context) => Favorite(),
          '/third': (context) => Parameters(),
        },
      ),
    );
  }
}
