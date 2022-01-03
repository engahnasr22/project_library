import 'package:app_library/constant/colors.dart';
import 'package:app_library/screens/projects/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kDefaultBackgroundColor,
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kDefaultTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(         
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: kDefaultBackgroundColor,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: kDefaultBackgroundColor,
          elevation: 0.0,
        )
      ),
      home:  OverviewProjectsHome(),
    );
  }
}

