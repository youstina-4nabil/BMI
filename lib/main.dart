import 'package:bmi_calc/home.dart';
import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';

void main() {
runApp( const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        canvasColor: Colors.black,
        // iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor:Colors.teal)),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,

          ),
            headlineMedium: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,

            )


        ),

          
      ),


      home: Home());
      // home: Result(ismale: true, result: 12, age: 20),

  }
}



