import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result( {super.key, required this.ismale, required this.result, required this.age, });
  final bool ismale;
  final double result;
  final int age;

  String get resultphrase{
    String phrase='';
    if(result>=30)
      {
        phrase="Obese";
      }
    else if(result>25&&result<30)
    {
      phrase="OverWeight";
    }
    else if(result >= 18.5 && result <= 24.9)
    {
      phrase="Normal";
    }
    else
    {
      phrase="thin";
    }
    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.teal,
            title: Center(
              child: Text("Result",style:
              TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
                  textAlign: TextAlign.center,
            ),
          ),
        ),
        body: SafeArea(child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Gender: ${ ismale? "male" : "female"}",style:Theme.of(context).textTheme.headlineLarge),
              Text("Result: ${result.toStringAsFixed(2)}",style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,),
              Text("Healthiness: $resultphrase",style: Theme.of(context).textTheme.headlineLarge,),
              Text("Age: $age",style: Theme.of(context).textTheme.headlineLarge,),

            ],
          ),
        )),
      );

  }
}
